# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Tasks::MargeWikimovies <  Tasks::Wikiapi

  def self.execute
    Medium.all.each do |medium|
      case medium.name
      when 'Movies'
        @@movies_medium_id = medium.id
      when 'People'
        @@people_medium_id = medium.id
      end
    end

    titles = WikiCoordination.where('match_rank = ?', 'A')
    titles.each do |title|
      url = WIKIURL + '?format=' + WIKIFORMAT + '&action=' + WIKIACTION +
        '&prop=' + WIKIPROP + '&rvprop=' + WIKIRVPROP +
        '&pageids=' + title.pageid
      uri = URI.parse(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      https.start
      res = https.get(uri.path + '?' + uri.query)
      if res.code == '200'
        result = JSON.parse(res.body)
        contents = result['query']['pages'][title.pageid]['revisions'][0]['*']
      else
        puts "OMG!! #{res.code} #{res.message}"
      end
      @@movie_element = {
        wiki_coordination_id: title.id,
        status: 0,
        medium_id: @@movies_medium_id
        }
      @@movie = {}
      @@people = {}

      # 更新処理
      begin
        ActiveRecord::Base.transaction do
          self.get_movieinfo(contents)
          element_id = self.save_element(@@movie_element)
          @@movie_element[:id] = @@movie[:element_id] = element_id
          self.save_movie(@@movie)
          self.save_people(@@people)
          puts @@movie_element[:name_jp] + '::コミット'
        end
      rescue => e
        puts e.message
        ActiveRecord::Rollback
      end
    end
  end

  def self.save_element(element)
    m_element = Element.find_by(name_jp: element[:name_jp], medium_id: element[:medium_id])
    if m_element.blank?
      m_element = Element.create!(element)
    else
      m_element.update(element)
    end
    return m_element.id
  end

  def self.save_movie(movie)
    m_movie = Movie.find_by(element_id: movie[:element_id])
    if m_movie.blank?
      m_movie = Movie.create!(movie)
    else
      m_movie.update(movie)
    end
    @@movie[:id] = m_movie.id
  end

  def self.save_person(person)
    m_person = Person.find_by(element_id: person[:element_id])
    if m_person.blank?
      m_person = Person.create!(person)
    else
      m_person.update(person)
    end
    @@person[:id] = m_person.id
  end

  def self.save_people(people)
    people.each do |key, val|
      @@person = {}
      next if val.blank?
      # wikiテーブルへ登録
      m_wiki = WikiCoordination.find_by(title: val, kind: 2)
      if m_wiki.blank?
        m_wiki = WikiCoordination.create!(title: val, kind: 2)
      end
      medium = Medium.where(name: 'People')
      person_element = {
        wiki_coordination_id: m_wiki.id,
        name: val,
        name_jp: val,
        medium_id: @@people_medium_id
        }
      element_id = self.save_element(person_element)
      @@person = {element_id: element_id}
      self.save_person(@@person)
      @@person[:role] = key
      self.save_movie_people(@@movie, @@person)
    end
  end

  def self.save_movie_people(movie, person)
    role = MovieRole.find_by(:name => person[:role])
    return if role.blank?
    hash = {
      movie_id: movie[:id],
      person_id: person[:id],
      movie_role_id: role.id
      }
    data = MoviePerson.find_by(hash)
    if data.blank?
      data = MoviePerson.create!(hash)
    end
  end

  private

    # 映画単位の配列を作成
    def self.get_movieinfo(contents)
      self.get_infobox(contents)
      self.get_introduction(contents)
      self.get_story(contents)
    end

    # 映画情報部分を取得
    def self.get_infobox(contents)
      box_info = contents.match(/{{Infobox Film\n.*\n}}/m)
      box_str = box_info.to_s.gsub(/{{.*}}|\n|\[\[|\]\]|<.*?>/, '')
      arr = box_str.split('|')
      arr.each do |row|
        key = row.split('=')[0].to_s.gsub(/^\s|\s$/, '')
        val = row.split('=')[1].to_s.gsub(/^\s|\s$/, '')
        case key
        when '作品名' then
          @@movie_element[:name_jp] = val
        when '原題' then
          @@movie_element[:name] = val
        when '監督' then
          @@people[:director] = val
        when '脚本' then
          @@people[:scenario] = val
        when '制作' then
          @@movie[:distributed] = val
        when '製作総指揮' then
          @@people[:producer] = val
        when '公開' then
          break if !val.match(/\d{4}(\/|年)\d{1,2}(\/|月)\d{1,2}/)
          val = val.gsub(/(\/|年|月)/, '-')
          @@movie[:opendate] = Date.strptime(val, '%Y-%m-%d')
        when '予算' then
          @@movie[:budget] = val
        when '製作国' then
          res = Country.find_by name_jp: val unless val.empty?
          id = res.blank? ? nil : res.id
          @@movie[:country_id] = id
        when '言語' then
          res = Language.find_by name_jp: val unless val.empty?
          id = res.blank? ? nil : res.id
          @@movie[:language_id] = id
        when '原作' then
          @@movie[:original] = val
        when '興行収入' then
          @@movie[:box_office] = val
        end
      end
      if @@movie_element[:name].blank?
        @@movie_element[:name] = @@movie_element[:name_jp]
      end
    end

    # introduction部分を取得
    def self.get_introduction(contents)
      trg_str = contents.match(/『'''#{@@movie_element[:name_jp]}'''』.*\n/).to_s
      trg_str = trg_str.gsub(/『'''|'''』|''|<.*?>|\n/, '')
      trg_str = trg_str.gsub(/\[\[.*?\]\]/) do |match|
        match.gsub(/\[\[.*?\|/, '').gsub(/\[\[|\]\]/, '')
      end
      @@movie_element[:introduction] = trg_str
    end

    # story部分を取得
    def self.get_story(contents)
      trg_str = contents.match(/(== ストーリー ==|== あらすじ ==)(.|\n)*?==/).to_s
      trg_str = trg_str.gsub(/(== ストーリー ==|== あらすじ ==)|\n|==|<.*?>/, '')
      trg_str = trg_str.gsub(/\[\[.*?\]\]/) do |match|
        match.gsub(/\[\[.*?\|/, '').gsub(/\[\[|\]\]/, '')
      end
      @@movie[:story] = trg_str
    end

end

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Tasks::CoordinationWikimovies < Tasks::Wikiapi

  def self.execute
    movies = WikiCoordination.where('match_rank not in (?) or match_rank is null', 'A')
    movies.each do |movie|
      title = title_org = movie.title
      flag = 0
      while flag < 3 do
        url = WIKIURL + '?format=' + WIKIFORMAT + '&action=' + WIKIACTION +
          '&prop=' + WIKIPROP + '&rvprop=' + WIKIRVPROP +
          '&titles=' + URI.encode_www_form_component(title)
        uri = URI.parse(url)
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true
        https.start
        res = https.get(uri.path + '?' + uri.query)
        if res.code == '200'
          result = JSON.parse(res.body)
          # wikiのページid
          key = result['query']['pages'].keys[0]
          if key == '-1'
            movie.update(:match_rank => 'C')
          else
            # wikiのコンテンツ内容
            contents = result['query']['pages'][key]['revisions'][0]['*']
            if contents.match(/{{Infobox Film/)
              movie.update(:pageid => key, :match_rank => 'A')
	      break
	    else
              movie.update(:pageid => key, :match_rank => 'B')
            end
          end
        else
          movie.update(:match_rank => 'E')
        end
        # タイトルを変える
        if flag == 0
          flag = 1
          title = title.tr('０-９ａ-ｚＡ-Ｚ！', '0-9a-zA-Z!')
        elsif flag == 1
          flag = 2
          title = title + '(映画)' if /(映画)$/ =~ title
        else
          flag = 3
	  title = title_org
        end
        movie.update(:title => title)
      end
    end
  end

end

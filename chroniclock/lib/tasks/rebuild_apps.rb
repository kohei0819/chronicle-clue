# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

TASKS = {
  # for generate models
  models: {
    # masters
    wiki_coordination: 'pageid title kind match_rank',
    medium: 'name name_jp mark:integer level:integer sort:integer',
    country: 'name name_jp sort:integer',
    language: 'name name_jp sort:integer shortened',
    category: 'name name_jp mark:integer parent:integer sort:integer',
    element: 'medium:references name name_jp name_kana introduction:text country:references status:integer wiki_coordination:references',
    # elements
    person: 'element:references sex:integer blood birthday:date come_from agency image url',
    movie: 'element:references story:text original url image movie country:references:references language:references opendate:date time:integer production distributed budget box_office',
    company: 'element:references address startdate:date enddate:date image url',
    group: 'element:references startdate:date enddate:date image url',
    # elements masters
    person_role: 'name name_jp sort:integer',
    movie_role: 'name name_jp sort:integer',
    # element relations
    movie_category: 'movie:references category:references',
    movie_language: 'movie:references language:references',
    movie_person: 'movie:references person:references movie_role:references charactor_name charactor_name_jp',
    # elements sub
    movie_history: 'user:references movie:references score:integer comment:text view_date:date view_place view_with:integer',
    movie_favorite: 'user:references movie:references'
  },

}

class Tasks::RebuildApps

  def self.run
    TASKS.each do |key, arr|
      if key == :models
        # destroy
        destroy_arr = arr.keys.reverse
        destroy_arr.each do |name|
          # remove rails_admin
          file_name = 'app/admin/' + name.to_s + '.rb'
          if File.exists? file_name
            puts '[remove ' + file_name + ' because already exists.]'
            result = system('rm -f ' + file_name)
          end
          # make model name
          file_name = 'app/models/' + name.to_s + '.rb'
          if File.exists? file_name
            puts '[Destroy ' + name.to_s + ' because already exists.]'
            result = system('rails destroy model ' + name.to_s)
          end
        end

        # generate
        arr.each do |name, str|
          puts '[Generate ' + name.to_s + '.]'
          result = system('rails generate model ' + name.to_s + ' ' + str)
          puts '[Add rails_admin ' + name.to_s + '.]'
          result = system('rails g active_admin:resource ' + name.to_s)
        end
      end

      # rake
      puts '[rake db:migrate:reset]'
      result = system('rake db:migrate:reset')
      puts '[rake db:seed]'
      result = system('rake db:seed')

      # gems
    end
  end
	
  def self.run_command
    GANARATORS.each do |key, arr|
      if key == :models
        # destroy
        destroy_arr = arr.keys.reverse
        destroy_arr.each do |name|
          ARGV << 'model'
          ARGV << name.to_s
          # make model name
          file_name = 'app/models/' + name.to_s + '.rb'
          if File.exists? file_name
		  puts 'aaa'
            Rails::CommandsTasks.new(ARGV).destroy
          end
          ARGV.slice!(0, ARGV.count)
        end

        # generate
        arr.each do |name, str|
          ARGV << 'model'
          ARGV << name.to_s
          ARGV << str.split(' ')
          Rails::CommandsTasks.new(ARGV).generate
          ARGV.slice!(0, ARGV.count)
        end
      end
    end
  end

end

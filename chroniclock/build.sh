# !/bin/bash
# add Gemfile
# gem 'devise'
# gem 'omniauth-twitter'
# gem 'activeadmin'
# gem 'materialize-sass'

#/home/ubuntu/.rbenv/shims/rails g devise:install
#/home/ubuntu/.rbenv/shims/rails g active_admin:install 

/home/ubuntu/.rbenv/shims/rails g migration AddColumnToUsers nickname sex:integer birthday:date image
# master
/home/ubuntu/.rbenv/shims/rails g model medium name name_jp mark:integer level:integer sort:integer
/home/ubuntu/.rbenv/shims/rails g model country name name_jp sort:integer
/home/ubuntu/.rbenv/shims/rails g model language name name_jp sort:integer shortened
/home/ubuntu/.rbenv/shims/rails g model category name name_jp mark:integer parent:integer sort:integer

# contents
/home/ubuntu/.rbenv/shims/rails g model wiki_coordination pageid title kind match_rank
/home/ubuntu/.rbenv/shims/rails g model element medium:references name name_jp name_kana introduction:text wiki_coordination:references status:integer
/home/ubuntu/.rbenv/shims/rails g model movie element:references story:text original url image movie country:references language:references opendate:date time:integer production distributed budget box_office wiki_coordination:references
/home/ubuntu/.rbenv/shims/rails g model person element:references country:references sex:integer blood birthday:date come_from introduction image url
/home/ubuntu/.rbenv/shims/rails g model movie_category movie:references category:references
/home/ubuntu/.rbenv/shims/rails g model movie_country movie:references country:references
/home/ubuntu/.rbenv/shims/rails g model movie_language movie:references language:references
/home/ubuntu/.rbenv/shims/rails g model movie_role name name_jp sort:integer
/home/ubuntu/.rbenv/shims/rails g model movie_person movie:references person:references movie_role:references charactor_name charactor_name_jp
/home/ubuntu/.rbenv/shims/rails g model movie_history user:references movie:references score:integer comment:text view_date:date view_place:integer view_with:integer
/home/ubuntu/.rbenv/shims/rails g model movie_favorite user:references movie:references
/home/ubuntu/.rbenv/shims/rails g model movie_want user:references movie:references

/home/ubuntu/.rbenv/shims/rails db:migrate:reset
/home/ubuntu/.rbenv/shims/rails db:seed

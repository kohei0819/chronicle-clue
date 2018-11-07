class Movie < ApplicationRecord
  belongs_to :element
  belongs_to :country
  belongs_to :language
  belongs_to :wiki_coordination
end

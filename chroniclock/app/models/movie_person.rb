class MoviePerson < ApplicationRecord
  belongs_to :movie
  belongs_to :person
  belongs_to :movie_role
end

class MovieCountry < ApplicationRecord
  belongs_to :movie
  belongs_to :country
end

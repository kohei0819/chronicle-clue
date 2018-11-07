class MovieLanguage < ApplicationRecord
  belongs_to :movie
  belongs_to :language
end

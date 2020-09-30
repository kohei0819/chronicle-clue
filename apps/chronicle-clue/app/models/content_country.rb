class ContentCountry < ApplicationRecord
  belongs_to :content
  belongs_to :country
end

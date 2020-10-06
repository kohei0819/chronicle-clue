class Content < ApplicationRecord
  belongs_to :media
  has_one :film
  has_many :content_countries, dependent: :destroy
  has_many :country, through: :content_countries
  has_many :content_languages, dependent: :destroy
  has_many :language, through: :content_languages
  has_many :content_categories, dependent: :destroy
  has_many :category, through: :content_categories
end

class ContentLanguage < ApplicationRecord
  belongs_to :content
  belongs_to :language
end

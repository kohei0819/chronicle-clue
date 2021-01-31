class Review < ApplicationRecord
  belongs_to :user
  belongs_to :content
  belongs_to :watch_method
  belongs_to :watch_with
end

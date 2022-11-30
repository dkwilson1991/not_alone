class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :camp
  validates :contant, presence: true, length: { minimum: 10 }
end

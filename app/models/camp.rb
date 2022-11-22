class Camp < ApplicationRecord
  has_many :assignments
  belongs_to :user
  has_many_attached :photos

  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :required_number_volunteers, presence: true
  validates :director_email, presence: true
  validates :camp_name, presence: true
  validates :required_roles, presence: true
end

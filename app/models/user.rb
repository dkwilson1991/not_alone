class User < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :camps, dependent: :destroy
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :birthday, presence: true
  validates :training, presence: true
  validates :admin_status, inclusion: { in: [true, false] }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

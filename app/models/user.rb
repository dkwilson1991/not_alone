class User < ApplicationRecord
  has_many :assignments
  has_many :campsc
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
  validates :admin_status, presence: true
end

class Camp < ApplicationRecord
  has_many :assignments, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :required_number_volunteers, presence: true
  validates :camp_name, presence: true
  # validates :required_roles, presence: true
  validates :description, presence: true
  acts_as_taggable_on :tags
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :invite_volunteers

  def invite_volunteers
    @users = User.all
    @users.each do |user|
      UserMailer.with(user: user, camp: self).invitation.deliver_now if User.near(self.address, 50)
    end
  end
end

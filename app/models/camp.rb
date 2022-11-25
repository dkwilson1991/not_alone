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
  after_create :create_assignment

  def create_assignment
    Assignment.create(status: "admin_confirm", user: self.user, camp: self)
  end

  def invite_volunteers
    @users = User.near(self.address)
    @users.each do |user|
      UserMailer.with(user: user, camp: self).invitation.deliver_now
    end
  end
end

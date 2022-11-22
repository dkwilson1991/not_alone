class Assignment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :camp, dependent: :destroy
  # enum status: { pending: "pending", confirm: "confirm", decline: "decline"}, _default: :pending

  # def pending?
  #   status == "pending"
  # end

  # validates :final_volunteer_count, presence: true
  # validates :roles, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :status, presence: true
end

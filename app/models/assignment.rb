class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :camp
  enum status: { pending: "pending", confirm: "apply", decline: "decline" }, _default: :pending

  def pending?
    status == "pending"
  end

  validates :status, presence: true
  validates :camp, uniqueness: { scope: :user }
end

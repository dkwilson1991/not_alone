class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :camp
  enum status: { pending: "pending", admin_confirm: "admin_confirm", admin_decline: "admin_decline", user_apply: "user_apply" }, _default: :pending

  validates :status, presence: true
  validates :camp, uniqueness: { scope: :user }
end

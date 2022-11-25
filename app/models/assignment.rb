class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :camp
  enum status: { pending: "pending", confirm: "confirm", decline: "decline" }, _default: :pending
  after_create :start_time
  after_create :end_time
  def pending?
    status == "pending"
  end

  def start_time
    self.camp.start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def end_time
    self.camp.end_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  validates :status, presence: true
  validates :camp, uniqueness: { scope: :user }
end

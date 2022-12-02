class MailerJob < ApplicationJob
  queue_as :default

  def perform(camp)
    @users = User.all.where('location = ?', 'Sumy, Ukraine')
    roles = ["Crew Leader", "Station Leader: Story Telling", "Station Leader: Snacks", "Station Leader: Crafts", "Station Leader: Games"]
    @users.each_with_index do |user, index|
      @assignment = Assignment.new
      @assignment.camp = camp
      @assignment.user = user
      @assignment.role = roles[index]
      @assignment.status = 'admin_confirm'
      @assignment.save
    end
  end
end

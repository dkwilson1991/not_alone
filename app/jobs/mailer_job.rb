class MailerJob < ApplicationJob
  queue_as :default

  def perform(camp)
    @users = User.all.where('location = ?', 'Sumy, Ukraine')
    roles = [["Crew Leader", "Crew Leader"], ["Story Telling", "Station Leader: Story Telling"], ["Snacks", "Station Leader: Snacks"], ["Crafts", "Station Leader: Crafts"], ["Games", "Station Leader: Games"]]
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

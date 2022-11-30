class MailerJob < ApplicationJob
  queue_as :default

  def perform(camp)
    @users = User.all.where('location = ?', 'Lviv, Ukraine')
    @users.each do |user|
      @assignment = Assignment.new
      @assignment.camp = camp
      @assignment.user = user
      @assignment.status = 'pending'
      @assignment.save
    end
  end
end

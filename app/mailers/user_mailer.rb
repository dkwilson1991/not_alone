class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invitation.subject
  #
  def invitation
    # @camp = params[:camp]
    # @user = params[:user]
    # mail(to: @user.email, subject: 'We have new camp starting soon')
  end
end

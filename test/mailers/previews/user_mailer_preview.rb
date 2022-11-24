# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/invitation
  def invitation
    admin = User.first
    UserMailer.with(user: admin).invitation
  end
end

class UserMailer < ApplicationMailer
  default from: 'timofey.zarenok@gmail.com'

  def welcome_email
    @user = current_user
    mail(to: user.email, subject: 'From Movie-portal with love')
  end
end

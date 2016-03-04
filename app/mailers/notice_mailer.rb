class NoticeMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Thank you for joining OdinFB!")
  end

end

class UserMailer < ActionMailer::Base
  default from: "abstractsurvey@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
  
  def compose_mail(mail)
   
    #raise mail.inspect
    @mail = mail
    attachments["#{mail.photo.original_filename}"] = File.read("#{mail.photo.path}")
    mail(:to => "#{mail.email}", :subject => "#{mail.subject}")
  end
  
end

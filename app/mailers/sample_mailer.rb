class SampleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_post_create.subject
  #
  def send_when_post_create(user)
    @user = user

    mail to: 'tsangkaho12@gmail.com',
         subject: '新しい依頼がありました。'
  end
  def send_when_client_reply(user)
    @user = user

    mail to: 'tsangkaho12@gmail.com',
         subject: 'お客様から返信がありました。'
  end

  def send_when_admin_reply(user)
    @user = user

    mail to: user.email,
         subject: 'お客様の依頼に返信がありました。'
  end

end

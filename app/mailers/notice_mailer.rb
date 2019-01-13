class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_item.subject
  #
  def sendmail_item(item)
    @item = item
    mail to: "yamada@samubuc.co.jp",
      subject:'ご購入ありがとうございます！'
  end
end

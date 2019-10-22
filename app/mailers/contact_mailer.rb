class ContactMailer < ApplicationMailer
  def contact_mail(contact)#@contact = contactとすることでお問い合わせをした人の情報をViewファイルに渡すことができます。
    @contact = contact

    mail to: "okinawan.kkr0713@icloud.com", subject: "お問い合わせの確認メール"#mailメソッドを使用することで送信することができます。to:で送り先、subject:で件名を設定することができます。


  end
end

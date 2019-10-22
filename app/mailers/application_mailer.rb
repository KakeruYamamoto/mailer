class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end


#defaultメソッドを使用して、オプションで指定した値をこのクラス内すべてに適用しています。
#またlayout: 'layout_name'オプションとすることでレイアウトを指定しています。

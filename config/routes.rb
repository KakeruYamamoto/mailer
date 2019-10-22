Rails.application.routes.draw do
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  #gem記述&install後 mount~を記述することで/letter_openerのURLにアクセスした時、メール送信BOXが出現します。
end

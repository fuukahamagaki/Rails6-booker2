# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
#config.action_mailer.raise_delivery_errors = true
  #config.action_mailer.delivery_method = :smtp
  #config.action_mailer.smtp_settings = {
   # port:                 587,
    #address:              'smtp.gmail.com',
    #domain:               'gmail.com',
    #user_name:            'メルアド',#Gmailのアドレス
    #password:             'アプリパスワード',#後述！大苦戦しました！
    #authentication:       'login',
    #nable_starttls_auto: true
  #}
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  provider :vkontakte, ENV['APP_ID'], ENV['APP_SECRET']
  OmniAuth.config.logger = Rails.logger
end

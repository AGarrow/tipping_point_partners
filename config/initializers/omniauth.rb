Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'nuRoWMvGBAGwWodZRx4A', 'B1Q9bLuZ9NukyoCpFd38ksNcaxJAM0XmU8SIsDkqw'
#  provider :facebook, 'APP_ID', 'APP_SECRET'
#  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end
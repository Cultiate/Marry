Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
  Rails.application.secrets.facebook_api_key,
  Rails.application.secrets.facebook_api_secret
  provider :google_oauth2,
  Rails.application.secrets.google_oauth2_api_key,
  Rails.application.secrets.google_oauth2_api_secret
end

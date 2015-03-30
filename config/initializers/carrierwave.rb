CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Rails.application.secrets.aws_access_key,
    :aws_secret_access_key  => Rails.application.secrets.aws_access_token
  }
  config.fog_directory  = Rails.application.secrets.aws_bucket
end

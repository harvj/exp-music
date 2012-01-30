CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => "AWS",
    :aws_access_key_id      => "AKIAIXJUMXD6CMQ6NPYA"
    :aws_secret_access_key  => "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"
    :region                 => "Oregon"
  }
  config.fog_directory = 'album-artwork'
end
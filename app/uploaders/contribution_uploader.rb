# encoding: utf-8

class ContributionUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end

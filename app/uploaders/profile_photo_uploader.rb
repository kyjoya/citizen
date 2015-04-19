# encoding: utf-8

class ProfilePhotoUploader < CarrierWave::Uploader::Base
  storage :file
  # storage :fog

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url(*)
    ActionController::Base.helpers.asset_path("fallback/" +
      [version_name, "default.jpg"].compact.join('_'))
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end

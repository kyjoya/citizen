class PetitionPhotoUploader < CarrierWave::Uploader::Base
  storage :file
  # storage :fog

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end

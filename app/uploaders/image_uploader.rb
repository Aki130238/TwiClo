class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "users/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # 画像の上限を700pxにする
  process :resize_to_limit => [300, 300]

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "default_user.jpg"
  end

  # def default_url(*args)
  #   ActionController::Base.helpers.asset_path("images/" + [version_name, "default_user.jpg"].compact.join('_'))
  # end

end

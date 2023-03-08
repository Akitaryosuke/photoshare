class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def get_image(resize: '500x500', gravity: "center", crop: "500x500+0+0")
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/header.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize: '500x500', gravity: "center", crop: "500x500+0+0").processed
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end

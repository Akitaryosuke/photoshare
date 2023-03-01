class ApplicationController < ActionController::Base
  
  def get_image(resize: '500x500', gravity: "center", crop: "500x500+0+0")
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/header.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize: '500x500', gravity: "center", crop: "500x500+0+0").processed
  end
  
end

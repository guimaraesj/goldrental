module RentsHelper
  # lists helper teve que ser adicionado à mão. está disponivel para todo o programa e permite fazer refactor
  def image_cloudinary(product)
    if product.photo.attached?
      cl_image_path product.photo.key, crop: :fill
    else
      'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'
    end
  end

  def image_cloudinary_tag(product)
    if product.photo.attached?
      cl_image_tag product.photo.key
    else
      image_tag 'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'
    end
  end
end

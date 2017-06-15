module ApplicationHelper
  def image_or_placeholder(thing)
    if thing.photo
      cl_image_tag thing.photo.path #...
    else
      image_tag "" # or cl_image_tag with explicit ID
    end
  end
end

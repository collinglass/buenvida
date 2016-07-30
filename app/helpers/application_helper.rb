module ApplicationHelper
  def alert_for(flash_type)
    { success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(memory)
    return image_tag memory.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive' if memory.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end
end

module ApplicationHelper
  def full_title(page_title)
    base_title = "nil"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def notice_message
    flash_message = []

    flash.each do |type, message|
      type = :success if type.to_sym == :notice
      text = content_tag(:div, message, :class => "control-label has-#{type}")
      flash_message << text if message
    end
 
    content_tag(:div, link_to('x', '#', :class => 'close', 'data-dismiss' => 'alert') + flash_message.join('\n').html_safe, :class => 'carousel flash') unless flash_message.empty?
  end
end

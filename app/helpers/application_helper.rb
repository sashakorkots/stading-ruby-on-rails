module ApplicationHelper
  def nav_tab(title, url, options = {})
    current_page = options.delete :current_page
    css_class = current_page == title ? 'fw-bold' : ''
    options[:class] = options[:class] ? "#{options[:class]} #{css_class}" : css_class

    link_to title, url, options
  end

  def currently_at(current_page)
    render partial: 'shared/menu', locals: { current_page: current_page }
  end

  def full_title(page_title = '')
    base_title = 'OForum'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end

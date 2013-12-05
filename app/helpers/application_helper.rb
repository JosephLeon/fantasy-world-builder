module ApplicationHelper

  # title logic
  def base_title(page_title)
    base_title = "Fantasy World Builder"
    if page_title == base_title
      base_title
    elsif page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # header for home page
  def home_header
    if current_page?('/')
      render 'layouts/homeheader'
    else
      ""
    end
  end

end

module ApplicationHelper

  # title logic
  def base_title(page_title)
    base_title = "Fantasy World Builder"
    if page_title == base_title
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end

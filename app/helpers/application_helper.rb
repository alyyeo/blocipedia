require 'redcarpet'
module ApplicationHelper
    def markdown(text)
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
        markdown = Redcarpet::Markdown.new(renderer, 
            autolink: true, 
            space_after_headers: true,
            highlight: true,
            underline: true
            )
        markdown.render(text).html_safe
    end
end

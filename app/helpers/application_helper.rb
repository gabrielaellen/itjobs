module ApplicationHelper
    include Pagy::Frontend

    def markdown(text)
        MarkdownRenderer.render(text).html_safe
    end
end

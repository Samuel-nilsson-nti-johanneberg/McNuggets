class MimeType

    @@content_resources = {html: "text/html", jpg: "image/jpeg", css: "text/css", png: "image/png", js: "text/javascript"}
    
    def self.for(content_type)
        @@content_resources[content_type]
    end
end
# Class representing MIME types
class MimeType

    # Hash containing common content types and their corresponding MIME types
    @@content_resources = {html: "text/html", jpg: "image/jpeg", css: "text/css", png: "image/png", js: "text/javascript"}
    
    # Returns the MIME type corresponding to the given content type.
    #
    # @param content_type [Symbol] the content type for which to find the MIME type
    # @return [String, nil] the MIME type corresponding to the content type, or nil if not found
    def self.for(content_type)
        @@content_resources[content_type]
    end
end
require 'debug'
require_relative 'mime_type'

class Response

    def initialize(request, match)
        @request = request
        @match = match
    end

    def print_response(session)
        if @match
            status = 200    
            content = @match[:block].call(@match[:params])
            content_type = MimeType.for(:html)
        elsif File.file?("../public#{@request.resource}")
            content = File.open("../public#{@request.resource}", "rb").read
            content_type = MimeType.for(@request.resource.split(".")[1].to_sym)
            status = 200
        else
            status = 404
            content = "nooot"
        end
        
        session.print "HTTP/1.1 #{status}\r\n"
        session.print "Content-Type: #{content_type}\r\n"
        session.print "\r\n"            
        session.print content
        session.close

    end

end

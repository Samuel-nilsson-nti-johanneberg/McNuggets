require 'debug'
require_relative 'mime_type'

# Class representing an HTTP response
class Response

    # Initializes a new Response object.
    #
    # @param request [Request] the HTTP request object
    # @param match [Hash] the matching route information from the router
    def initialize(request, match)
        @request = request
        @match = match
    end

    # Prints the HTTP response to the given session.
    #
    # @param session [TCPSocket] the TCP session to which the response will be sent
    def print_response(session)
        if @match
            status = 200    
            content = @match[:block].call(@match[:params])
            content_type = MimeType.for(:html)
        elsif File.file?("../public#{@request.resource}")
            status = 200
            content = File.open("../public#{@request.resource}", "rb").read
            content_type = MimeType.for(@request.resource.split(".")[1].to_sym)
        else
            status = 404
            content = "<h1>nooot</h1>"
            content_type = MimeType.for(:html)
        end
        
        session.print "HTTP/1.1 #{status}\r\n"
        session.print "Content-Type: #{content_type}\r\n"
        session.print "\r\n"            
        session.print content
        session.close

    end

end

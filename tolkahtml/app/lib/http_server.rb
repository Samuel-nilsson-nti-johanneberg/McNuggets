require 'socket'
require_relative 'router'
require_relative 'request'
require_relative 'response'
require 'debug'

# Class representing an HTTP server
class HTTPServer

    # Initializes a new HTTPServer object.
    #
    # @param router [Router] the router object to use for routing requests
    # @param port [Integer] the port number on which the server will listen
    def initialize(router, port)
        @port = port
        @router = router
    end

    # Starts the HTTP server and listens for incoming requests.
    def start
        server = TCPServer.new(@port)
        puts "Listening on #{@port}"

        while session = server.accept
            data = ""
            while line = session.gets and line !~ /^\s*$/
                data += line
            end
            puts "RECEIVED REQUEST"
            puts "-" * 40
            puts data
            puts "-" * 40

            request = Request.new(data)
            match = @router.match_route(request)

            
            response = Response.new(request, match)
            response.print_response(session)         

        end
    end
end


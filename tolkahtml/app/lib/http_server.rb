require 'socket'
require_relative 'router'
require_relative 'request'
# require_relative 'response'
require 'debug'

class HTTPServer

    def initialize(port)
        @port = port
    end

    def start
        server = TCPServer.new(@port)
        puts "Listening on #{@port}"
        
        router = Router.new
        
      
        router.add_route("GET", "/user/:id") do
            File.read("../views/index.html")
        end
        router.add_route("GET", "/banan/:id/paj") do |id|
            "<h1>Weet #{id}</h1>"
        end
        router.add_route("GET", "/senap/:id/paj/:hej") do |id, hej|
            "<h1>Weet #{id.to_i * hej.to_i}</h1>"
        end
        # router.add_route()

        router.add_route("GET", "/") do
            File.read("../views/index.html")
        end


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
            match = router.match_route(request)
            
            #
            response = Response.new(request, match)
            response.print_response(session)

            # if match

            #     status = 200    
            #     content = match[:block].call(match[:params])
            #     content_type = "text/html"

            # elsif File.file?("../public#{request.resource}")
            #     content = File.open("../public#{request.resource}", "rb").read

            #     request_resource = request.resource.split(".")[1]
            #     if request_resource == "jpg"
            #         content_type = "image/jpeg"
            #     elsif request_resource == "css"
            #         content_type = "text/css"
            #     elsif request_resource == "png"
            #         content_type = "text/png"
            #     elsif request_resource == "js"
            #         content_type = "text/javascript"
            #     end
            # else
                
            #     status = 404
            #     content = "nooot"
            # end
            
            # session.print "HTTP/1.1 #{status}\r\n"
            # session.print "Content-Type: #{content_type}\r\n"
            # session.print "\r\n"            
            # session.print content
            # session.close

        end
    end
end 

server = HTTPServer.new(9292)
server.start
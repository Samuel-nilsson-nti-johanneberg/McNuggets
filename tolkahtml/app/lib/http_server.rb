require 'socket'
require_relative 'router'
require_relative 'request'


class HTTPServer

    def initialize(port)
        @port = port
    end

    def start
        server = TCPServer.new(@port)
        puts "Listening on #{@port}"
        
        router = Router.new
        
        router.add_route("GET", "/user/:id")
        router.add_route("GET", "/banan/:id/paj")

        request_string = File.read('../get-index.request.txt')
        request = Request.new(request_string)
        router.match_route(request)


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
            p match
       
            #request = Request.new(data)
            #router.match_route(request)

            html = "<h1>Hello, World!</h1>"

            session.print "HTTP/1.1 200\r\n"
            session.print "Content-Type: text/html\r\n"
            session.print "\r\n"
            session.print html
            session.close

        end
    end
end 

server = HTTPServer.new(9292)
server.start
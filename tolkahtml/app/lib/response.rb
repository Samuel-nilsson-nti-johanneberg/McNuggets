require 'socket'
require_relative 'router'
require_relative 'request'
require_relative 'http_server'


class Response

    def initialize(port)
    
        if match

            status = 200    
            content = match[:block].call(match[:params])
            content_type = "text/html"

        elsif File.file?("../public#{request.resource}")
            content = File.open("../public#{request.resource}", "rb").read

            content_resources = {jpg: "image/jpeg", css: "text/css", png: "image/png", js: "text/javascript"}
            content_type = content_resources[request.resource.split(".")[1]]
            
            # request_resource = request.resource.split(".")[1]
            # if request_resource == "jpg"
            #     content_type = "image/jpeg"
            # elsif request_resource == "css"
            #     content_type = "text/css"
            # elsif request_resource == "png"
            #     content_type = "image/png"
            # elsif request_resource == "js"
            #     content_type = "text/javascript"
            # end
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

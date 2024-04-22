require 'debug'
class Router

    def initialize()
        @routes = []
    end

    def add_route(method, route, &blk)

        if route.include?(":")
            regex_route = route.gsub(/(:\w+)/, '(\w+)')
            regex_route = regex_route.gsub((/\//), '\/')
            regex_route = Regexp.new(regex_route)

            @routes << {route: regex_route, method: method, block: blk}
        else
            @routes << {route: route, method: method, block: blk}
        end

    end

    def match_route(request)
        p @routes
        @method = request.instance_variable_get(:@method)
        @route = request.instance_variable_get(:@resource)

        @routes.each do |route|
            
            if route[:method] == @method
               
                if params = @route.match(route[:route])
                    if params[2]
                        route[:params] = params[1..]
                    else
                        route[:params] = params[1]
                    end
                    return route
                end

            end
        end
    
        puts "No matching route found for #{request.resource}"
        nil
    end
end
    

require 'debug'
class Router

    def initialize()
        @routes = []
    end


    def add_route(method, route, &blk)
        # @routes.store(route,method)

        # if route.match(/:/)
        if route.include?(":")
            regex_route = route.gsub(/(:\w+)/, '(\w+)')

#            puts regex_route
            regex_route = regex_route.gsub((/\//), '\/')
#            puts regex_route

            # @routes[regex_route] = method
            # @routes[/^#{regex_route}$/] = method
            @routes << {route: route, method: method, block: blk}
        else
            @routes << {route: route, method: method, block: blk}

            # @routes[route] = method

        end

    end

    
    #             regex_route = route.gsub(/(:\w+)/, '(\w+)')
    #             regex_route = regex_route.gsub(/\//, '\/')
    #             @routes[/^#{regex_route}$/] = method


    def match_route(request)
        # binding.break
        p @routes
        @method = request.instance_variable_get(:@method)
        @route = request.instance_variable_get(:@resource)

        @routes.each do |route|
            # route2 = route[:route]
            
            if route[:method] == @method
                
                if @route == route[:route]
                    p "route match"
                    return route
                end
            
            end
            
        end
    
        puts "No matching route found for #{request.resource}"
        nil
    end

end
    

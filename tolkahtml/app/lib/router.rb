require 'debug'
class Router

    def initialize()
        @routes = []
    end


    def add_route(method, route)
        # @routes.store(route,method)

        # if route.match(/:/)
        if route.include?(":")
            regex_route = route.gsub(/(:\w+)/, '(\w+)')

#            puts regex_route
            regex_route = regex_route.gsub((/\//), '\/')
#            puts regex_route

           # @routes[regex_route] = method
            # @routes[/^#{regex_route}$/] = method

#        else
            @routes << {route: route, method: method}

            # @routes[route] = method

        end

    end

    
    #             regex_route = route.gsub(/(:\w+)/, '(\w+)')
    #             regex_route = regex_route.gsub(/\//, '\/')
    #             @routes[/^#{regex_route}$/] = method


    def match_route(request)
        # binding.break
        p request
        p @routes
        @method = request.instance_variable_get(:@method)
        @route = request.instance_variable_get(:@resource)

        @routes.each do |route|
            # route2 = route[:route]

 
            if route[:method] == @method
                
                p "method match"
                if @route == route[:route]
                    p "route match"
                    p route
                end
            
            end

            #return match
            
        end
    
        puts "No matching route found for #{request.resource}"
        nil
    end

    #öppna hash med nyckel
    #ta ut route
    #ta ur method
    #kolla om dem matchar
end
    

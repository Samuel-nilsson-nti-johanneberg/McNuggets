class Router

    def initialize()
        @routes = {}
    end


    def add_route(method, route)
        # @routes.store(route,method)

        if route.match(/:/)
            regex_route = route.gsub(/(:\w+)/, '(\w+)')

            puts regex_route
            regex_route = regex_route.gsub((/\//), '\/')
            puts regex_route

            @routes[regex_route] = method

        else
            @routes[route] = method
        end

    end

    def match_route(request)
        @routes.each do |route|
            if route == request.method
                puts route
            end
        end
    end
end
    

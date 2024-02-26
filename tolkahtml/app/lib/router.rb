class Router

    def initialize()
        @routes = {}
    end


    def add_route(method, route)
        # @routes.store(route,method)

        # if route.match(/:/)
        if route.include?(":")
            regex_route = route.gsub(/(:\w+)/, '(\w+)')

            puts regex_route
            regex_route = regex_route.gsub((/\//), '\/')
            puts regex_route

            @routes[regex_route] = method
            # @routes[/^#{regex_route}$/] = method

        else
            @routes[route] = method
        end

    end

    # def add_route(method, route)
    #     if route.is_a?(String)
    #         if route.include?(":")
    #             regex_route = route.gsub(/(:\w+)/, '(\w+)')
    #             regex_route = regex_route.gsub(/\//, '\/')
    #             @routes[/^#{regex_route}$/] = method
    #         else
    #             @routes[route] = method
    #         end
    #     elsif route.is_a?(Regexp)
    #         @routes[route] = method
    #     else
    #         raise ArgumentError, "Invalid route format: #{route}"
    #     end
    # end

    # def match_route(request)
    #     @routes.each do |route|
    #         if route == request.method
    #             puts route
    #         end
    #     end
    # end

    def match_route(request)
        @routes.each do |route, method|
            if route.is_a?(Regexp)
                match_data = request.match(route)
                if match_data
                    puts "Matched route: #{route} with method #{method}"
                    return method
                end
            elsif route == request
                puts "Matched route: #{route} with method #{method}"
                return method
            end
        end
    
        puts "No matching route found for #{request}"
        nil
    end
end
    

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

            puts regex_route
            regex_route = regex_route.gsub((/\//), '\/')
            puts regex_route

           # @routes[regex_route] = method
            # @routes[/^#{regex_route}$/] = method

#        else
            @routes << {route: route, method: method}
            p @routes

            # @routes[route] = method

        end

    end

    
    #             regex_route = route.gsub(/(:\w+)/, '(\w+)')
    #             regex_route = regex_route.gsub(/\//, '\/')
    #             @routes[/^#{regex_route}$/] = method


    def match_route(request)
        # binding.break
        @routes
        route3 = @routes[0]


        p route3[:route]


        route2 = @routes[0].first[1]
        route2
        # route2.split(",")
        # p a
        # p route
        @routes.each do |route, method|
    
            # p @routes[route]
            # if @routes[]
            #     p @routes
            #     p x
            # end

            # if @routes{0} == route && @routes{1} == method
            #     puts "found a match"
            # else
            #     puts "no match"
            # end

            # if route.is_a?(Regexp)
            #     match_data = request.match(route)
            #     if match_data
            #         puts "Matched route: #{route} with method #{method}"
            #         return method
            #     end
            # elsif route == request
            #     puts "Matched route: #{route} with method #{method}"
            #     return method
            # end
        end
    
        puts "No matching route found for #{request.resource}"
        nil
    end

    #öppna hash med nyckel
    #ta ut route
    #ta ur method
    #kolla om dem matchar
end
    

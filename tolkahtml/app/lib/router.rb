require 'debug'

# Class representing a router for HTTP requests
class Router

    # Initializes a new Router object.
    def initialize()
        @routes = []
    end

    # Adds a new route to the router.
    #
    # @param method [String] the HTTP method for the route (e.g., 'GET', 'POST', etc.)
    # @param route [String] the route pattern (e.g., '/users/:id')
    # @param blk [Block] the block to be executed when the route is matched
    def add_route(method, route, &blk)
        regex_route = route.gsub(/(:\w+)/, '(\w+)')
        regex_route = regex_route.gsub((/\//), '\/')
        regex_route = Regexp.new(regex_route + "$")

        @routes << {route: regex_route, method: method, block: blk}
    end

    # Matches the given request to a route in the router.
    #
    # @param request [Request] the HTTP request object
    # @return [Hash, nil] the matching route information, or nil if no match is found 
    def match_route(request)
        method = request.method
        resource = request.resource

        

        @routes.select { |route| route[:method] == method}.each do |route|     
            if params = resource.match(route[:route])
                if params[2]
                    route[:params] = params[1..]
                else
                    route[:params] = params[1]
                end
                return route
            end
        end
    
        puts "No matching route found for #{request.resource}"
        nil
    end
end
    

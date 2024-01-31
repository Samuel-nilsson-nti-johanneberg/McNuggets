class Router

    def initialize()
        @routes = {}
    end


    def add_route(method, route)
        @routes.store(route,method)
    end

    def match_route(request)
        @routes.each do |route|
            if route == request.method
                puts route
            end
        end
    end
end
    

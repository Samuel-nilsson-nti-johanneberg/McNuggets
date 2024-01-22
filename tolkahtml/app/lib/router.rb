class Router

def initialize()
    @routes = []
end

def add_routes(method, route)
    @routes << route(route,method)
end

def match_route(request)


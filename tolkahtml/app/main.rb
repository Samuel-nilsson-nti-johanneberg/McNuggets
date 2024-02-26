require_relative './lib/request.rb'
require_relative './lib/router.rb'

request_string = File.read('get-index.request.txt')
request = Request.new(request_string)

p request.method 
p request.resource 
p request.version 
p request.headers
p request.params

r = Router.new



r.add_route("GET", request)
r.add_route("GET", "/get-index.request.txt")

r.match_route("/get-index.request.txt")

# p r.match_route(request)


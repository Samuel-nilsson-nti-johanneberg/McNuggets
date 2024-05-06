require_relative './lib/http_server'
require_relative './lib/router.rb'

router = Router.new


router.add_route("GET", "/user/:id") do
    File.read("../views/index.html")
end
router.add_route("GET", "/banan/:id/paj") do |id|
    "<h1>Weet #{id}</h1>"
end
router.add_route("GET", "/senap/:id/paj/:hej") do |id, hej|
    "<h1>Weet #{id.to_i * hej.to_i}</h1>"
end


router.add_route("GET", "/") do
    File.read("../views/index.html")
end

server = HTTPServer.new(router, 9292)
server.start


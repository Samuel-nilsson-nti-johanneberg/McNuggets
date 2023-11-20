require_relative '../app/request.rb'
request_string = File.read('get-index.request.txt')
# request = Request.new(request_string)

p Request(request_string).method 
# p request.resource 
# p request.version 
# p request.headers
# p request.params

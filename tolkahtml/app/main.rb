require_relative './lib/request.rb'
request_string = File.read('post-login.request.txt')
request = Request.new(request_string)

p request.method 
p request.resource 
p request.version 
p request.headers
p request.params




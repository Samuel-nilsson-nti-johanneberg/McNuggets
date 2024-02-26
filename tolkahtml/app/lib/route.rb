# class Route
#     attr_reader :pattern, :method
  
#     def initialize(pattern, method)
#       @pattern = pattern
#       @method = method
#     end
  
#     # Check if the request matches the route pattern
#     def match?(request)
#       if @pattern.is_a?(Regexp)
#         @pattern.match(request)
#       else
#         @pattern == request
#       end
#     end
#   end
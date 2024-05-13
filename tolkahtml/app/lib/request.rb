# Class representing an HTTP request
class Request
 
    attr_reader :request_string, :method, :resource, :version, :headers, :params

    # Initializes a new Request object.
    #
    # @param request_string [String] the raw HTTP request string
    def initialize(request_string)
        @request_string = request_string
        first, *rest = request_string.split("\n")
        first = first.split(" ")
        parse_method(first)
        parse_resource(first)
        parse_version(first)
        parse_headers(rest)
        parse_params(first)
        parse_params(rest)
    end

    
    # Parses the HTTP method from the request string.
    #
    # @param first [Array<String>] an array containing the first line of the request string split by spaces
    def parse_method(first)
        @method = first[0]
    end

    # Parses the requested resource from the request string.
    #
    # @param first [Array<String>] an array containing the first line of the request string split by spaces
    def parse_resource(first)
        @resource = first[1]
    end
    
    # Parses the HTTP version from the request string.
    #
    # @param first [Array<String>] an array containing the first line of the request string split by spaces
    def parse_version(first)
        @version = first[2]
    end

    # Parses the request headers from the request string.
    #
    # @param rest [Array<String>] an array containing the rest of the request string split by newline
    def parse_headers(rest)
        @headers = []       
        rest.each do |rest|
            key, value = rest.split
            if value != nil
                @headers << {key => value}
            end
        end
    end

    # Parses the request parameters from the request string.
    #
    # @param params_string [Array<String>] an array containing parts of the request string
    def parse_params(params_string)
        params_string.each do |params_string|
            if params_string.include?("&") == true
                tmp = params_string.split('&')
                @params = []
                tmp.each do |x|
                    key, value = x.split('=')
                    if value != nil
                        @params << {key => value}
                    end
                end
            end
        end
    end

    private :parse_method, :parse_resource, :parse_version, :parse_headers, :parse_params
end
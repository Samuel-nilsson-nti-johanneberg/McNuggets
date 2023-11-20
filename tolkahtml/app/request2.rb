class Request
    def initialize(request_string)
        @request_lines = request_string.split("\n")
        parse_request_line
        parse_headers
        parse_params
    end
  
    private
  
    def parse_request_line
        request_line = @request_lines[0].split(' ')
        @method = request_line[0]
        @resource = request_line[1]
        @version = request_line[2]
        @method = @method[0]
    end
  
    def parse_headers
        @headers = {}
        header_lines = @request_lines[1..-3]
        header_lines.each do |line|
            header_parts = line.split(': ')
            @headers[header_parts[0]] = header_parts[1]
        end
    end
  
    def parse_params
        @params = {}
        if @method == 'GET' && @resource.include?('?')
            params_string = @resource.split('?')[1]
            params_pairs = params_string.split('&')
            params_pairs.each do |pair|
                key, value = pair.split('=')
                @params[key] = value
            end
        end
    end

    def method
        @method
    end
  
    def resource
        @resource
    end
  
    def version
        @version
    end
  
    def headers
        @headers
    end
  
    def params
        @params
    end
end
  

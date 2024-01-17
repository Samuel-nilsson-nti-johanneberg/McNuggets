class Request
 
    attr_reader :request_string, :method, :resource, :version, :headers, :params

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

    def parse_method(first)
        @method = first[0]
    end

    def parse_resource(first)
        @resource = first[1]
    end
    
    def parse_version(first)
        @version = first[2]
    end

    def parse_headers(rest)
        @headers = []       
        rest.each do |rest|
            key, value = rest.split
            if value != nil
                @headers << {key => value}
            end
        end
    end

    def parse_params(params_string)
        p "hej"
        if params_string.include?("&") == true
            tmp = params_string.split('&')
            p "hej"
            @params = []
            tmp.each do |x|
                key, value = x.split('=')
                if value != nil
                    @params << {key => value}
                end
            end
        end
        p "hej"
    end

end
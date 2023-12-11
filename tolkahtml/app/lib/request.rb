class Request
 
    attr_reader :request_string

    def initialize(request_string)
        @request_string = request_string
        first, *rest = request_string.split("\n")
        @first = first.split(" ")
        @rest = rest  
    end

    def method()
        method = @first[0]
    end

    def resource()
        resource = @first[1]
    end
    
    def version()
        version = @first[2]
    end

    def headers()
        i = 0
        output = []
        while i < @rest.length
            temp = @rest[i].split
            output << temp[1]
            i +=1
        end
        return output
    end

    def params()
        params_string = @first[1].split('?')[1] 
        return {} if params_string.nil? 
    
        params_array = params_string.split('&').map { |param| param.split('=') }
        params_hash = params_array.to_h
        params_hash_keys = params_hash.keys

        output = "type => #{params_hash[params_hash_keys[0]]}, minrating => #{params_hash[params_hash_keys[1]]}"
    end


end
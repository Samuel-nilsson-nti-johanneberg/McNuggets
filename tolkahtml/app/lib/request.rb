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


    # jag ska göra så att params funktion inte bara fungerar på denna filen utan även dem andra
    def params()
        params = @first[1].split("=")
        minrating = params[2]
        type = params[1].split("&")[0]
        output = "type => #{type}, minrating => #{minrating}"
    end


end
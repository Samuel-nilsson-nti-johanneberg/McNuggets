request_string = File.read("get-examples.request.txt")
first, *rest = request_string.split("\n")

first = first.split(" ")
method = first[0]
resource = first[1]
version = first[2]

i = 0
output = []
while i < rest.length
    temp = rest[i].split
    output << temp[1]
    i +=1
end
p first
p rest
p method
p resource
p version
p output
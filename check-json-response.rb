require 'net/http'
require 'json'

COLLAMINE_REGEX_PARSER = 'http://172.20.131.150:9001/regex/debug'

re = 'a|b'
content = 'hello'

uri = URI.parse(COLLAMINE_REGEX_PARSER)
response = Net::HTTP.new(uri.host, uri.port).start do |client|
  request = Net::HTTP::Post.new(uri.path)
  request.body = {re: re, content: content}.to_json
  request["Content-Type"] = "application/json"
  client.request(request)
end

puts JSON.pretty_generate(JSON[response.body])

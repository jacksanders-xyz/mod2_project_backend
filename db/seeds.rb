require 'rest-client'
require 'json'


baseURL = 'https://covid19-api.weedmark.systems/api/v1/stats'
data = RestClient.get baseURL
parsed_data = JSON.parse(data)


parsed_data['data']['covid19Stats'].map do |location|
    Location.create(city: location["city"], province: location["province"], country: location["country"], lastUpdate: location["lastUpdate"], keyId: location["keyId"],confirmed: location["confirmed"], deaths: location["deaths"], recovered: location["recovered"])
end




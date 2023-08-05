# class UnsplashService
  
#   def get_logo_photo
#     response = connection.get("/photos/frlKR1JfDok")
#     parsed_body = JSON.parse(response.body)
#     Photo.new(parsed_body)
#   end

#   def get_random_photo
#     response = connection.get("/photos/random")
#     parsed_body = JSON.parse(response.body)
#     Photo.new(parsed_body)
#   end

#   def get_merchant_item_photo(item_name)
#     response = connection.get("/search/photos?query=#{item_name}")
#     parsed_body = JSON.parse(response.body)
#     Photo.new(parsed_body["results"].first)
#   end

#   def connection
#     Faraday.new(url:'https://api.unsplash.com', params: {"client_id" => ENV["UNSPLASH_KEY"]})
#   end
# end
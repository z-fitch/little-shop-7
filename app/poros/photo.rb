class Photo
  attr_reader :url
  def initialize(details)
    @url = details[:urls][:thumb]
    @likes = details[:likes]
  end
end
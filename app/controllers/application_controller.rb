class ApplicationController < ActionController::Base

  def self.load_image
    #where
    conn = Faraday.new(url: "https://api.unsplash.com/") do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_API']
    end

    #ENV['UNSPLASH_API'] will tell the thing to use my key in the application.yml
    #what
    response = conn.get("photos/frlKR1JfDok")

    json = JSON.parse(response.body, symbolize_names: true)

    @photo = Photo.new(json)
  end

  private
    def error_message(errors)
      errors.full_messages.join(', ')
    end
end

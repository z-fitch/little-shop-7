class ApplicationController < ActionController::Base
  # before_action :logo

  # def logo 
  #   @logo = UnsplashService.new.get_logo_photo
  # end

  private
    def error_message(errors)
      errors.full_messages.join(', ')
    end
end

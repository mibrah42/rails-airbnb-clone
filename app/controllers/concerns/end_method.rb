module EndMethod
  class Messages
    def self.render(action)
      message = {
        success: "Successfully added! =)",
        failure: "Please try again. Wrong input! =("
      }
      return message[action]
    end
  end
  def end_method(flash_key,flash_value ,action,path)
      flash[flash_key] = flash_value
      send(action,path)
  end
end

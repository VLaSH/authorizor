require 'authorizor/loader'

module Authorizor
  # Checks for constants additions or updates and reloads them. 
  class Checker
    def observe
      ActionDispatch::Reloader.to_prepare do
        Loader.new.load_gem
      end
    end
  end
end

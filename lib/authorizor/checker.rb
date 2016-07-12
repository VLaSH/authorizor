require 'authorizor/loader'

module Authorizor
  class Checker
    def observe
      ActionDispatch::Reloader.to_prepare do
        Loader.new.load_gem
      end
    end
  end
end

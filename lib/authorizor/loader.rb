require 'authorizor/checker'

module Authorizor
  class Loader
    def load_gem
      Dir[Rails.root.join('app/authorizers/**/*.rb')].each do |path|
        @current_authorizer_path = path
        unless controller.included_modules.include?(authorizer.name)
          @controller.include(authorizer)
        end
      end
    end

    def authorizer
      @authorizer = @current_authorizer_path.gsub(/.*?(?<=authorizers\/)|\.rb/, '').camelize.constantize
    end

    def controller
      @controller = authorizer.name.gsub('Authorizer', 'Controller').constantize
    end
  end
end

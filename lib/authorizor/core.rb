require 'authorizor/defaults'

module Authorizor
  class Core
    def init_methods
      Module.module_eval do
        Defaults.each do |default|
          define_method :authorize do |name, callback, *actions, &block|
            controller.class_eval do
              self.send callback, name.to_sym, only: actions
              define_method name, block
            end
          end
          define_method default do |value|
            Defaults.add self.name.snakecase, value
          end
        end
      end
    end

    private

    def controller
      self.name.gsub('Authorizer', 'Controller').constantize
    end
  end
end

require 'authorizor/defaults'

module Authorizor
  # Initialize methods in module to make them present in authorizer modules.
  class Core
    # Method *authorize* is the main method that provides authorization
    # Defaults provide functionality for setting default attributes
    # like: 'default_name' or 'default_callback', which are used by *authorize*
    # method if corresponding params are not passed explicit.
    def init_methods
      Module.module_eval do
        define_method :authorize, proc { |name = {}, callback = nil, actions = nil, &block|
          if name.is_a?(Hash)
            options = name
          else
            options = { name: name, callback: callback, actions: actions, block: block, authorizer: self }
          end
          Auth.new(options)
        }
        Defaults.each do |default|
          define_method default do |value|
            Defaults.add default, value, self.name.snakecase
          end
        end
      end
    end
  end
end

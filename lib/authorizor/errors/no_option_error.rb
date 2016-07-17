module Authorizor
  module Errors
    class NoOptionError < StandardError
      def initialize(option)
        super("Option '#{option}' is not present")
      end
    end
  end
end

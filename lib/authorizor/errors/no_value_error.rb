module Authorizor
  module Errors
    class NoValueError < StandardError
      def initialize(field)
        super("Field '#{field}' is not supplied")
      end
    end
  end
end

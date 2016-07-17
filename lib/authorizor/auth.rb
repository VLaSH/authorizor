require 'authorizor/defaults'
require 'authorizor/errors/no_value_error'
require 'authorizor/errors/no_option_error'

module Authorizor
  # Provides authorization.
  class Auth
    KEYS = %w(name callback actions block authorizer)
    attr_accessor :options

    def initialize(options = {})
      @options = options
      check_options
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
        self.class.send(:attr_accessor, key)
      end
    end

    # Creates *authorize* method in controller and corresponding callback.
    def authorize
      controller.class_eval do
        define_method name, block
        self.send callback, name.to_sym, only: actions
      end
    end

    private

    def controller
      authorizer.name.gsub('Authorizer', 'Controller').constantize
    end

    def check_options
      validate_keys
      options.except(:name, :block, :authorizer).each do |key, value|
        val = value || Defaults.fetch("default_#{key}", options[:authorizer].name.snakecase)
        raise Errors::NoValueError.new key unless val.present?
        options[key] = val
      end
      validate_values
    end

    def validate_values
      options.each { |key, value| raise Errors::NoValueError.new key unless value.present? }
    end

    def validate_keys
      KEYS.each { |k| raise Errors::NoOptionError.new k unless options.has_key?(k.to_sym) }
    end
  end
end

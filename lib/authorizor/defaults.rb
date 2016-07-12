module Authorizor
  class Defaults
    DEFAULTS = %w(default_name_prefix default_callback default_actions default_creds).freeze
    @@defaults = {}

    def self.add(key, value)
      @@defaults[key.to_sym] = value
    end

    def self.fetch(key)
      @@defaults[key.to_sym]
    end

    def self.each(&block)
      DEFAULTS.each(&block)
    end
  end
end

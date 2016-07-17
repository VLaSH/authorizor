module Authorizor
  # Collection holder for defaults.
  class Defaults
    DEFAULTS = %w(default_name default_callback default_actions default_creds).freeze
    @@defaults = {}

    def self.add(key, value, authorizer)
      if @@defaults[authorizer.to_sym].present?
        @@defaults[authorizer.to_sym][key.to_sym] = value
      else
        @@defaults[authorizer.to_sym] = { "#{key}": value }
      end
    end

    def self.fetch(key, authorizer)
      @@defaults[authorizer.to_sym][key.to_sym]
    end

    def self.each(&block)
      DEFAULTS.each(&block)
    end
  end
end

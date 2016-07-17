require 'authorizor/loader'
require 'authorizor/checker'
require 'authorizor/auth'
require 'authorizor/core'

module Authorizor
  # Initialize needed functionality.
  def self.init
    Core.new.init_methods
    Loader.new.load_gem
    Checker.new.observe
  end
end

require 'authorizor/loader'
require 'authorizor/checker'
require 'authorizor/authorization'
require 'authorizor/core'

module Authorizor
  def self.init
    Core.new.init_methods
    Loader.new.load_gem
    Checker.new.observe
  end
end

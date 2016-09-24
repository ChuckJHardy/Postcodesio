# frozen_string_literal: true

require "logger"

require "postcodesio/version"
require "postcodesio/configuration"
require "postcodesio/locate"

class Postcodesio
  extend Configure

  NotFound = Class.new(StandardError)
  InternalServerError = Class.new(StandardError)

  def self.locate(*args)
    Locate.call(*args)
  end
end

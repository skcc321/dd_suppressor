require "dd_suppressor/version"
require "dry/core/deprecations"

module DdSuppressor
  class Error < StandardError; end

  def self.prepended(base)
    def base.warn(msg, tag: nil)
      case msg
      when "Form types were renamed to Params"
      else
        super(msg, tag: tag)
      end
    end
  end
end

Dry::Core::Deprecations.prepend(DdSuppressor)

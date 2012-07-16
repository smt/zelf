# Use KSS for awesome styleguide support
require "kss"

module Styleguide
  class << self
    def registered(app)
      app.helpers HelperMethods
    end
    alias :included :registered
  end

  module HelperMethods
    def styleguide_block(section, &block)
      @section = @styleguide.section(section)
      @example_html = capture{ block.call }
      @_out_buf << partial('styleguide/block')
    end
  end
end

::Middleman::Extensions.register(:styleguide, Styleguide)

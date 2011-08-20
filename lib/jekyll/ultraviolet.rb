require 'uv'

module Jekyll
  module Ultraviolet
    class << self; attr_accessor :theme; end
    
    def self.initialize
      @theme = "twilight"
    end
    
    class Block < Liquid::Block
      include Liquid::StandardFilters
      
      def initialize(tag, lang, tokens)
        super
        @lang = (lang.strip unless lang.empty?) || "ruby"
      end
      
      def render(context)
        output = []
        output << context["pygments_prefix"]
        output << Uv.parse(super.join, "xhtml", @lang, false, Ultraviolet.theme)
        output << context["pygments_suffix"]
        output.join
      rescue LoadError
        raise "Ultraviolet not installed."
      end
    end
  end
end

Liquid::Template.register_tag('uv', Jekyll::Ultraviolet::Block)


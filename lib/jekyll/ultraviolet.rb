require "uv"
require "liquid"
# Psych can't parse some of the syntax/theme files
YAML::ENGINE.yamler = "syck"

module Jekyll
  module Ultraviolet
    class << self; attr_accessor :theme end

    class Block < Liquid::Block
      include Liquid::StandardFilters

      def initialize(tag, lang, tokens)
        super
        @theme = "twilight"
        @lang  = lang.strip rescue "ruby"
      end

      def render(context)
        output = []
        output << context["pygments_prefix"]
        output << Uv.parse(remove_leading_spaces(super.join), "xhtml", @lang, false, theme)
        output << context["pygments_suffix"]
        output.join
      rescue LoadError
        raise "Ultraviolet not installed."
      end

      def remove_leading_spaces(text)
        padding = text.match(/\n?(\s+)/)[1]
        return text if padding == "\n"
        text.each_line.map { |l| l.gsub(/^#{padding}/, "") }.join
      end

      def theme
        Jekyll::Ultraviolet.theme || @theme
      end
    end
  end
end

Liquid::Template.register_tag('uv', Jekyll::Ultraviolet::Block)


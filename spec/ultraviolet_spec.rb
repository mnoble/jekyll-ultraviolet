require "spec_helper"

describe Jekyll::Ultraviolet do
  include HighlighedTextHelpers

  before do
    Jekyll::Ultraviolet.theme = nil
  end

  def rendered(source)
    Liquid::Template.parse(source).render
  end

  it "parses uv blocks into syntax highlighted code" do
    rendered(text).should == expected
  end

  it "allow indenting within {% uv %} but proportionately remove it in output" do
    rendered(text).split("\n")[2].should =~ /^[^\s]+/
  end

  it "allows the theme to be set" do
    Jekyll::Ultraviolet.theme = "amy"
    rendered(text).should =~ /<pre class="amy">/
  end

  it "supports specifying a language" do
    rendered(text_python).should == expected_python
  end
end

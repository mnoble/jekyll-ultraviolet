module HighlighedTextHelpers
  def text
    <<-TEXT
This is a code example:
{% uv ruby %}
  def awesome
    puts "AWESOME"
  end
{% enduv %}
And other stuff.
    TEXT
  end

  def expected
    <<-TEXT
This is a code example:
<pre class="twilight">
<span class="Keyword">def</span> <span class="Entity">awesome</span>
  puts <span class="String"><span class="String">&quot;</span>AWESOME<span class="String">&quot;</span></span>
<span class="Keyword">end</span>
</pre>
And other stuff.
    TEXT
  end

  def text_python
    <<-TEXT
This is Python:
{% uv python %}
  len(0)
{% enduv %}
    TEXT
  end

  def expected_python
    <<-TEXT
This is Python:
<pre class="twilight">
<span class="SupportFunction">len</span>(<span class="Constant">0</span>)
</pre>
    TEXT
  end
end

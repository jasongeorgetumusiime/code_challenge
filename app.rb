require "./html_marker"

module CodeChallenge
  class App
    def run(args)
      data = File.open(args[0]).read
      highlights = [
        { :start => 20, :end => 35, :comment => "Foo" },
        { :start => 73, :end => 130, :comment => "Bar" },
        { :start => 50, :end => 98, :comment => "Baz" },
      ]
      marker = HtmlMarker.new(data, highlights)
      File.open("output.html", "w") { |f| f.write marker.to_html_doc }
      0
    end
  end
end

app = CodeChallenge::App.new()
status = app.run(ARGV)
exit(status)

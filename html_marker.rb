module CodeChallenge
  class HtmlMarker
    OPEN_MARK = %{<mark class='tooltip' style='background:%s'>
      <span class='tooltiptext'>%s</span>}

    CLOSE_MARK = %{</mark>}

    attr_accessor :colors, :highlights, :text
    private :colors, :highlights, :text

    def initialize(text, highlights)
      @text = text
      @highlights = highlights
      @colors = []
    end

    def format
      highlight(text, highlights).join(" ")
    end

    def css_styles
      %{<style>
      .tooltip {
        position: relative;
        display: inline-block;
      }
      .tooltip .tooltiptext {
        visibility: hidden;
        width: 120px;
        background-color: black;
        color: #fff;
        text-align: center;
        padding: 5px;
        position: absolute;
        z-index: 1;
      }
      .tooltip:hover .tooltiptext {
        visibility: visible;
      }
      </style>
    }
    end

    def to_html_doc
      html = %{
      <!DOCTYPE html>
      <html>
      <head>
        <title>HTML Marker</title>
        %s
      </head>
      <body>
        %s
      </body>
      </html>
    }
      html % [css_styles, format]
    end

    private

    def highlight(text, highlights)
      words_in_paragraphs = convert_to_words(text)
      highlights.each do |highlight|
        words_in_paragraphs[highlight[:start]..highlight[:end]] = insert_mark(
          words_in_paragraphs[highlight[:start]..highlight[:end]],
          highlight[:comment]
        )
      end
      words_in_paragraphs
    end

    def insert_mark(words, comment)
      color = random_color
      marked_segment = words.map do |word|
        if starts_with_p?(word)
          insert_open_mark(word, comment, color)
        elsif ends_with_p?(word)
          insert_close_mark(word)
        else
          word
        end
      end
      marked_segment[0] = insert_open_mark(words.first, comment, color)
      marked_segment[-1] = insert_close_mark(words.last)
      marked_segment
    end

    def convert_to_paragraph(text)
      text = text.split("\n\n")
      text.map do |par|
        "<p>#{par.strip}</p>"
      end
    end

    #Split into paragraphed words with the same length as the orignial text
    def convert_to_words(text)
      convert_to_paragraph(text).join(" ").split(" ")
    end

    # Methods do no scale well, Only work for p html tags
    def starts_with_p?(word)
      word.start_with?("<p>")
    end

    def ends_with_p?(word)
      word.end_with?("</p>")
    end

    # - Could regular expressions produce a more readble solution?
    # - `insert_` methods do no scale well, Only work for p html tags!
    # - We use clone becase `insert` is desctructive which would produce a non
    # functional interface or we could append `!` to the method definitions
    def insert_open_mark(word, tooltiptext, color)
      if starts_with_p?(word)
        word.clone.insert(3, OPEN_MARK % [color, tooltiptext])
      else
        word.clone.insert(0, OPEN_MARK % [color, tooltiptext])
      end
    end

    def insert_close_mark(word)
      if ends_with_p?(word)
        word.clone.insert(-5, CLOSE_MARK)
      else
        word.clone.insert(-1, CLOSE_MARK)
      end
    end

    # Alternatively use `loop do ...return ... end`
    def random_color
      color = "#%06x" % (rand * 0xffffff)
      while colors.include?(color)
        color = "%06x" % (rand * 0xffffff)
      end
      colors << color
      color
    end
  end
end

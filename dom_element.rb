require_relative './element'

module XRB
  class DOMElement < Element
    attr_reader :tag

    def initialize(_tag, _attributes, _children)
      @tag = _tag
      super(_attributes, _children)
    end

    def to_html
      html = ''

      html << '<'
      html << tag.to_s
      unless attributes.nil? || attributes.empty?
        html << ' '
        html << _serialise_attributes
      end
      html << '>'

      html << _children_to_html(children)

      html << '</'
      html << tag.to_s
      html << '>'

      html
    end

    private

    def _serialise_attributes
      _serialised = []
      attributes.each do |(key, value)|
        if value == false
          next
        elsif value == true
          _serialised << "#{key}"
        else
          _serialised << "#{key}=\"#{value}\""
        end
      end
      _serialised.join(' ')
    end
  end
end
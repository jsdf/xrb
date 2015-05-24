require 'cgi'

module XRB
  class Element
    def self.[](_attributes, *_children)
      new(_attributes, _children)
    end

    attr_reader :attributes
    attr_reader :children
    def initialize(_attributes = {}, _children = [])
      @attributes = _attributes
      @children = _children
    end

    def render
      raise NotImplementedError, "You must implement render on your element class"
    end

    def to_html
      _child_to_html(render)
    end

    def to_s
      to_html
    end

    def attrs
      attributes
    end

    private

    def _children_to_html(_children)
      children_html = ''
      _children.each do |child|
        child_html = _child_to_html(child)
        children_html << child_html unless child_html.nil?
      end
      children_html
    end

    def _child_to_html(child)
      return unless child
      return _children_to_html(child) if child.is_a? Array
      return child.to_html if child.respond_to? :to_html
      CGI::escapeHTML(child.to_s)
    end
  end
end

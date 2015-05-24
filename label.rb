require_relative './xrb'

module XRB
  class Label < Element
    def render
      DOM.label({class: 'thing'}, attributes[:text], children)
    end
  end
end

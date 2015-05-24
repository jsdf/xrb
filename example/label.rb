require_relative '../xrb'

module XRBExample
  class Label < XRB::Element
    include XRB::DOM

    def render
      DOM.label({class: 'thing'}, attributes[:text], children)
    end
  end
end

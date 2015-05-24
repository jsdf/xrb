require_relative '../xrb'
require_relative './label'

module XRBExample
  class Form < XRB::Element
    include XRB::DOM

    def render
      DOM.div(nil,
        XRBExample::Label[{text: 'hiii'},
          'content here'
        ],
        'something else',
        nil,
        attrs[:name],
        DOM.input({name: 'hi', value: 'hiii'})
      )
    end
  end
end

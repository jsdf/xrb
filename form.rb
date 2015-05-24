require_relative './xrb'
require_relative './label'

module XRB
  class Form < Element
    def render
      DOM.div(nil,
        XRB::Label[{text: 'hiii'},
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

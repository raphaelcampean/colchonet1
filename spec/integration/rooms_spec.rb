require 'swagger_helper'

RSpec.describe 'Rooms API', type: :request do
  path '/rooms' do
    get('list rooms') do
      tags 'Rooms'

      response(200, 'successful') do
        schema type: :array,
              items: {
                type: :object,
                properties: {
                  id: {
                    type: :integer
                  },
                  title: {
                    type: :string
                  },
                  location: {
                    type: :string
                  }
                }
              }

        run_test!
      end
    end
  end
end


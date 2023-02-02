# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    handlers = { '/' => -> { [200, {'Content-Type' => 'text/plain'}, ['Hello, World!']] },
                 '/about' => -> { [200, {'Content-Type' => 'text/plain'}, ['About page']] } }
    response = handlers[env['PATH_INFO']]
    return response.call if response

    [404, {'Content-Type' => 'text/plain'}, ['404 Not Found']]
    # END
  end
end

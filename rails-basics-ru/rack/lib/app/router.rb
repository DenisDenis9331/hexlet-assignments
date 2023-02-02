# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    handlers = { '/' => -> { [200, {'Content-Type' => 'text/plain'}, ['Welcome to the home page!']] },
                 '/about' => -> { [200, {'Content-Type' => 'text/plain'}, ['This is the about page.']] } }
    response = handlers[env['PATH_INFO']]
    return response.call if response

    [404, {'Content-Type' => 'text/plain'}, ['Route not found.']]
    # END
  end
end

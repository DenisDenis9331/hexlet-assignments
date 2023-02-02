# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    handlers = { '/' => -> { [200, 'Welcome to the home page!'] },
                 '/about' => -> { [200, 'This is the about page.'] } }
    response = handlers[env]
    return response.call if response

    [404, 'Route not found.']
    # END
  end
end

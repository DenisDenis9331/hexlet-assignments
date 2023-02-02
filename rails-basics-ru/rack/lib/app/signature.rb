# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, response = @app.call(env)
    return [status, headers, response] if response.nil?

    body = response.join
    headers['Content-Digest'] = Digest::SHA256.hexdigest(body)
    [status, headers, [body]]
    # END
  end
end

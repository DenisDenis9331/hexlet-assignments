# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, response = @app.call(env)
    body = response.join
    digest = Digest::SHA256.hexdigest(body)
    [status, headers, [body + "\n" + digest]]
    # END
  end
end

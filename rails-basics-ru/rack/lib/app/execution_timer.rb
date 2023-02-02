class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, headers, response = @app.call(env)
    headers = {} unless headers.is_a?(Hash)
    headers['X-Execution-Time'] = ((Time.now - start) * 1000).to_i.to_s
    [status, headers, response]
  end
end

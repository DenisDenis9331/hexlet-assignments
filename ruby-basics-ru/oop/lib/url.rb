# frozen_string_literal: true

# BEGIN

require 'forwardable'
require 'uri'

class Url
  include Comparable

  attr_reader :uri

  extend Forwardable

  def_delegators :@uri, :scheme, :host

  def initialize(url)
    @uri = URI(url)
  end

  def query_params
    return {} if @uri.query.nil?
    URI.decode_www_form(@uri.query).to_h.transform_keys { |key| key.to_sym }
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end

  def <=>(other)
    uri <=> other.uri
  end
end

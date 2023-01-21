# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attribute(name, type:, default: nil)
      define_method(name) do
        @attributes[name]
      end

      define_method("#{name}=") do |value|
        @attributes[name] = cast_value(value, type)
      end

      define_method("#{name}?") do
        @attributes[name]
      end

      @attributes ||= {}
      @attributes[name] = default
    end

    def attributes
      @attributes
    end
  end

  def initialize(attributes = {})
    @attributes = self.class.attributes.dup
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attributes
    @attributes
  end

  private

  def cast_value(value, type)
    case type
    when :string
      value.to_s
    when :integer
      value.to_i
    when :datetime
      DateTime.parse(value.to_s)
    when :boolean
      value
    end
  end
end
# END

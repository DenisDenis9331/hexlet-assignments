# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :status, presence: true

  validates_length_of :creator, maximum: 32, message: "less than 32 if you don't mind"
  validates_length_of :performer, maximum: 32, message: "less than 32 if you don't mind"
  validates :completed, inclusion: { in: [true, false] }

  after_initialize :set_default, if: :new_record?

  private

  def set_default
    self.status ||= 'new'
  end
end

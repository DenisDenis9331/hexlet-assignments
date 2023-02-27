class Task < ApplicationRecord
  validates :name, :status, :creator, :completed, presence: true

  after_initialize :set_default, if: :new_record?

  private

  def set_default
    self.status ||= 'new'
  end
end

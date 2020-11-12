class UniqAllocationValidator < ActiveModel::Validator
  def validate(record)
    allocation = Allocation.where('((start_at <= ? AND end_at >= ?) OR (start_at <= ? AND end_at >= ?)) AND car_id = ?', record.end_at, record.end_at, record.start_at, record.start_at, record.car_id)
    if allocation.exists?
      record.errors[:start_at] << "Already have an allocation for this"
    end
  end
end

class DatesAllocationValidator < ActiveModel::Validator
  def validate(record)
    if record.start_at.present? && record.end_at.present?
      if record.start_at >= record.end_at
        record.errors[:start_at] << "Period invalid, check the dates"
      end
    end
  end
end

class Allocation < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :car

  validates :document, :start_at, :end_at, presence: true
  validates_associated :car
  validates_with UniqAllocationValidator
  validates_with DatesAllocationValidator
end



class LongTask < Task
  validates :percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  validates :percentage, presence: true, :inclusion => 0..100
end

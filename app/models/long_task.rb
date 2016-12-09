class LongTask < Task
  validates :percentage, presence: true, :inclusion => 0..100
end

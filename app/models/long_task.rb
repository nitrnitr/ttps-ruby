class LongTask < Task
  validates :percentage, presence: true, :inclusion => 0..100
  validates :start_date, :end_date, presence: true
end

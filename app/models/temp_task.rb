class TempTask < Task
  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :percentage, presence: true

  validate :correct_dates

  private

  def correct_dates
    errors.add(:start, "must be earlier than end date") if start_date >= end_date
  end
end

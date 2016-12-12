class TempTask < Task
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :correct_dates

  def set_expired
    status = 'expired' if expired?
  end

  def expired?
    end_date < Date.today
  end

  private

  def correct_dates
    errors.add(:start, "must be earlier than end date") if start_date >= end_date
  end
end

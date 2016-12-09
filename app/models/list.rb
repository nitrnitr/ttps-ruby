class List < ApplicationRecord
  has_many :tasks
  validates :title, uniqueness: true
  validates :title, presence: true, allow_blank: false
  before_validation :set_slug, on: :create

  def set_slug
    self.slug = title.to_slug
  end
end

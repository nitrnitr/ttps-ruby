class List < ApplicationRecord
  has_many :tasks
  validates :title, uniqueness: true
  before_validation :set_slug, on: :create

  def set_slug
    self.slug = title.to_slug
  end
end

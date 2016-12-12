class List < ApplicationRecord
  has_many :tasks
  validates :slug, uniqueness: true
  validates :title, presence: true, allow_blank: false
  before_validation :set_slug, on: :create

  def set_slug
    self.slug = title.to_slug
    self.slug += Time.now.to_i.to_s if List.where(slug: title.to_slug).any?
  end
end

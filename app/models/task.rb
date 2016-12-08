class Task < ApplicationRecord
  belongs_to :list
  validates :list, presence: true
  validates :description, presence: true
end

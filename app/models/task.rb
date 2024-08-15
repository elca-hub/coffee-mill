class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :hour, presence: true, numericality: { greater_than: 0, less_than: 24 }
  validates :reason, presence: true, length: { maximum: 1000 }
  validates :before_situation, presence: true, length: { maximum: 1000 }
  validates :after_situation, presence: true, length: { maximum: 1000 }
  validates :after_action, presence: true, length: { maximum: 1000 }
  validates :other, length: { maximum: 1000 }
end

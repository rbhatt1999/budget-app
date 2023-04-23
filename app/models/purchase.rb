class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

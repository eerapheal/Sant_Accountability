class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :entities, through: :expenses

  validates :name, presence: true
  validates :icon, presence: true
end

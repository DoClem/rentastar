class Celebrity < ApplicationRecord

  belongs_to :user, dependent: :destroy

  has_many :booking

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end

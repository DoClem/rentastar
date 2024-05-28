class Celebrity < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :bio, presence: true
  validates :profile_url, presence: true
end

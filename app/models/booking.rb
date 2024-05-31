class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity

  default_scope { order(created_at: :desc) }
end

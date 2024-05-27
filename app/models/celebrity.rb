class Celebrity < ApplicationRecord
  belongs_to :user, dependent: :destroy
end

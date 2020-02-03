class Player < ApplicationRecord
  belongs_to :room, dependent: :destroy
end

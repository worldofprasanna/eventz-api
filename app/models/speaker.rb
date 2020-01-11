class Speaker < ApplicationRecord
  has_many :talks, dependent: :destroy
end

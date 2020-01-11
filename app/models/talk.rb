class Talk < ApplicationRecord
  belongs_to :speaker
  belongs_to :conference
end

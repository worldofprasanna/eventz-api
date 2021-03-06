class Talk < ApplicationRecord
  belongs_to :speaker, optional: true
  belongs_to :conference, optional: true

  delegate :name, to: :speaker, prefix: :speaker, allow_nil: true
  delegate :profile_pic, to: :speaker, prefix: :speaker, allow_nil: true
end

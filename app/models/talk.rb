class Talk < ApplicationRecord
  belongs_to :speaker
  belongs_to :conference

  def speaker_name
    speaker&.name
  end
end

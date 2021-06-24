class RetroItem < ApplicationRecord
  belongs_to :retro_board

  def completed?
   !completed_at.blank?
  end
end

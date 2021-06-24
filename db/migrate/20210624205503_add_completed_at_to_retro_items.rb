class AddCompletedAtToRetroItems < ActiveRecord::Migration[6.1]
  def change
    add_column :retro_items, :completed_at, :datetime
  end
end

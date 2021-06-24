class CreateRetroItems < ActiveRecord::Migration[6.1]
  def change
    create_table :retro_items do |t|
      t.string :content
      t.references :retro_board, null: false, foreign_key: true

      t.timestamps
    end
  end
end

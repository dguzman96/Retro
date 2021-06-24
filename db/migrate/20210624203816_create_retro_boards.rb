class CreateRetroBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :retro_boards do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

class CreateComboDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :combo_dishes do |t|
      t.references :combo, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end

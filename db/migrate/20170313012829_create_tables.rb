class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.integer :capacity
      t.string :code

      t.timestamps
    end
  end
end

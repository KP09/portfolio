class CreateContributions < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.text :comment
      t.boolean :starred
      t.references :participation, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSeaLions < ActiveRecord::Migration
  def change
    create_table :sea_lions do |t|
      t.string :name, null: false
      t.string :ocean, null: false
      t.integer :whisker_count, default: 0
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end

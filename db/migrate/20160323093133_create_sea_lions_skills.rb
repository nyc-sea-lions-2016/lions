class CreateSeaLionsSkills < ActiveRecord::Migration
  def change
    create_table :sea_lion_skills do |t|
      t.references :sea_lion, null: false, foreign_key: true, index: true
      # t.belongs_to :sea_lion, null: false
      # t.integer :sea_lion_id, null: false
      t.references :skill, null: false, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

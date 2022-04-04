class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.text :content, null: false
      t.integer :position, default: 0, null: false
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
    add_index :lessons, :name
    add_index :lessons, [:section_id, :name]
    add_index :lessons, [:section_id, :position]
  end
end

class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.integer :position, null: false, default: 0
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sections, [:course_id, :name]
    add_index :sections, [:course_id, :position], unique: true
  end
end

class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :teacher_name, null: false
      t.text :description
      t.string :slug, null: false

      t.timestamps
      t.index ['slug'], name: 'index_courses_on_slug', unique: true
    end
  end
end

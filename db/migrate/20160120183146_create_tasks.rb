class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :status
      t.string :notes
      t.date :due
      t.date :start

      t.timestamps null: false
    end
  end
end

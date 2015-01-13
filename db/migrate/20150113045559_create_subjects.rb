class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :course
      t.integer :semester

      t.timestamps
    end
  end
end

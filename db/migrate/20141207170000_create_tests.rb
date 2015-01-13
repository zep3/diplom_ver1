class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :user, index: true
      t.string :name
      t.text :content
      t.attachment :cover

      t.belongs_to :topic, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

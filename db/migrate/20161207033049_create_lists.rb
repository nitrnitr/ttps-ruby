class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, :null => false
      t.string :slug, :null => false

      t.timestamps
    end
  end
end

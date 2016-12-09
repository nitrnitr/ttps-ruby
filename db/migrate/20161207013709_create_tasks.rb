class CreateTasks < ActiveRecord::Migration[5.0]
	def change
		create_table :tasks do |t|
      t.string :type, :null => false
      t.string :description, :null => false
      t.string :priority, :null => false
      t.string :state, :null => false

      t.date :start_date
      t.date :end_date
      t.integer :percentage

      t.belongs_to :list, index: true
      t.timestamps
		end
	end
end

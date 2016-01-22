class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

    	t.string :name
    	t.string :author
    	t.string :price
    	t.string :comment

      t.timestamps null: false
    end
  end
end

class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
    	t.string :name
    	t.string :position
    	t.text :info, limit: nil
    	t.string :ref
     	t.timestamps
    end
    
  end
end

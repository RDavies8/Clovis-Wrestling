class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
    	t.string :name
    	t.string :position
    	t.string :info
    	t.string :user_id
     	t.timestamps
    end
    
  end
end

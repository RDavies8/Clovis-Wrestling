class CreateWrestlers < ActiveRecord::Migration
  def change
    create_table :wrestlers do |t|
    	t.string		:user_id
    	t.string		:name
    	t.string		:weight_class
    	t.string		:year
    	t.string		:state
    	t.string		:masters
      	t.timestamps
    end
  end
end

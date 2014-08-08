class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.boolean :admin
      t.boolean :subscription

      t.timestamps
    end
  end
end

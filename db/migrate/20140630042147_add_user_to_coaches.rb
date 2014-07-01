class AddUserToCoaches < ActiveRecord::Migration
  def change
    add_reference :coaches, :user, index: true
  end
end

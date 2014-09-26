class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, limit: nil
      t.belongs_to :user
      t.belongs_to :blog

      t.timestamps
    end
  end
end

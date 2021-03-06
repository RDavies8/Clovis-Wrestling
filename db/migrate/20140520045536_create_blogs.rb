class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string		:title
    	t.string		:author
    	t.text		:article, limit: nil
    	t.string		:image_id

      t.belongs_to :coach

    	t.timestamps
    end
  end
end

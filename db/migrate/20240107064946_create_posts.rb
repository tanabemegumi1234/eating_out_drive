class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :name,null: false
      t.string :url
      t.text :introduction,null: false
      t.string :parking,null: false
      t.timestamps
    end
  end
end

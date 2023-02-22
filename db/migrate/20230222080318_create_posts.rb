class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.text    :posted_text, null: false

      t.timestamps
    end
  end
end

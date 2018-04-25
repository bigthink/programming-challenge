class CreateUsages < ActiveRecord::Migration[5.1]
  def change
    create_table :usages do |t|
      t.integer :user_id
      t.integer :video_id
      t.integer :view_time 
      t.timestamps
    end
  end
end

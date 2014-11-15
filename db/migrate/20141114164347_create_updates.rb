class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end

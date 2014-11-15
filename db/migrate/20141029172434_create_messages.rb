class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :body
      t.datetime :read_at
      t.boolean :recipient_deleted
      t.boolean :sender_deleted


      t.timestamps
    end
  end
end

class CreateNewsposts < ActiveRecord::Migration
  def change
    create_table :newsposts do |t|
      t.string :title
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end

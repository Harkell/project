class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :area
      t.string :postcode
      t.string :phonenumber

      t.timestamps
    end
  end
end

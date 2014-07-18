class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :business_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end
  end
end

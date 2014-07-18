class AddPhoneNumberToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :phone_number, :string
  end
end

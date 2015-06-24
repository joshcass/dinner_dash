class AddDefaultToPhoneForUser < ActiveRecord::Migration
  def change
    change_column_default :users, :phone, "5555555555"
  end
end

class RemoveDefaultFromUserPhone < ActiveRecord::Migration
  def change
    change_column_default :users, :phone, nil
  end
end

class AddOverviewAndDetailsToItems < ActiveRecord::Migration
  def change
    add_column :items, :overview, :text
    add_column :items, :details, :text
  end
end

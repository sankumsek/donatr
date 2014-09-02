class AddDescriptionToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :description, :text
  end
end

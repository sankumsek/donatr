class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :user
      t.belongs_to :cause
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end

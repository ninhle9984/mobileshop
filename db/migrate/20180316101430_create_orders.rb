class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :phone
      t.integer :order_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

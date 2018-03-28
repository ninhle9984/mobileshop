class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :content
      t.datetime :read_at
      t.string :order_url

      t.timestamps
    end
  end
end

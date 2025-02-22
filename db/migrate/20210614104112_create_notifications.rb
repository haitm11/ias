class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id, null: false
      t.boolean :read, null: false, default: false
      t.integer :stock_id, null: false
      t.string :notiable_type, null: false
      t.integer :notiable_id

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.boolean :handled, default: false
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end

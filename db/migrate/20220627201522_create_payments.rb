class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :amount, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

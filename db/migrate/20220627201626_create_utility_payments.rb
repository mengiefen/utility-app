class CreateUtilityPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :utility_payments do |t|
      t.string :name
      t.string :amount
      t.references :utility, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end

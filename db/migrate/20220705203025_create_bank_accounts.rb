class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.string :account_number, null: false
      t.string :ifsc_code, null: false
      t.integer :swift_number
      t.references :user
      t.timestamps
    end
  end
end

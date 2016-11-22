class AddBankCompanyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :farmers, :bank_company, :string
  end
end

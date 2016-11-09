class AddCompanyNameAndCompanyPhoneToFarmers < ActiveRecord::Migration[5.0]
  def change
  	add_column :farmers, :company_name, :string
  	add_column :farmers, :company_phone, :string
  end
end

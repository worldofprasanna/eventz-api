class AddCompanyFieldsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :designation, :string
    add_column :orders, :company_name, :string
    add_column :orders, :company_email, :string
  end
end

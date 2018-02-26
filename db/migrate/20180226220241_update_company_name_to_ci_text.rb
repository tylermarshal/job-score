class UpdateCompanyNameToCiText < ActiveRecord::Migration[5.1]
  def change
    enable_extension("citext")
    change_column :jobs, :company_name, :citext
  end
end

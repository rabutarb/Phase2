class RemoveOrganizationIdFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :organization_id, :integer
  end
end

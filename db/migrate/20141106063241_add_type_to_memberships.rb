class AddTypeToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :type, :string
  end
end

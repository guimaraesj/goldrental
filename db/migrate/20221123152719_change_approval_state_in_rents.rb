class ChangeApprovalStateInRents < ActiveRecord::Migration[7.0]
  def change
    remove_column :rents, :approval_state
    add_column :rents, :approval_state, :string, default: "Pending"
  end
end

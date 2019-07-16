class ChangeOldAssingedUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :old_assinged_userid, :old_assigned_userid 
  end
end

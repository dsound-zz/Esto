class AddOldNotesToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :old_notes, :string
  end
end

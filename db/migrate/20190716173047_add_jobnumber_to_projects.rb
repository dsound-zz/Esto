class AddJobnumberToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :job_number, :string
  end
end

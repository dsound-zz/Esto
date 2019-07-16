class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
   
    add_column :projects, :old_company_id, :integer
    add_column :projects, :old_contact_id, :integer
    add_column :projects, :old_assinged_userid, :integer
    add_column :projects, :description, :string
    add_column :projects, :project_type, :string
    add_column :projects, :company, :string
    add_column :projects, :company_id, :integer
    add_column :projects, :pq_worksheet_num, :string
    add_column :projects, :pg_worksheet_notes, :string
    add_column :projects, :scout_images_sent, :string
    add_column :projects, :prelims_sent, :string
    add_column :projects, :finals_delivered, :string
    add_column :projects, :shoot_sheet_received, :boolean
    add_column :projects, :image_order_1_date, :datetime
    add_column :projects, :image_order_2_date, :datetime
    add_column :projects, :image_order_3_date, :datetime
    add_column :projects, :image_order_1_notes, :string
    add_column :projects, :image_order_2_notes, :string
    add_column :projects, :image_order_3_notes, :string
    add_column :projects, :participant_info, :string
    add_column :projects, :other_notes, :string  



  end
end


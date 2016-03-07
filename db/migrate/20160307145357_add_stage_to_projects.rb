class AddStageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :stage, :string, default: 'to_do' 
  end
end

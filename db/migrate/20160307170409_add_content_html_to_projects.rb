class AddContentHtmlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :content_html, :text
  end
end

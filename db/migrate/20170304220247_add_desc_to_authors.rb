class AddDescToAuthors < ActiveRecord::Migration[5.0]
  def change
  	add_column :authors, :desc, :text
  end
end

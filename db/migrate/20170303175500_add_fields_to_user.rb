class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string
  	add_column :users, :address, :string
  	add_column :users, :phone, :string
  	add_column :users, :identification , :string, :unique => true
  end
end

class CreateEditorials < ActiveRecord::Migration[5.0]
  def change
    create_table :editorials do |t|
      t.string :name

      t.timestamps
    end
  end
end

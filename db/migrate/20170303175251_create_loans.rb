class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.date :delivery_date
      t.date :return_date
      t.boolean :active
      t.references :copy, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :total_units

      t.timestamps
    end
  end
end

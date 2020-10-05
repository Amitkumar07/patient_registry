class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :mrn
      t.string :zip
      t.string :mobile_number
      t.datetime :dob
      t.boolean :is_insured

      t.timestamps
    end
  end
end

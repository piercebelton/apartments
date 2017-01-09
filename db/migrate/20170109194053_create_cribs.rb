class CreateCribs < ActiveRecord::Migration
  def change
    create_table :cribs do |t|
      t.string :street
      t.string :city
      t.integer :zip
      t.string :state
      t.string :country
      t.string :name
      t.integer :phone
      t.string :contact_hours

      t.timestamps null: false
    end
  end
end

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.column :bike_id, :integer, null: false
      t.column :token, 'TEXT(690)', null: false

      t.timestamps null: false
    end
  end
end

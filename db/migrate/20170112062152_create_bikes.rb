class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.column :token, 'char(690)', null: false

      t.timestamps null: false
    end
  end
end

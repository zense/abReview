class CreateOpenStudios < ActiveRecord::Migration[5.1]
  def change
    create_table :open_studios do |t|
      t.string :name, :null => false
      t.string :affiliation, :null => false
      t.string :interested_in, :null => false
      t.string :email, :null => false

      t.timestamps
    end
  end
end

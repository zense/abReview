class AddStatusToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :abstract_docs, :status, :integer, :null => false, :default => 0
    add_column :reviews, :status, :integer, :null => false, :default => 0
  end
end

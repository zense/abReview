class AddAttachmentToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :attachment, :string
  end
end

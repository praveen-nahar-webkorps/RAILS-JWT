class AddColoumnImageToImage < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :profile_img, :string
  end
end

class AddSlugsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :slug, :string
    add_index :rooms, :slug
  end
end

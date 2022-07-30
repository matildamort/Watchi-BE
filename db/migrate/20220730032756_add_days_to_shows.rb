class AddDaysToShows < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :monday, :boolean
    add_column :shows, :tuesday, :boolean
    add_column :shows, :wednesday, :boolean
    add_column :shows, :thursday, :boolean
    add_column :shows, :friday, :boolean
    add_column :shows, :saturday, :boolean
    add_column :shows, :sunday, :boolean
  end
end

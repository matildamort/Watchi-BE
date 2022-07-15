class AddDayToShow < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :day, :string
  end
end

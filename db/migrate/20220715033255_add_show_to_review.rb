class AddShowToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :show, null: false, foreign_key: true
  end
end

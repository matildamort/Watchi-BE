class AddReviewToShow < ActiveRecord::Migration[6.1]
  def change
    add_reference :shows, :review, null: true, foreign_key: true
  end
end

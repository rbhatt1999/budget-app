class CreateCategoriesPurchasesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :purchases do |t|
      t.index [:category_id, :purchase_id]
    end
  end
end

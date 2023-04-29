class DefaultValueOfIcon < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :icon, :string, :default => 'https://img.freepik.com/premium-vector/grocery-food-cardboard-box-icon-isolated-white-vector-flat-illustration_623508-34.jpg'
  end
end

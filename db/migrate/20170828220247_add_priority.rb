class AddPriority < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :high_priority, :boolean
  end
end

class AddDefaultValueToTodoItem < ActiveRecord::Migration
  def change
    remove_column(:todo_items,:complated)
    add_column :todo_items, :completed, :boolean, :default => false
  end
end

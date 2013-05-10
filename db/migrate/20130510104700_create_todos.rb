class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |todo|
       todo.string :task
       todo.boolean :completed, default: "false"
       todo.timestamps
     end
  end
end

class Controller

  def initialize
    @viewer = Viewer.new
  end

  def run_command(input)
    command = input.shift
    arguments = input.join(" ")

    if command == "list"
      list_tasks
    elsif command == "delete"
      delete_task(arguments.to_i)
    elsif command == "complete"
      mark_task_complete(arguments.to_i)
    elsif command == "add"
      add_task(arguments)
    else
      @viewer.incorrect_arguments
    end
  end
  
  def list_tasks
    @viewer.list(Todo.all)
  end

  def delete_task(id)
    deleted_task = Todo.find_by_id(id).task
    deleted = Todo.delete(id)
    if deleted == 1
      @viewer.deleted_confirm( deleted_task )
    elsif deleted == 0
      @viewer.deleted_error
    end
  end

  def mark_task_complete(id)
    Todo.update(id, :completed => 't')
    @viewer.completed_message(id)
  end
  
  def add_task(task)
    Todo.create(:task => task)
    @viewer.added_task(task)
  end

end

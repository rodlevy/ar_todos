class Viewer

  def list(array)
    array.each do |item|
      if item.completed == true
        print_complete = "[X]"
      else
        print_complete = "[ ]"
      end
      puts "ID: #{item.id} #{item.task}".ljust(65) + "#{print_complete}".rjust(15)
    end
  end

  def deleted_confirm(task)
    puts "You have deleted the task, \'#{task}\'."
  end

  def deleted_error
    puts "Please enter a valid Todo id to delete."
  end

  def incorrect_arguments
    puts "Please enter 'list', 'delete', 'complete', or 'add'"
    puts "With the appropriate arguments."
    puts "Jerk."
  end

  def completed_message(id)
    puts "You have completed Todo item no. #{id}."
  end

  def added_task(task)
    puts "You have added \'#{task}\' to your Todo list."
  end

end

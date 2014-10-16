

# ------------------------------------------------------------
=begin

require_relative '../../config/application'

class List
  attr_reader :todo_list
  def initialize
    @todo_file = 'todo.txt'
    import_existing_list
  end

  def add_task_to_list (new_task_description)
    @todo_list << create_new_task(new_task_description)
    save_list
  end

  def complete_task(task_to_mark_complete)
    task_number_possible_check(task_to_mark_complete)
    @todo_list[task_to_mark_complete - 1].mark_completed
    save_list
  end

  def create_new_task(task_info)
    unless task_info.class == Hash
      empty_space, task_status, task_description = task_info.split(/(\[[xX]\])|(\[[ ]\])/)
      task_description.lstrip!.chomp!
      task_info = {task_description: task_description, task_status: task_status}
    end
    Task.new(task_info)
  end

  def delete_task(task_to_delete)
    task_number_possible_check(task_to_delete)
    task_text = @todo_list[task_to_delete - 1].task_description
    @todo_list.delete_at(task_to_delete - 1)
    puts "Deleted \"#{task_text}\" from your todo list..."
    save_list
  end

  def import_existing_list
    @todo_list = nil
    return @todo_list if @todo_list
    @todo_list = []
    f = File.open(@todo_file, "r")
    f.each_line do |line|
      @todo_list << create_new_task(line.chomp)
    end
    f.close
  end

  def parse_command_line
    case ARGV[0]
    when 'add' then Task.create({task_description: ARGV[1..-1].join(' ')})
    when 'complete' then mark_completed(ARGV[-1].to_i)
    when 'delete' then destroy(ARGV[-1].to_i)
    when 'list' then Task.list_all
    else puts "#{ARGV[0]} is not an available command."
    end
  end

  def print_list
    @todo_list.each_with_index do |todo, index|
      puts "#{todo.completed?} #{index + 1}. #{todo.task_description}"
    end
  end

  def save_list
    f = File.open(@todo_file, "w")
    @todo_list.each do |todo|
      f.write(todo.to_s)
    end
    f.close
  end

  def task_number_possible_check(task_number)
    return (puts "Task #{task_number} isn't in the range of possibilities") if task_number > @todo_list.length
  end

end

=end

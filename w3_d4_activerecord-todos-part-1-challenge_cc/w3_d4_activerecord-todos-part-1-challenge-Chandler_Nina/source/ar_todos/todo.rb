require_relative 'config/application'
require_relative 'app/models/taskmodel'

# puts "Put your application code in #{File.expand_path(__FILE__)}"



  def parse_command_line
    case ARGV[0]
    when 'add' then Task.create({task_description: ARGV[1..-1].join(' ')})
    when 'complete' then Task.mark_completed(ARGV[-1].to_i)
    when 'delete' then Task.destroy(ARGV[-1].to_i)
    when 'list' then Task.list_all
    else puts "#{ARGV[0]} is not an available command."
    end
  end

if ARGV[0]
  parse_command_line
else
  p "Please enter a command."
end

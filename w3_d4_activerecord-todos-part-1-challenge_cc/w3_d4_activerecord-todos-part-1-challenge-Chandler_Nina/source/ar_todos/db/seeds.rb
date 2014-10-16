require_relative '../app/models/taskmodel.rb'
require 'faker'

10.times do
  Task.create :task_description => Faker::Hacker.say_something_smart
end



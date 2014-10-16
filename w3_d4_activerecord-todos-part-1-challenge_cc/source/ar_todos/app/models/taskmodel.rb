require_relative '../../config/application'

class Task < ActiveRecord::Base
  def to_s
    "#{self.task_status} #{self.task_description}\n"
  end

  def self.mark_completed(id)
    p completed_item = find(id)
    completed_item.update_attribute(:task_status, '[X]')
    list_all
  end

  def self.list_all
    tasks = self.all
    tasks.each do |task|
      puts task
    end
  end

end

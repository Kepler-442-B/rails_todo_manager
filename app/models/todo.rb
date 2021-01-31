class Todo < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{todo_text} is due at #{due_date.to_s(:long)} #{completed ? "[x]" : "[ ]"}"
  end

  def self.due_today
    all.where('due_date = ?', Date.today)
  end

  def self.due_later
    all.where('due_date > ?', Date.today)
  end

  def self.overdue
    all.where('due_date < ?', Date.today)
  end

  def self.completed
    all.where('completed = ?', true)
  end
end

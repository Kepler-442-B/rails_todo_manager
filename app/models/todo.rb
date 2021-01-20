class Todo < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{todo_text} is due at #{due_date.to_s(:long)} #{completed ? "[x]" : "[ ]"}"
  end
end

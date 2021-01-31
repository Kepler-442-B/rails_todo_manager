class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end


  def show
    id = params[:id]
    todo_string = Todo.find(id).to_pleasant_string
    render plain: todo_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    created_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)

    render plain: "This is the ID of the todo that was created --> #{created_todo.id}"
  end

  def update
    todo_id = params[:id]
    due_date = params[:due_date]

    todo = Todo.find(todo_id)

    if due_date
      todo.due_date = due_date
    end

    completed = params[:completed]
    if completed
      todo.completed = completed
    end

    todo.save

    render plain: "#{todo.to_pleasant_string} is the updated todo."
  end
end

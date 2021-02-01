class TodosController < ApplicationController
  def index
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

    redirect_to todos_path
  end

  def update
    todo_id = params[:id]
    due_date = params[:due_date]

    todo = Todo.find(todo_id)

    if due_date
      todo.due_date = due_date
    end

    completed = params[:completed]
    todo.completed = completed

    todo.save

    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy!
    redirect_to todos_path
  end
end

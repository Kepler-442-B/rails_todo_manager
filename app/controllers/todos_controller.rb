class TodosController < ApplicationController
  def index
    render plain: "Hello, this is from /todos!"
  end
end
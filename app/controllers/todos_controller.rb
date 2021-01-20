class TodosController < ApplicationController
  def index
    render plain: "Hello, this is rendered from /todos!"
  end
end
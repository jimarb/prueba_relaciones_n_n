class TodosController < ApplicationController
  def index
    @todos = Todo.limit(9)
  end

  def show
    @todo = Todo.find(params[:todo_id])
  end

end

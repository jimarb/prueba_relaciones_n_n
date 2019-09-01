class TodosController < ApplicationController
  def index
    @todos = Todo.limit(9)
  end

  def show
    @todo = Todo.find(params[:id])
    @ranking5 = Todouser.limit(5).where(todo_id: @todo.id).order(created_at: :asc)
    @users_todo_finish = Todouser.all.where(todo_id: @todo.id).order(created_at: :asc)
  end

end

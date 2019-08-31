class TodousersController < ApplicationController
  before_action :authenticate_user!
  def create
    @todo = Todo.find(params[:todo_id])
    Todouser.create(todo: @todo, user:current_user)
  end
end

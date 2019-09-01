class TodousersController < ApplicationController
  before_action :authenticate_user!
  def create
    @todo = Todo.find(params[:todo_id])
    @todouser = Todouser.new(todo: @todo, user:current_user, done: true)
    if @todouser.save
      redirect_to todos_index_path, notice: 'La tarea ha sido terminada'
    else
      redirect_to todos_index_path, alert: 'La tarea no ha podido ser terminada'
    end
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
    @todouser = Todouser.find_by(todo: @todo, user: current_user, done:true)
    if Todouser.exists?(user_id: current_user.id, todo_id: @todo.id, done: true)
      @todouser.destroy
      redirect_to todos_index_path, alert: 'La tarea ya no esta terminada'
    else
      redirect_to todos_index_path, alert: 'La tarea no puedo cambiar de estado'
    end
  end

end

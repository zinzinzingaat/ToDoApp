class TodosController < ApplicationController

def new
  @todos = Todo.new
end

def create
  @todos = Todo.create(todo_params)
  if @todos.save
    flash[:notice] = "The todo was created successfully."
    redirect_to todo_path(@todos)
  else
    render 'new'
  end
end

def show
  @todos = Todo.find(params[:id])
end



private
def todo_params
  params.require(:todo).permit(:name,:description)
end
end

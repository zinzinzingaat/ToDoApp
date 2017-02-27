class TodosController < ApplicationController


def index
 @todos = Todo.all
end

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

def edit
 @todos = Todo.find(params[:id])
end

def update
   @todos = Todo.find(params[:id])
  if @todos.update(todo_params)
    flash[:notice] = "The todo was updated successfully."
    redirect_to todo_path(@todos)
  else
    render 'edit'
  end
end

def destroy
  @todos = Todo.find(params[:id])
  flash[:notice] = "Todo item was successfully deleted"
  @todos.destroy
  redirect_to todos_path
end

private
def todo_params
  params.require(:todo).permit(:name,:description)
end
end

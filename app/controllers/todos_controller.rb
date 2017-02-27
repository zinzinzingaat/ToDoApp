class TodosController < ApplicationController

def new
  @todos = Todo.new
end


end

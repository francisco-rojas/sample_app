class MicropostsController < ApplicationController
  before_filter :authenticate #, :only => [:create, :destroy]  |-> necesary only if another accion is added and the user does not need to be authenticated to access it

  def create
  end

  def destroy
  end
end
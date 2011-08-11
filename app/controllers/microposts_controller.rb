class MicropostsController < ApplicationController
  before_filter :authenticate #, :only => [:create, :destroy]  |-> necesary only if another accion is added and the user does not need to be authenticated to access it

  def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end
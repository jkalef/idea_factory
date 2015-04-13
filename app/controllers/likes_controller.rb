class LikesController < ApplicationController

  #like an idea
  def create
    like = current_user.likes.new
    idea = Idea.find(params[:idea_id])
    like.idea = idea

    if like.save
      redirect_to root_path, notice: "idea liked!"
    else
      redirect_to root_path, alert: "like didn't work..try again"
    end
  end


  #unlike an idea
  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to root_path, alert: "unliked!"
  end

end

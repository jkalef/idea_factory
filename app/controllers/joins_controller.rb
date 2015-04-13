class JoinsController < ApplicationController

  #join an idea
  def create
    join = current_user.joins.new
    idea = Idea.find(params[:idea_id])
    join.idea = idea

    if join.save
      redirect_to root_path, notice: "Joined Idea!"
    else
      redirect_to root_path, alert: "Join didn't work..."
    end

  end

  #unjoin an idea
  def destroy
    join = Join.find(params[:id])
    join.destroy
    redirect_to root_path, notice: "unjoined idea"
  end

end

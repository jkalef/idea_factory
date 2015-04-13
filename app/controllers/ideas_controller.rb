class IdeasController < ApplicationController


  def index
    #show all of the ideas on this page
    @ideas = Idea.all

    #for the jquery form
    @idea = Idea.new
  end


  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to root_path, notice: "Idea Created!"
    else
      render :new
    end
  end


  def new
    @idea = Idea.new

  end


  def show
    @idea = Idea.find(params[:id])

    #instantiate a new commment to be created
    @comment = Comment.new

    #this will dispaly the most recent comments first
    @comments = @idea.comments.most_recent_comments
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :body, :picture)
  end


end

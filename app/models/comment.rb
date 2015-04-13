class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  

  #---CLASS METHODS------------------
  #display most recent comments first
  def self.most_recent_comments
    Comment.order("created_at DESC")
  end


end

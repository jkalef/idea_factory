class Join < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  #--VALIDATIONS--------------------------------------
  #combination of user and idea must be unique
  validates :user_id, uniqueness: {scope: :idea_id}
end

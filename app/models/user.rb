class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #--ASSOCIATIONS------------------------------
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy

  #many to many for joins/member ideas
  has_many :joins, dependent: :destroy
  has_many :ideas_joined, through: :joins, source: :idea

  #many to many for likes
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea


end

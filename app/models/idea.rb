class Idea < ActiveRecord::Base
  #--ASSOCIATIONS-----------------------
  has_many :comments, dependent: :destroy
  belongs_to :user

  #many to many for 'joins' (or members)
  has_many :joins, dependent: :destroy
  has_many :users_who_joined, through: :joins, source: :user

  #many to many for likes
  has_many :likes, dependent: :destroy
  has_many :users_who_liked, through: :likes, source: :user

  #---VALIDATIONS-------------------------
  validates :title, uniqueness: true

   #--FOR ATTACHING IMAGES w/ PAPERCLIP--------------
  has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end

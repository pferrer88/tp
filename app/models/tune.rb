class Tune < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  belongs_to :album
  has_many 		:playlists
  has_many 		:genres
  has_one			:pic
  attr_accessible :name, :remote_id, :time, :year, :user_id, :artist_id, :album_id, :description 
end

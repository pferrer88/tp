class Tune < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  belongs_to :album
  has_and_belongs_to_many :playlists, :join_table => "tune_playlists"
  has_many 		:genres
  has_one			:pic
  attr_accessible :name, :remote_id, :time, :year, :user_id, :artist_id, :album_id, :description, :playlist_tokens

  attr_reader :playlist_tokens
  
  def playlist_tokens=(tokens)
    self.playlist_ids = Playlist.ids_from_tokens(tokens)
  end
  
  def remote_url
    client = Soundcloud.new(:client_id => 'f2334dc770efb325207e4eb621703422')
    t = client.get('/tracks', :id => remote_id)
    t.first.stream_url
  end
  
  def link
    client = Soundcloud.new(:client_id => 'f2334dc770efb325207e4eb621703422')
    t = client.get('/tracks', :id => remote_id)
    t.first.permalink_url
  end
  
end

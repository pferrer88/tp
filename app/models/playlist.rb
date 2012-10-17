class Playlist < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
  has_and_belongs_to_many :tunes, :join_table => "tune_playlists"

  # has_many :authorships
  # has_many :books, through: :authorships
  
  def self.tokens(query)
    playlists = where("name like ?", "%#{query}%")
    if playlists.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      playlists
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
end

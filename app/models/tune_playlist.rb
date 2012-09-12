class TunePlaylist < ActiveRecord::Base
  belongs_to :tune
  belongs_to :playlist
  # attr_accessible :title, :body
end

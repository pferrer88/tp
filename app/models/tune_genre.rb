class TuneGenre < ActiveRecord::Base
  belongs_to :tune
  belongs_to :genre
  # attr_accessible :title, :body
end

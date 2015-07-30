class Idea < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :description, :name, :picture, :keyword1, :score1, :keyword2, :score2

  def init
    self.keyword1 ||= "null"
    self.keyword2 ||= "null"
    self.score1 ||= 0.0
    self.score2 ||= 0.0
  end
end

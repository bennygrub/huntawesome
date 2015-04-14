class Level < ActiveRecord::Base
  validates :name, :description, :pillar, :points, presence: true
  validates :pillar, :name, uniqueness: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/level.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

class Campaign < ActiveRecord::Base
  belongs_to :agency
  has_many :posts
  has_many :milestones
end

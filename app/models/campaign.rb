class Campaign < ActiveRecord::Base
  belongs_to :agency
  has_many :posts
  has_many :milestones
  has_one :twitter

  def to_param
    "#{id} #{name}".parameterize
  end
end

class User < ActiveRecord::Base
  belongs_to :client
  belongs_to :agency
  has_many :posts
  has_many :milestones

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  def name
    "#{first_name} #{last_name}"
  end
end

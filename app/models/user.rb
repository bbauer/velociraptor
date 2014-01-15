class User < ActiveRecord::Base
  belongs_to :client
  has_many :posts

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
end

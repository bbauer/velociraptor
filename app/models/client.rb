class Client < ActiveRecord::Base
  has_one :google_analytics
  has_one :twitter
  has_many :users
  has_many :posts
end

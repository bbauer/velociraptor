class Client < ActiveRecord::Base
  has_one :google_analytics
  has_one :twitter
end

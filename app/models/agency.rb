class Agency < ActiveRecord::Base
  has_many :users

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :campaigns
end

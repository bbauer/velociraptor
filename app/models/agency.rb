class Agency < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :users
  has_many :campaigns

  validates :name, uniqueness: true
end

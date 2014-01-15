class Milestone < ActiveRecord::Base
  NEW = "new"
  STARTED = "started"
  FINISHED = "finished"
  ACCEPTED = "accepted"

  STATUSES = [NEW, STARTED, FINISHED, ACCEPTED]

  belongs_to :client
  belongs_to :user

  validates :status, inclusion: { in: STATUSES }

  default_scope { order('status') }
end

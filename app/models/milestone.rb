class Milestone < ActiveRecord::Base
  NEW = "1"
  STARTED = "2"
  FINISHED = "3"
  ACCEPTED = "4"

  STATUSES = [NEW, STARTED, FINISHED, ACCEPTED]

  belongs_to :client
  belongs_to :user

  validates :status, inclusion: { in: STATUSES }

  default_scope { order('status') }

  def status_class
    return "new" if status == "1"
    return "started" if status == "2"
    return "finished" if status == "3"
    return "accepted" if status == "4"
  end

  def status_button
    return "start" if status == "1"
    return "finish" if status == "2"
    return "accept" if status == "3"
    return "accepted" if status == "4"
  end
end

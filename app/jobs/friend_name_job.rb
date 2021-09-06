class FriendNameJob < ApplicationJob
  queue_as :default

  def perform(friend)
    # Do something later
    friend.the_name
  end
end

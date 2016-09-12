class AuctionsJob < ApplicationJob
  queue_as :auctions

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
     # Do something with the exception
  end

  def perform(auction)
    # Do something later
    auction.correct_status
  end
end

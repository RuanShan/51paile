module ChannelNotification
  class Auction < Base
    EventEnum = struct.new( :bid, :started, :end )[:bid, :started, :end]

    def self.bid(auction)
      new( EventEnum.bid, auction ).message
    end

    def self.start(auction)
      new( EventEnum.started, auction ).message
    end

    def self.end(auction)
      new( EventEnum.end, auction ).message
    end

    def initialize( event, auction)
       self.event = event
       self.model   = auction
    end

    def message
      {  event: event, data: data }
    end

    def data
      model.channel_attributes
    end
  end
end

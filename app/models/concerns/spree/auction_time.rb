module Spree
  module AuctionTime
    extend ActiveSupport::Concern
    # get time in Milliseconds, for js post processing
    def timetoend
      endat - nowat
    end

    def hours_to_end

    end

    def minutes_to_end
    end

    def seconds_to_end
    end

    def timetostart
      startat - nowat
    end

    def startat
      (starts_at.to_f*1000).to_i
    end

    def endat
      (ends_at.to_f*1000).to_i
    end

    def nowat
      (DateTime.current.to_f*1000).to_i
    end

    def formatted_closed_at
      ends_at.to_formatted_s( :auction_long )
    end

    def formatted_auction_period
       distance_in_minutes = ((ends_at - starts_at)/60.0).round
       period = ""

       if distance_in_minutes >= 60 * 24 # more than 1 day
         period << "#{distance_in_minutes/60/24 } 天"
         distance_in_minutes = distance_in_minutes%(60*24)
       end

      if distance_in_minutes >= 60
         period << " #{distance_in_minutes/60} 小时"
         distance_in_minutes = distance_in_minutes%60
      end

       if distance_in_minutes >0
         period << "#{distance_in_minutes } 分钟"
       end

       period

    end

  end
end

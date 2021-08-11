class Item 
  attr_reader :name, :bids
  def initialize(name) 
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    @bids.values.max do |value|
      value
    end
  end

  def close_bidding
    require "pry"; binding.pry
  end
end
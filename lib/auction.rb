class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    not_cool = []
    @items.each do |item|
      if item.bids.length == 0
        not_cool << item
      end
    end
    not_cool
  end

  def potential_revenue
    totals = 0
    @items.each do |item|
      if item.current_high_bid.nil?
        totals += 0
      else
        totals += item.current_high_bid
      end
    end
    totals
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.each do |bid|
        bidders << bid[0].name
      end
    end
    bidders.uniq
  end

  def bidder_info
    binfo = {}
    item_array = []
    @items.each do |item|
      if item.bids.length > 0
        item_array << item
      end
      item_array
    end
    @items.each do |item|
      item.bids.keys.each do |key|
        binfo[key] = {:budget => key.budget, :items => item_array}
      end
    end
    binfo
  end
end
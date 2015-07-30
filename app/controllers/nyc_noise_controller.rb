class NycNoiseController < ApplicationController

  def index
    @twenty_four = Aggregator.all_twenty_four
  end

end

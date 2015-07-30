class NycNoiseController < ApplicationController

  def index
    @twenty_four_types = Aggregator.descriptors_twenty_four
  end

end

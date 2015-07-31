class NycNoiseController < ApplicationController

  def index
    @complaint_types = Aggregator.descriptors
    @all_twenty_four = Aggregator.twenty_four_all
  end

  def descriptor
    @descriptor = params[:descriptor]
    @twenty_four = Aggregator.twenty_four_layer(@descriptor)
  end

end

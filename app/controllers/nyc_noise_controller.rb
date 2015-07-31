class NycNoiseController < ApplicationController

  def index
    # @twenty_four_types = Aggregator.descriptors_twenty_four
    # @all_layers = Aggregator.twenty_four_all
    @complaint_types = Aggregator.descriptors
    @all_twenty_four = NycNoise.twenty_four
  end

  # def layer
  #   render json: layer = Aggregator.twenty_four_layer(params[:layer])
  # end

  def descriptor
    @descriptor = params[:descriptor]
    @twenty_four = Aggregator.twenty_four_layer(@descriptor)
    #@twenty_four = NycNoise.twenty_four_by_description(@descriptor)
    respond_to do |format|
      format.js
    end
  end

end

class NycNoiseController < ApplicationController

  def index
    @twenty_four_types = Aggregator.descriptors_twenty_four
    # @all_layers = Aggregator.twenty_four_all
  end

  def layer
    render json: layer = Aggregator.twenty_four_layer(params[:layer])
  end

end

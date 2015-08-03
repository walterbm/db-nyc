class NycNoiseController < ApplicationController

  protect_from_forgery except: :test

  def index
    @complaint_types = Aggregator.descriptors
  end

  def descriptor
    @descriptor = params[:descriptor]
    @twenty_four = Aggregator.twenty_four_layer(@descriptor)
  end

end

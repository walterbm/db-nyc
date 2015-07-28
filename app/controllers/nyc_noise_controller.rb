class NycNoiseController < ApplicationController

  def index
    @nyc_noises = NycNoise.all
    # render text: "hello"
  end


end

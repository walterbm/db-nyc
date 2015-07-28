class NycNoiseController < ApplicationController

  def index
    @noise_complaints = NycNoise.coordinates
  end


end

class NycNoiseController < ApplicationController

  def index
    @twenty_four_types = NycNoise.descriptors_twenty_four
  end

end

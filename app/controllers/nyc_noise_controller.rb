class NycNoiseController < ApplicationController

  def index
    @twenty_four = NycNoise.twenty_four
  end

end

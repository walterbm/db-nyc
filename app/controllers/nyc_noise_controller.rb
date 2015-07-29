class NycNoiseController < ApplicationController

  def index
    @noise_complaints = NycNoise.coordinates
  end

  def hourly
    @noise_complaints = NycNoise.per_hour(params[:hour])
    render json: @noise_complaints
  end


end

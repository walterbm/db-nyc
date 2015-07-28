class NycNoiseController < ApplicationController

  def index
    @noise_complaints = NycNoise.per_hour(0)
  end

  def catch
    @noise_complaints = NycNoise.per_hour(params[:hour])
    render :index
  end


end

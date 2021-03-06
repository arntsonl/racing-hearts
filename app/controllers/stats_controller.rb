class StatsController < ApplicationController
  def index
    render json: json_attrs
  end

  protected

  def json_attrs
    {
      hearts: current_user.hearts_cents.to_f / 100,
      perfumes: current_user.perfumes,
      roses: current_user.roses,
      chocolates: current_user.chocolates,
      silks: current_user.silks,
      jewels: current_user.jewels,
      current_town: {
        id: current_user.current_location.id,
        name: current_user.current_location.name
      },
      name: current_user.name
    }
  end
end
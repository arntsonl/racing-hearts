class NpcsController < ApplicationController
  def index
    render json: current_user.current_location.npcs.collect { |ncp| { id: ncp.id, name: ncp.name } }
  end

  def show
    npc = current_user.current_location.npcs.find { |ncp| ncp.id.downcase == params[:id].downcase }
    render nothing: true and return if npc.nil?

    render json: {
      buy: npc.buy,
      sell: npc.sell,
      valentine: npc.valentine
    }
  end

  def buy
    npc = current_user.current_location.npcs.find { |ncp| ncp.id.downcase == params[:id].downcase }
    render nothing: true and return if npc.nil?

    npc.sell_to_user(current_user, params[:type], params[:amount])
    render nothing: true
  end
end
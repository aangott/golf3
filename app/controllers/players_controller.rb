class PlayersController < ApplicationController
  before_filter :authenticate

  def index
    @categorized_players = {
      'First Flight' =>  Player.where(flight: 'First').sort_by { |p| p.number.to_i },
      'Second Flight' => Player.where(flight: 'Second').sort_by(&:number),
      'Substitutes' => Player.where(flight: 'Substitute').sort_by(&:last_name),
      'Inactive' => Player.unscoped.where(active: false).sort_by(&:last_name)
    }
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = 'Player successfully added.'
      redirect_to players_path
    else
      render :action => 'new'
    end
  end

  def edit
    @player = Player.unscoped.find(params[:id])
  end

  def update
    @player = Player.unscoped.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:success] = 'Player information successfully updated.'
      redirect_to players_path
    else
      render :action => 'edit'
    end   
  end

  def destroy
    @player = Player.unscoped.find(params[:id])
    @player.destroy
    flash[:success] = 'Player successfully deleted.'
    redirect_to players_path
  end

  def player_params
    params.require(:player).permit(
      :first_name, 
      :last_name,
      :suffix,
      :flight,
      :number,
      :starting_average,
      :active
    )
  end
  private :player_params

end

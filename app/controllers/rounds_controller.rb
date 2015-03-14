class RoundsController < ApplicationController

  def index
    @rounds = Round.this_year
  end

  def new
    @round_form = RoundForm.new(Round.new)
  end

  def create
    @round_form = RoundForm.new(Round.new)
    if @round_form.submit(params)
      flash[:success] = 'Round successfully added.'
      redirect_to rounds_path
    else
      render :action => 'new'
    end
  end

end

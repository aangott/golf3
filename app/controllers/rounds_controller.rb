class RoundsController < ApplicationController

  def index
    @rounds = Round.this_year
  end

  def new
    @round_form = RoundForm.new(Round.new, false)
    @form_url = rounds_path
  end

  def create
    @round_form = RoundForm.new(Round.new, false)
    if @round_form.submit(params[:round])
      flash[:success] = 'Round successfully added.'
      redirect_to rounds_path
    else
      render :action => 'new'
    end
  end

  def edit
    @round = Round.find(params[:id])
    @round_form = RoundForm.new(@round, true)
    @form_url = round_path(@round)
  end

  def update
    round = Round.find(params[:id])
    @round_form = RoundForm.new(round, true)
    if @round_form.submit(params[:round])
      flash[:success] = 'Round successfully updated.'
      redirect_to rounds_path
    else
      render :action => 'edit'
    end
  end

  def show
    @round = Round.find(params[:id])
  end

end

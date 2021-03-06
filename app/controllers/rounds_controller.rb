class RoundsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  
  def index
    @rounds = Round.this_year.sort_by(&:date)
  end

  def new
    @round = Round.new
    @round_form = RoundForm.new(@round, false)
    @form_url = rounds_path
  end

  def create
    @round = Round.new
    @round_form = RoundForm.new(@round, false)
    if @round_form.submit(params[:round], params[:matches])
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
    if @round_form.submit(params[:round], params[:matches])
      flash[:success] = 'Round successfully updated.'
      redirect_to rounds_path
    else
      render :action => 'edit'
    end
  end

  def show
    @round = Round.find(params[:id])
  end

  def destroy
    @round = Round.find(params[:id])
    @round.destroy
    flash[:success] = 'Round successfully deleted.'
    redirect_to rounds_path
  end

end

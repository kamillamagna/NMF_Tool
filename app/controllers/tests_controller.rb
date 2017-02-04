class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      flash[:success] = "#{@diagnosis.note} of #{find_trail(Topic.find(@diagnosis.topic_id))} added to visit"
      redirect_to edit_visit_path(@diagnosis.visit_id)
    else
      flash[:error]
    end

  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        flash[:success] = "Test #{@test.id} for #{find_trail(@test.topic_id)} updated record"
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    flash[:success] = "Test #{@test.id} for #{find_trail(@test.topic_id)} deleted from record"
    redirect_to :back
  end

  private
    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.fetch(:test, {})
    end
end

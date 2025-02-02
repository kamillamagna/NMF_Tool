# tests controller
class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def edit
    @test = Test.find(params[:id])
    @patient = Patient.find(@test.patient_id)
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      message = "#{@test.note} of #{find_pretty_trail(@test.topic_id)} added"
      flash[:success] = message
      redirect_to session[:back_to] ||= request.referer
    else
      message = "Please re-check information: #{@test.errors.full_messages}"
      flash[:danger] = message
    end
  end

  def update
    @test = Test.find(params[:id])
    respond_to do |format|
      if @test.update(test_params)
        flash[:success] = "Updated test for #{find_trail(@test.topic_id)}"
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    message = "Test for #{find_trail(@test.topic_id)} deleted from record"
    flash[:success] = message
    redirect_to session[:back_to] ||= request.referer
  end

  def back_url
    request.referer
  end

  private

  def test_params
    params.require(:test).permit(
      :patient_id,
      :visit_id,
      :topic_id,
      :clinician_id,
      :test_amount,
      :test_unit_of_meas,
      :present,
      :result,
      :time_ago,
      :time_ago_scale,
      :absolute_start_date,
      :note,
      :attachment
    )
  end
end

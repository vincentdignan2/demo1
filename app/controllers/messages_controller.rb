class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
 
  end

  def show

  end

  def new
    @answer = Answer.new

  end

  def edit
  end

  def create
    
    require 'nexmo'

nexmo = Nexmo::Client.new(key: f685f0b5, secret: 00e00adf)

nexmo.send_message(from: 'Ruby', to: 'YOUR NUMBER', text: 'Hello world')
    
    @answer = Answer.new(answer_params)
     respond_to do |format|
       if @answer.save
        format.html { redirect_to @answer, notice: 'Awesome! Your answer has been recorded.'}
         format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @answer.update(answer_params)
 respond_to do |format|
    if @answer.save
      format.html { redirect_to @answer, notice: 'Awesome! Your answer has been recorded.'}
      format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy

  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:text, :question_id, :user_id, :votes)
    end
end
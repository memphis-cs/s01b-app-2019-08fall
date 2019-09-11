class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :require_permission, only: [:edit]
  layout 'standard'

  def index
    quizzes = Quiz.all
    respond_to do |format|
      format.html { render :index, locals: { quizzes: quizzes } }
    end
  end

  def show
    begin
      quiz = Quiz.find(params[:id])
    rescue
      redirect_to root_url, flash: { error: "Quiz not found." } and return
    end
    respond_to do |format|
      format.html { render :show, locals: { quiz: quiz } }
    end
  end

  def take
    user_answers = []
    begin
      quiz = Quiz.find(params[:id])
    rescue
      redirect_back(fallback_location: quizzes_path, flash: { error: "Quiz not found." }) and return
    end
    respond_to do |format|
      format.html { render :take, locals: { quiz: quiz, user_answers: user_answers } }
    end
  end

  def check_answer
    begin
      quiz = Quiz.find(params[:id])
    rescue
      redirect_back(fallback_location: quizzes_path, flash: { error: "Question not found." }) and return
    end
    puts params[:user_answers]
    if params[:guess] && params[:guess].to_s == question.answer
      flash.now[:notice] = "Right! #{question.answer} was the correct answer."
    elsif params[:guess]
      flash.now[:alert] = "Wrong! #{question.answer} was the correct answer."
    else
      flash.now[:alert] = "Error: Invalid answer."
    end
    respond_to do |format|
      format.js { render :take, locals: { question: question, seed: params[:seed].to_i, user_ans: params[:guess] } }
    end
  end

  def new
    quiz = Quiz.new
    quiz.user = current_user
    respond_to do |format|
      format.html { render :new, locals: { quiz: quiz } }
    end
  end

  def create
    quiz = Quiz.new(params.require(:quiz).permit(:title, :description, :user_id))
    respond_to do |format|
      if quiz.save
        format.html { redirect_to quiz_url(quiz), notice: 'Quiz was successfully created.' }
      else
        flash.now[:error] = 'Error! Unable to create quiz.'
        format.html { render :new, locals: { quiz: quiz } }
      end
    end
  end

  def edit
    begin
      quiz = Quiz.find(params[:id])
      quiz.user = current_user
    rescue
      redirect_to root_url, flash: { error: "Quiz not found." } and return
    end
    respond_to do |format|
      format.html { render :edit, locals: { quiz: quiz } }
    end
  end

  def update
    begin
      quiz = Quiz.find(params[:id])
    rescue
      redirect_to root_url, flash: { error: "Quiz not found." } and return
    end
    respond_to do |format|
      if quiz.update(params.require(:quiz).permit(:title, :description, :user_id))
        format.html { redirect_to quiz_url(quiz), notice: 'Quiz was successfully updated.' }
      else
        flash.now[:error] = 'Error! Unable to update quiz.'
        format.html { render :edit, locals: { quiz: quiz } }
      end
    end
  end

  def check_answer
    puts params
    begin
      question = Question.find(params[:question_id])
    rescue
      flash.now[:error] = "Question not found."
    end
    correct = false
    if params["guess_#{question.id}"] && params["guess_#{question.id}"].to_s == question.answer
      flash.now[:notice] = "Right! #{question.answer} was the correct answer."
      correct = true
    elsif params["guess_#{question.id}"]
      flash.now[:alert] = "Wrong! #{question.answer} was the correct answer."
    else
      flash.now[:error] = "Error: Invalid answer."
    end
    respond_to do |format|
      format.js { render :check_answer, locals: { question: question, seed: params[:seed].to_i || nil, user_ans: params["guess_#{question.id}"], correct: correct } }
    end
  end

  
  def require_permission
    if Quiz.find(params[:id]).user != current_user
      redirect_to root_path, flash: { error: "You do not have permission to do that." }
    end
  end

end

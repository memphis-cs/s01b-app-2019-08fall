class MultipleChoiceQuestionsController < ApplicationController
  layout "standard"

  def random
    begin
      question = MultipleChoiceQuestion.unscoped.limit(1).order("RANDOM()").first
    rescue
      redirect_to root_url, flash: { error: "No questions found." } and return
    end
    respond_to do |format|
      format.html { render :random, locals: { question: question, seed: rand(10), user_ans: nil, correct: nil } }
    end
  end

  def check_answer
    begin
      question = MultipleChoiceQuestion.find(params[:question_id])
    rescue
      redirect_to root_url, flash: { error: "Question not found." } and return
    end
    correct = false
    if params["guess_#{question.id}"] && params["guess_#{question.id}"].to_s == question.answer
      flash.now[:notice] = "Right! #{question.answer} was the correct answer."
      correct = true
    elsif params["guess_#{question.id}"]
      flash.now[:alert] = "Wrong! #{question.answer} was the correct answer."
    else
      flash.now[:alert] = "Error: Invalid answer."
    end
    respond_to do |format|
      format.html { render :random, locals: { question: question, seed: params[:seed].to_i, user_ans: params["guess_#{question.id}"], correct: correct } }
      format.js { render :check_answer, locals: { question: question, seed: params[:seed].to_i, user_ans: params["guess_#{question.id}"], correct: correct } }
    end
  end

  def index
    questions = MultipleChoiceQuestion.all
    respond_to do |format|
      format.html { render :index, locals: { questions: questions } }
    end
  end

  def show
    begin
      question = MultipleChoiceQuestion.find(params[:id])
    rescue
      redirect_to root_url, flash: { error: "Question not found." } and return
    end
    respond_to do |format|
      format.html { render :show, locals: { question: question } }
    end
  end

  def new
    question = MultipleChoiceQuestion.new
    respond_to do |format|
      format.html { render :new, locals: { question: question } }
      format.js { render :new, locals: { question: question } }
    end
  end

  def create
    question = MultipleChoiceQuestion.new(params.require(:multiple_choice_question).permit(:question, :answer, :distractor_1, :distractor_2))
    respond_to do |format|
      if question.save
        format.html { redirect_to multiple_choice_question_url(question), notice: 'Multiple choice question was successfully created.' }
        format.js { 
          flash.now[:notice] = 'Multiple choice question was successfully created.'
          render :create, locals: { question: question } 
        }
      else
        flash.now[:error] = 'Error! Unable to create multiple choice question.'
        format.html { render :new, locals: { question: question } }
        format.js { render :new, locals: { question: question } }
      end
    end
  end

  def edit
    begin
      question = MultipleChoiceQuestion.find(params[:id])
    rescue
      redirect_to root_url, flash: { error: "Question not found." } and return
    end
    respond_to do |format|
      format.html { render :edit, locals: { question: question } }
    end
  end

  def update
    begin
      question = MultipleChoiceQuestion.find(params[:id])
    rescue
      redirect_to root_url, flash: { error: "Question not found." } and return
    end
    respond_to do |format|
      if question.update(params.require(:multiple_choice_question).permit(:question, :answer, :distractor_1, :distractor_2))
        format.html { redirect_to multiple_choice_question_url(question), notice: 'Multiple choice question was successfully updated.' }
      else
        flash.now[:error] = 'Error! Unable to update multiple choice question.'
        format.html { render :edit, locals: { question: question } }
      end
    end
  end

end

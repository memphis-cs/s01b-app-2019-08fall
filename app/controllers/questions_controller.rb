class QuestionsController < ApplicationController
  layout "standard"

  def new
    puts params
    question = Question.new
    question.quiz_id = params[:quiz_id]
    respond_to do |format|
      format.html { render :new, locals: { question: question } }
      format.js { render :new, locals: { question: question } }
    end
  end

  def create
    if params[:question] 
      if params[:question][:type] == 'MultipleChoiceQuestion'
        question = Question.new(params.require(:question).permit(:question, :answer, :distractor_1, :distractor_2, :quiz_id, :type))
      elsif params[:question][:type] == 'FillBlankQuestion'
        question = Question.new(params.require(:question).permit(:question, :answer, :quiz_id, :type))
      else 
        question = Question.new(params.require(:question).permit(:question, :answer, :distractor_1, :distractor_2, :quiz_id, :type))
      end
    end
    respond_to do |format|
      if question.save
        format.html { redirect_to quiz_url(question.quiz), notice: 'Question was successfully created.' }
        format.js { 
          flash.now[:notice] = 'Question was successfully created.'
          render :create, locals: { question: question } 
        }
      else
        flash.now[:error] = 'Error! Unable to create question.'
        format.html { render :new, locals: { question: question } }
        format.js { render :new, locals: { question: question } }
      end
    end
  end

  def edit
    begin
      question = Question.find(params[:id])
    rescue
      redirect_back(fallback_location: edit_quiz_path(Quiz.find(params[:quiz_id])), flash: { error: "Question not found." }) and return
    end
    respond_to do |format|
      format.html { render :edit, locals: { question: question } }
      format.js { render :edit, locals: { question: question } }
    end
  end

  def update
    begin
      question = Question.find(params[:id])
    rescue
      redirect_back(fallback_location: edit_quiz_path(Quiz.find(params[:quiz_id])), flash: { error: "Question not found." }) and return
    end
    respond_to do |format|
      if question.update(params.require(:question).permit(:question, :answer, :distractor_1, :distractor_2, :quiz_id, :type))
        format.html { redirect_to quiz_url(question.quiz), notice: 'Question was successfully updated.' }
        format.js { 
          flash.now[:notice] = 'Question was successfully updated.'
          render :update, locals: { question: question } 
        }
      else
        flash.now[:error] = 'Error! Unable to update question.'
        format.html { render :edit, locals: { question: question } }
        format.js { render :edit, locals: { question: question } }
      end
    end
  end

  def destroy
    begin
      question = Question.find(params[:id])
    rescue
      redirect_back(fallback_location: quizzes_url, alert: 'Error: Question not found') and return
    end
    quiz = question.quiz
    question.destroy
    respond_to do |format|
      flash.now[:notice] = 'Question was successfully deleted.'
      format.html { redirect_to quiz_url(quiz) }
      format.js { render :destroy, locals: { question: question } }
    end
  end

end

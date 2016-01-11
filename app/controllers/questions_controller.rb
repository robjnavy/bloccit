class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
     # #9
     @question = Question.new(params.require(:question).permit(:title, :body, :resolved))

 # #10
     if @question.save
 # #11
       flash[:notice] = "Question was saved."
       redirect_to @question
     else
 # #12
       flash.now[:alert] = "There was an error saving the question. Please try again."
       render :new
     end
  end

  def update
         @question = Question.find(params[:id])
         if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
           flash[:notice] = "Question was saved."
           redirect_to @question
         else
 # #12
           flash.now[:alert] = "There was an error saving the question. Please try again."
           render :edit
         end
  end

  def destroy
     @question = Question.find(params[:id])
     if @question.destroy
       flash[:notice] = "\"#{@question.title}\" was deleted successfully."
       redirect_to questions_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end
end

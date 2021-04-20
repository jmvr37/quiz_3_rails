class IdeasController < ApplicationController
    before_action :authenticate_user!, except: [:show,:index]
    before_action :find_idea, only: [:show, :edit, :update, :destroy]


    def new
        # create the new instance of an idea which will be displayed
        # available
        @idea = Idea.new
        @submit_text = "Create"
    end

    def create
      
        idea_params = params.require(:idea).permit(:title, :description)
        @idea = Idea.new idea_params

        if @idea.save 
            redirect_to idea_path(@idea.id)
        else
           render :new
           # redirect_to new_idea_path
        end
    end
    
    def show
        @review = Review.new
        @reviews = @idea.reviews.order(created_at: :desc)
       
     end

def index
 @ideas = Idea.all.order(created_at: :desc)
end

def edit 
  
end

def update
    if @idea.update idea_params
        redirect_to idea_path(@idea)
    else
        render :edit
    end
end

def destroy
    @idea.destroy
    redirect_to ideas_path
end

private

def idea_params
    params.require(:idea).permit(:title, :description)

end



def find_idea
    @idea = Idea.find params[:id]
end
end

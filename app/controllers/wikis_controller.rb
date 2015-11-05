class WikisController < ApplicationController
    def index
        @wikis = Wiki.visible_to(current_user)
    end
    
    def show
        @wiki = Wiki.find(params[:id])
        
        if @wiki.private && current_user.standard?
            flash[:error] = "You are not authorized to view this wiki"
            redirect_to root_path
        end
    end
    
    def new
        @wiki = Wiki.new
    end
    
    def create
        @wiki = Wiki.new(wiki_params)
        current_user.wikis << @wiki
        
        if @wiki.save
            flash[:notice] = "Wiki created"
            redirect_to @wiki
        else
            flash[:error] = "There was a problem creating the wiki. Please try again."
            render :new
        end
    end
    
    def edit
        @wiki = Wiki.find(params[:id])
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.assign_attributes(wiki_params)
        
        if @wiki.save
            flash[:notice] = "Wiki saved"
            redirect_to @wiki
        else
            flash[:error] = "There was a problem editing the wiki. Please try again."
            render :edit
        end
    end
    
    def destroy
        @wiki = Wiki.find(params[:id])
        
        if @wiki.destroy
            flash[:notice] = "Wiki deleted"
            redirect_to wikis_path
        else
            flash[:error] = "Wiki could not be deleted"
            render @wiki
        end
    end
    
    private
    def wiki_params
        params.require(:wiki).permit(:title, :body, :private)
    end
end

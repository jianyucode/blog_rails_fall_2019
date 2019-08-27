class PagesController < ApplicationController
  #this is to view all pages
  def index
    @pages = Page.all
    #renders index.html.erb
  end

  #showing a single page
  def show
    @pages = Page.find(params[:id])
    #renders show.html.erb
  end

  #displays the form to create the new page
  def new
    @pages = Page.new
    #renders new.html.erb
  end

#Post request to create the pages
def create
  @pages = Page.new(pages_params)
  if @pages.save
    redirect_to pages_path
  else
    renders :new
  end
end

  #edit form
  def edit
    @pages = Page.find(params[:id])
  end

#update
  def update
    @pages = Page.find(params[:id])
    if @pages.update(pages_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

def destroy
  Page.find(params[:id]).destroy
end
  private
    def pages_params
      params.require(:page).permit(:title, :author, :body)
    end
end

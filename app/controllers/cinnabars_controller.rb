class CinnabarsController < ApplicationController
  before_action :set_cinnabar, only: [:edit, :update, :destroy]
  
  def index
    @cinnabars = Cinnabar.all
  end

  def new
    if params[:back]
      @cinnabar = Cinnabar.new(cinnabars_params)
    else
      @cinnabar = Cinnabar.new
    end
  end

  def create
    @cinnabar = Cinnabar.new(cinnabars_params)
    if @cinnabar.save
      redirect_to cinnabars_path notice: "Created Sinnabus!!"
    else
      render 'new'
    end
  end
  
  def edit
    @cinnabar = Cinnabar.find(params[:id])
  end
  
  def update
    @cinnabar = Cinnabar.find(params[:id])
    @cinnabar.update(cinnabars_params)
    if @cinnabar.save
      redirect_to cinnabars_path, notice: "Updated Sinnabus!!"
    else
      render action: 'new'
    end
  end
  
  def destroy
    @cinnabar = Cinnabar.find(params[:id])
    @cinnabar.destroy
    redirect_to cinnabars_path notice: "Deleted Sinnabus!!"
  end
  
  def confirm
    @cinnabar = Cinnabar.new(cinnabars_params)
    render :new if @cinnabar.invalid?
  end
  
  private
    def cinnabars_params
      params.require(:cinnabar).permit(:content)
    end
    def set_cinnabar
      @cinnabar = Cinnabar.find(params[:id])
    end
end
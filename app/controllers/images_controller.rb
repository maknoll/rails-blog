class ImagesController < ApplicationController
    before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @image = Image.new

    respond_to do |format|
      format.html
      format.json { render :json => @image }
    end
  end

  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, :notice => 'Image was successfully uploaded.' }
        format.json { render :json => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @image }
    end
  end

  def index
    @image = Image.order :created_at

    respond_to do |format|
      format.html
      format.json { render :json => @image }
    end
  end

  def destroy
    @image = Post.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :ok }
    end
  end
end

class StammrPostsController < ApplicationController
  before_action :set_stammr_post, only: [:show, :edit, :update, :destroy]

  # GET /stammr_posts
  # GET /stammr_posts.json
  def index
    @stammr_posts = StammrPost.all
  end

  # GET /stammr_posts/1
  # GET /stammr_posts/1.json
  def show
  end

  # GET /stammr_posts/new
  def new
    @stammr_post = StammrPost.new
  end

  # GET /stammr_posts/1/edit
  def edit
  end

  # POST /stammr_posts
  # POST /stammr_posts.json
  def create
    @stammr_post = StammrPost.new(stammr_post_params)

    respond_to do |format|
      if @stammr_post.save
        format.html { redirect_to @stammr_post, notice: 'Stammr post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stammr_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @stammr_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stammr_posts/1
  # PATCH/PUT /stammr_posts/1.json
  def update
    respond_to do |format|
      if @stammr_post.update(stammr_post_params)
        format.html { redirect_to @stammr_post, notice: 'Stammr post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stammr_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stammr_posts/1
  # DELETE /stammr_posts/1.json
  def destroy
    @stammr_post.destroy
    respond_to do |format|
      format.html { redirect_to stammr_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stammr_post
      @stammr_post = StammrPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stammr_post_params
      params.require(:stammr_post).permit(:content)
    end
end

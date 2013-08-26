class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  # using
  def index
    if session[:id].nil? || session[:id].blank?
      @random_stammr = get_random_stammr
    else
      @random_stammr = StammrPost.find(session[:id])
    end
    @comments = @random_stammr.comments
    @comment = Comment.new
    session[:id] = nil
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    printf(">>>>>>>>>>>>>>" + session[:id] )
    @random_stammr = StammrPost.find(session[:id])
    @comments = @random_stammr.comments
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  # using
  def create
    @comment = Comment.new(comment_params)
    @comment.date_created = Date.today

    if comment_params[:name].blank?
      @comment.name = "Anonymous"
    end

    respond_to do |format|
      if @comment.save
        flash[:notice] = "Your comment was successfully added."
        session[:id] = comment_params[:stammr_post_id]
        format.html { redirect_to root_url}
        format.json { render action: 'index', status: :created, comment: Comment.new}
      else
        format.html { redirect_to root_url}
        format.json { render action: 'index', status: :unprocessable_entity, comment: @comment}
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def get_stammr
      @random_stammr = StammrPost.find(comment_params[:stammr_post_id])
    end

    def get_random_stammr
      random_id = rand(StammrPost.count) + 1
      @random_stammr = StammrPost.find(random_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :name, :stammr_post_id, :date_created)
    end
end

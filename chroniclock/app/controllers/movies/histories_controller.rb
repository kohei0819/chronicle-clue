class Movies::HistoriesController < ApplicationController
  include Common

  before_action :set_movies
  before_action :set_movies_history, only: [:show, :edit, :update, :destroy]

  # GET /movies/histories
  # GET /movies/histories.json
  def index
    @movies_histories = MovieHistory.all
  end

  # GET /movies/histories/1
  # GET /movies/histories/1.json
  def show
  end

  # GET /movies/1
  # GET /movies/1.json
  def data
    @movies_histories = Element.movies(params)
    render :layout => false
  end

  # GET /movies/histories/new
  def new
    @movies_history = MovieHistory.new
  end

  # GET /movies/histories/1/edit
  def edit
    @path = movie_history_path(:movie_id => params[:movie_id], :id => params[:id])
  end

  # POST /movies/histories
  # POST /movies/histories.json
  def create
    @movies_history = MovieHistory.new(movies_history_params)

    respond_to do |format|
      if @movies_history.save
        format.html { redirect_to movie_path(params[:movie_id]), notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @movies_history }
      else
        format.html { render :new }
        format.json { render json: @movies_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/histories/1
  # PATCH/PUT /movies/histories/1.json
  def update
    respond_to do |format|
      if @movies_history.update(movies_history_params)
        format.html { redirect_to movie_path(params[:movie_id]), notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @movies_history }
      else
        format.html { render :edit }
        format.json { render json: @movies_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/histories/1
  # DELETE /movies/histories/1.json
  def destroy
    @movies_history.destroy
    respond_to do |format|
      format.html { redirect_to movie_path(params[:movie_id]), notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movies
      @movie = Movie.movie(params[:movie_id])
      @movies_histories = MovieHistory.
        where('user_id=?', current_user.id).
        where('movie_id=?', params[:movie_id])
    end

    def set_movies_history
      @movies_history = MovieHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movies_history_params
      params.require(:movie_history).permit(:id, :user_id, :movie_id, :comment, :score, :view_date, :view_place, :view_with)
    end
end

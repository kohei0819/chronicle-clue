class Movies::MainController < ApplicationController
  include ModuleMulti

  COUNT = 10
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.movies params
    @categories = Category.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @categories = @movie.categories
  end

  # GET /movies/1
  # GET /movies/1.json
  def data
    @movies = Movie.movies params
    @page = params['page']
    p params
    render :layout => false
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    build_multi_select(@movie.movie_categories, 'category_id', params['movie']['category_ids'])
    build_multi_select(@movie.movie_countries, 'country_id', params['movie']['country_ids'])
    build_multi_select(@movie.movie_languages, 'language_id', params['movie']['language_ids'])
  end

  # GET /movies/1/edit
  def edit
    @movie_categories_selected = []
    @movie.movie_categories.each do |row|
      @movie_categories_selected.push row.category_id
    end
    @movie_countries_selected = []
    @movie.movie_countries.each do |row|
      @movie_countries_selected.push row.country_id
    end
    @movie_languages_selected = []
    @movie.movie_languages.each do |row|
      @movie_languages_selected.push row.language_id
    end
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @movie.movie_categories.destroy_all
    build_multi_select(@movie.movie_categories, 'category_id', params['movie']['category_ids'])
    @movie.movie_countries.destroy_all
    build_multi_select(@movie.movie_countries, 'country_id', params['movie']['country_ids'])
    @movie.movie_languages.destroy_all
    build_multi_select(@movie.movie_languages, 'language_id', params['movie']['language_ids'])

    respond_to do |format|
      if Element.find(params[:movie][:element_id]).update_attributes(element_params) &&
        @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.movie(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie)
      .permit(:element_id, :story, :original, :url, :image, :movie, :opendate, :time, :production, :distributed, :budget, :box_office,
        movie_categories_attributes: [:id, :category_id],
        movie_countries_attributes: [:id, :country_id],
        movie_languages_attributes: [:id, :language_id],
      )
    end

    def element_params
      params.require(:movie).permit(:name, :name_jp, :introduction, :country_id, :stutus)
    end
end

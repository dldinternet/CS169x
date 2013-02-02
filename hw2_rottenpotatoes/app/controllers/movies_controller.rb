class MoviesController < ApplicationController
  def initialize
    @all_ratings = Movie.ratings
    super
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    sort_order = params[:o]
    @class = {
      'title' => '',
      'release_date' => '',
      'rating' => ''
    }
    if params['commit']
      @class['rating'] = "hilite"
      if params.key?('ratings')
        @ratings = params['ratings']
      else
        if session.key?(:filter) and not params.key?('redirect')
          flash.keep
          redirect_to session[:filter]
          return
        else
          @ratings = {}
          @all_ratings.each do |r|
            @ratings[r] = '1'
          end
        end
      end
      #@movies.select! { |movie| params['ratings'].key?(movie['rating']) }
      rf = @ratings.keys.select { |r| @ratings[r] == '1' }
      @movies = Movie.where(:rating => rf )
      if sort_order
        @movies.sort! { |a,b| a[sort_order] <=> b[sort_order]}
        @class[sort_order] = "hilite"
      end
    else
      if params.key?('reset')
        session.delete(:filter)
      end

      #debugger
      if session.key?(:filter) and not params.key?('redirect')
        flash.keep
        redirect_to session[:filter]
      else
        @ratings = {}
        @all_ratings.each do |r|
          @ratings[r] = '1'
        end
        if sort_order
          @movies = Movie.order(sort_order)
          #@movies.sort! { |a,b| a[sort_order] <=> b[sort_order]}
          @class[sort_order] = "hilite"
        else
          @movies = Movie.all
        end
      end
    end
    @params = params.except('action',:controller,'reset')
    @params['redirect']=1
    session[:filter] = movies_path(@params)
    #debugger
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end

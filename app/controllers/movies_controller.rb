class MoviesController < ApplicationController 
    def index
        @movies = Movie.all 
    end
    
    def show
        @movie = Movie.find(params[:id])
    end
    
    def new 
        @movie = Movie.new 
    end
    
    def create
        @movie = Movie.create!(movie_params)
        if @movie.save
            flash[:notice] = "#{@movie.title} was successfully created."
            redirect_to movies_path 
        else
            flash[:warning] = "There was an error posting your movie"
            render :new
        end
    end
    
    def edit 
        @movie = Movie.find(params[:id])
    end
    
    def update
        @movie = Movie.find(params[:id])
        @movie.update_attributes(movie_params)
        if @movie.save
            flash[:notice] = "#{@movie.title} was successfully updated."
            redirect_to movie_path(@movie) 
        else
            flash[:warning] = "There was an error editing your movie"
            render :edit
        end
    end
    
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' was deleted."
        redirect_to movies_path
    end
        
    
    private 
    
    def movie_params
        params.require(:movie).permit(:title, :rating, :release_date)
    end
        
end 
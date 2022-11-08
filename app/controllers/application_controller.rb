class ApplicationController < Sinatra::Base


    # Add this line to set the Content-Type header for all responses
    set :default_content_type, 'application/json'

  get '/games/:id' do
        # get all the games from the database
        # games = Game.all
        game = Game.find(params[:id])
       # return a JSON response with an array of all the game data
       game.to_json(only: [:id, :title, :genre, :price], include: {
        reviews: { only: [:comment, :score], include: {
          user: { only: [:name] }
        } }
      })
       
  end



end

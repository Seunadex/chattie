class SearchController < ApplicationController
  def search
    if params[:term].nil?
      @chatrooms = []
    else
      term = params[:term]
      @chatrooms = Chatroom.search term, fields: [:name, :creator, :topic], highlight: true
    end
  end

  def typeahead
    render json: Chatroom.search(params[:term], {
      fields: ['name', 'creator', 'topic'],
      limit: 10,
      load: false,
      misspellings: {below: 5},
    }).map do |chatroom| { name: chatroom.name, creator: chatroom.creator, topic: chatroom.topic, value: chatroom.id } end
  end

  # This method is returning the search results for the term entered using JSON.
  # I am also limiting the number of search results to 10 maximum.
end


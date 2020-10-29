class StaticPagesController < ApplicationController



  def home

  end

  def welcome
    @first_name = params[:first_name]
  end

  def team

  end

  def contact

  end



  def author
    @author_info = Gossip.find(params[:author_info]).user
  end
end

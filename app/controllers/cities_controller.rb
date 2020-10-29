class CitiesController < ApplicationController

	def show
		@city = City.find(params[:id])
		@users_from_city = []
		@users_from_city = User.find_by city:@city
		@gossip_to_show =  Gossip.find_by user_id:"#{@users_from_city.id}" 
	end

	def show
		@city = City.find(params[:id])
		@city_users = User.where city_id:"#{params[:id]}"
		@city_users_id = @city_users.ids



	end


end
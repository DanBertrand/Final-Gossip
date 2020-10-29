
class GossipsController < ApplicationController


  def new
    @post = Gossip.new
  end


  def create

    @post = Gossip.new(title: params[:title], content: params[:content])
    @post.user = User.find_by(id: session[:user_id])
    @post.save

    if @post.save
      flash[:success] = "Gossip created!"
      redirect_to root_path, notice: "Gossip saved!"

    else
      puts "errors"
      puts @post.errors.messages
      render :new
    
    end

  end

  def show
    @gossip = params[:id]
    @gossip_id = Gossip.find(params[:id])
    @author = @gossip_id.user
  end

  def edit
    @model = Gossip.find(params[:id])
  end


  def update
    @model = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)
    @model.update(post_params)
      if @model.update(post_params)
        redirect_to root_path, notice: "Gossip updated!"
      else
        puts "error"
        puts @model.errors.messages
        render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
      @gossip.destroy
      if @gossip.destroy
        redirect_to root_path, notice: "Gossip deleted succesfully!"
      else
        puts "error"
        puts @gossip.errors.messages
        render :edit
      end
  end

end

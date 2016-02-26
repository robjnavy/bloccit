class Api::V1::PostsController < Api::V1::TopicsController < Api::V1::BaseController
   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]
   
   def index
     posts = Post.all
     render json: posts.to_json, status: 200
   end
   
   def show
     post = Post.find(params[:id])
     render json: post.to_json(include: :comments), status: 200
   end
   
   def update
      post = Post.find(params[:id])
 
 # #9
     if post.update_attributes(user_params)
       render json: post.to_json, status: 200
     else
       render json: {error: "Post update failed", status: 400}, status: 400
     end
   end
   
   def create
     post = Topic.post.new(user_params)
 
 # #14
     if post.valid?
       post.save!
       render json: post.to_json, status: 201
     else
       render json: {error: "Post is invalid", status: 400}, status: 400
     end
   end
   
   def destroy
     post = Post.find(params[:id])
 
     if post.destroy
       render json: {message: "Post destroyed", status: 200}, status: 200
     else
       render json: {error: "Post destroy failed", status: 400}, status: 400
     end
   end
   
   private
   def topic_params
     params.require(:post).permit(:name, :description, :public)
   end
   
   
end
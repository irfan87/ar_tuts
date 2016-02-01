class LinksController < ApplicationController
	before_action :set_link, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, except: [:index, :show]
	
	def index
		@links = Link.all
	end

	def show
		@link = Link.find(params[:id])
	end

	def new
		@link = current_user.links.build
	end

	def edit
		@link = Link.find(params[:id])
	end

	def create
		@link = current_user.links.build(link_params)

		if @link.save
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		@link = Link.find(params[:id])
		
		if @link.update(link_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	private

	def set_link
		@link = Link.find(params[:id])
	end

	def link_params
		params.require(:link).permit(:title, :url_address)
	end
end

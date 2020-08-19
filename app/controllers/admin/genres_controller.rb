class Admin::GenresController < ApplicationController
	before_action :authenticate_admin!

	#ジャンル一覧・追加ページ
	def index
		@genres = Genre.all
		@genre = Genre.new
	end

	#ジャンル追加アクション
	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to admin_genres_path
	end

	#ジャンル編集ページ
	def edit
		@genre = Genre.find(params[:id])
		#@admin = @genre.admin
		#if @admin != current_admin
			#redirect_to genre_path
		#end
	end

	#ジャンル編集アクション
	def update
		@genre = Genre.find(params[:id])
		#if
		@genre.update(genre_params)
			redirect_to admin_genres_path
		#else
			#render "edit"
		#end
	end

	private

	def genre_params
		params.require(:genre).permit(:name, :is_active)
	end

end

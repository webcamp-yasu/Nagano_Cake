class Admin::GenresController < ApplicationController

	#ジャンル一覧・追加ページ
	def index
		@genres = Genre.find(params[:id])
		@genre = Genre.new
	end

	#ジャンル追加アクション
	def create
		@genre = Genre.new(genre_params)
		@genre.admin_id = current_admin.id
		if @genre.save
			redirect_to genre_path(@genre)
		else
			@genre.admin_id = current_admin.id
			@genres = Genre.all
			render 'index'
		end
	end

	#ジャンル編集ページ
	def edit
		@genre = Genre.find(params[:id])
		@admin = @genre.admin
		if @admin != current_admin
			redirect_to genre_path
		end
	end

	#ジャンル編集アクション
	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to genre_path(@genre)
		else
			render "edit"
		end
	end

	private

	def genre_params
		params.require(:genre).permit(:name, :is_active)
	end

end

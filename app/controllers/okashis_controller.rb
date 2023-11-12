class OkashisController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def index
        @okashis = Okashi.all
        @rank_okashis = Okashi.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    end
    def new
        @okashi = Okashi.new
      end
    
      def create
        okashi = Okashi.new(okashi_params)
        okashi.user_id = current_user.id 
        if okashi.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @okashi = Okashi.find(params[:id])
        @comments = @okashi.comments
        @comment = Comment.new
      end
      def edit
        @okashi = Okashi.find(params[:id])
      end
      def update
        okashi= Okashi.find(params[:id])
        if okashi.update(okashi_params)
          redirect_to :action => "show", :id => okashi.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        okashi = Okashi.find(params[:id])
        okashi.destroy
        redirect_to action: :index
      end

      def bis
        @okashis=Okashi.where(genre: "ビスケット")
      end
      def cake
        @okashis=Okashi.where(genre: "ケーキ")
      end
      def candy
        @okashis=Okashi.where(genre: "キャンデー")
      end
      def choco
        @okashis=Okashi.where(genre: "チョコレート")
      end
      def gam
        @okashis=Okashi.where(genre: "ガム")
      end
      def snack
        @okashis=Okashi.where(genre: "スナック")
      end
      private
      def okashi_params
        params.require(:okashi).permit(:name, :genre, :kansou, :item, :place, :company,:image, tag_ids: [])
      end
end

class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @keyword = params[:keyword]
    @method = params[:method]
    
    # 選択したモデルに応じて検索を実行
    if @model  == "user"
      @results = User.search(@method, @keyword)
    else
      @results = Book.search(@method, @keyword)
    end
  end
  #インデントが揃っていて見やすくなっています。コードに対しての説明書きがあり見やすいです。
end

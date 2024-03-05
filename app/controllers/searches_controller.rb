class SearchesController < ApplicationController
  def search
    @selected_option = params[:option]
    @results = search_items(params[:option],params[:keyword])
  end
  
  private
  
  def search_items(option, keyword)
    case option
    # 完全一致
    when "exact" 
      Book.where(title: keyword)
      User.where(name: keyword)
    # 部分一致
    when "partial"
      Book.where("title LIKE ?", "%#{keyword}%")
      User.where("name LIKE ?", "%#{keyword}%")
    # 前方一致
    when "forward"
      Book.where("title LIKE ?", "#{keyword}%")
      User.where("name LIKE ?", "#{keyword}%")
    # 後方一致
    when "backward"
      Book.where("title LIKE ?", "%#{keyword}")
      User.where("name LIKE ?", "%#{keyword}")
    end
  end
end

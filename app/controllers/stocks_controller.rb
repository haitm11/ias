class StocksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_stock, only: :show

  def index
    @stocks = Stock.paginate(page: params[:page], per_page: Settings.page_stocks_size).order(id: :asc)
  end

  def show
    @same_industry_stocks = Stock.where(sector_id: @stock.sector_id, industry_id: @stock.industry_id)
    @stock_overview = Supports::StockOverview.load_overview_info @stock
  end

  private
  def find_stock
    @stock = Stock.find_by_display_id(params[:display_id].upcase)
    unless @stock
      flash[:danger] = t "not_found.stock"
      redirect_to not_found_index_path
    end
  end
end

class HomeController < ApplicationController
  def index
    @money = nil
    if params[:anything]
      @name = params[:anything][:name]
      url = "https://coinmarketcap.com/all/views/all/"
      h = Scrapp_money.new(url,@name).save
      @money = Money.find_by name: @name
      unless @money
        redirect_to root_path, :flash => { :error => "Ta monnaie ne semble pas exister (attention, la casse est importante)" }
      end
    end

  end
end

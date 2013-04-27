class MainController < ApplicationController
  def index
  end
  
  def md2html
    bc = BlueCloth.new(params["md"])
    render :text => bc.to_html
  end
end

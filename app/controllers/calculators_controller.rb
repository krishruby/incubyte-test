class CalculatorsController < ApplicationController
  def add
  	render plain: 0.to_s if params[:numbers].blank?
  end
end

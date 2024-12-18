class CalculatorsController < ApplicationController
  def add
  	numbers = params[:numbers].split(/[\n,]/).map(&:to_i) 
    total = numbers.sum
    render plain: total.to_s
  end
end

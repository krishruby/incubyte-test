class CalculatorsController < ApplicationController
  def add
  	numbers = params[:numbers].split(',').map(&:to_i)  # Convert the comma-separated string into an array of integers
    total = numbers.sum  # Calculate the sum of the numbers
    render plain: total.to_s
  end
end

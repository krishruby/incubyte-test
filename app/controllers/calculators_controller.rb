class CalculatorsController < ApplicationController
  def add
  	numbers_string = params[:numbers]

    if numbers_string.start_with?("//")
      delimiter_line, numbers_string = numbers_string.split("\n", 2)
      delimiter = delimiter_line[2..-1]
      numbers = numbers_string.split(delimiter).map(&:to_i)
    else
      numbers = numbers_string.split(/[\n,]/).map(&:to_i)
    end
    
    total = numbers.sum
    render plain: total.to_s  
  end
end

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
    
    negative_numbers = numbers.select { |num| num < 0 }
    if negative_numbers.any?
      render plain: "negative numbers not allowed #{negative_numbers.join(', ')}", status: :unprocessable_entity
      return
    end
    numbers = numbers.reject { |num| num > 1000 }

    total = numbers.sum
    render plain: total.to_s  
  end
end

def getLowestPrice(prices, stockPrices)
  lowest = +1.0/0.0;
  lowestIndex = 0;
  stockPrices.each_with_index do |price,i|
    if price < lowest
      lowest = price;
      lowestIndex = i;
    end
  end
  return {
    :lowestPrice => {
      price: lowest,
      index: lowestIndex
    }
  }
end

 

def getHighestPrice(start, stockPrices)
   highest= -1.0/0.0 ;
   highestIndex = 0;

   for i in start..stockPrices.length - 1
   if stockPrices[i] > highest
    highest = stockPrices[i];
    highestIndex = i;
   end
  end
  return {
    price: highest,
    index: highestIndex
  }

end

 

def stock_picker(stockPrices)
  pair = [];
  copyStockPrices = [];
  stockPrices.each { |price| copyStockPrices.push(price)};
  
  while stockPrices.length != 0 do
    prices = getLowestPrice(prices, stockPrices)
    start = prices[:lowestPrice][:index];
    prices[:highestPrice] = getHighestPrice(start, stockPrices)
    pair.push([prices[:lowestPrice][:price],prices[:highestPrice][:price]]);
    stockPrices.delete_at(prices[:lowestPrice][:index]);
    stockPrices.delete_at(prices[:highestPrice][:index] - 1)
  end
  values = pair.map {
    |set|
    (set[0] - set[1]).abs()
  }
  maxValue = values.max()
  profitIndex = 0;
  values.each_with_index { |value, i|
    if value === maxValue
      profitIndex = i;
    end
  }
  firstIndex = 0;
  secondIndex = 0;
  copyStockPrices.each_with_index { | price, i |
    if price === pair[profitIndex][0]
      firstIndex = i;
    elsif price === pair[profitIndex][1]
      secondIndex = i;
    end
  }
  return firstIndex, secondIndex
end

 

p stock_picker([17,3,6,9,15,8,6,1,10])
$items = [{:name=>"Snickers", :code=>"A01", :quantity=>0, :price=>250},
         {:name=>"Pepsi", :code=>"A02", :quantity=>5, :price=>350},
         {:name=>"Orange Juice", :code=>"A03", :quantity=>10, :price=>400},
         {:name=>"Bon Aqua", :code=>"A04", :quantity=>7, :price=>120},
         {:name=>"Bounty", :code=>"A05", :quantity=>10, :price=>270}]


def vend (code, amount)
  item = $items.find{|n| n [:code] == code}

  return  p "#{item [:name]}: закончился" if item [:quantity] == 0

  if amount == item[:price]
    p item [:name]
    p item [:quantity] - 1

  elsif amount > item [:price]
    p item [:name]
    p amount - item [:price]
    p item [:quantity] - 1

  elsif amount < item [:price]
    miss_cost = item [:price]  - amount
    p "Внесите еще #{miss_cost}"

  end
end

vend "A05", 280

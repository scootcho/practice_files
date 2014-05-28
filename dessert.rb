class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def healthy?
    true if @calories < 200
  end
  
  def delicious?
    puts false if self == "licorice"
    true
  end
end


class JellyBean < Dessert
  def initialize(flavor)
    # your code here
    @flavor = flavor
    @calories = 5
    @name = @flavor + " jelly bean"
  end
  
  def delicious?
      @flavor != 'licorice'
  end
  
end

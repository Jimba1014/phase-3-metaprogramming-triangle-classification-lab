class Triangle
  attr_reader :a, :b, :c
  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    is_it_a_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || c == a 
      :isosceles
    else
      :scalene
    end
  end
  def sides_greater_than_zero?
    [a,b,c].all?(&:positive?)
  end
  def side_inequality?
    a + b > c && b + c > a && a + c > b
  end

  def is_it_a_triangle
    raise TriangleError unless sides_greater_than_zero? && side_inequality?
  end

  class TriangleError < StandardError
  end

end

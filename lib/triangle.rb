class Triangle
  class TriangleError < StandardError
  end

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3

    validate_triangle
  end

  def kind
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    raise TriangleError, "Triangles must have positive sides." unless side1.positive? && side2.positive? && side3.positive?
    raise TriangleError, "Triangles must have a non-zero area." unless side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end
end

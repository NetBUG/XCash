class Store::Volume
  def initialize(measurable)
    @measurable = measurable
  end

  def amount
    @measurable.amount
  end

  def measure
    @measurable.measure
  end

  def blank?
    amount <= 0.0
  end
end

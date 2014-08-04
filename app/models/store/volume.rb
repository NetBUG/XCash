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

  def to_s
    return if blank?
    case measure
    when 'gram'
      "#{amount}#{@measurable.measure_text}"
    when 'liter'
      "#{(amount * 1000).to_i}#{@measurable.measure_text}"
      else
        Rails.logger.debug(measure.inspect)
      amount.to_i.to_s
    end
  end

  def blank?
    amount <= 0.0
  end
end

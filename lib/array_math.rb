class Array
  def plus(array)
    result = [self]
    result << array
    result.flatten
  end

  def asterisk(arg)
    return self.join(arg) if arg.class == String
    result = []
    arg.times { result << self }
    result.flatten
  end

  def ampersand(array)
    counts = (self + array).each_with_object({}) do |e, counts|
      counts[e] ||= 0
      counts[e] += 1
    end
    common = counts.group_by { |e,c| c > 1 }[true]
    return [] if common.nil?
    common.collect {|a| a[0]}
  end
end
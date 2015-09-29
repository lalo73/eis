class Chopper

  HUMANIZE_LIST = %w(cero uno dos tres cuatro cinco seis siete ocho nueve)

  def chop(number, list)
    index = list.index number
    if index
      index
    else
      -1
    end
  end

  def sum(list)
    if list.size == 0
      'vacio'
    else
      total = sum_all(list)
      if total > 99
        'demasiado grande'
      else
        humanized = humanize_all(total.to_s)
        humanized.join(",")
      end
    end
  end

  private

  def humanize_all(list)
    list.each_char.to_a.map { |number| humanize number.to_i }
  end

  def sum_all(list)
    list.inject(0) {|result, element| result + element }
  end

  def humanize(number)
    HUMANIZE_LIST[number]
  end
end

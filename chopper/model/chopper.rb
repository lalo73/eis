class Chopper

    HUMANIZE_LIST = %w(zero uno dos tres cuatro cinco seis siete ocho nueve)

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
            sum_string = sum_all(list).to_s
            humanized = humanize_all(sum_string)
            humanized.join(",")
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
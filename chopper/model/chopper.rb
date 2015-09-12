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
            humanize (list.inject(0) {|result, element| result + element })
        end
    end

    private

    def humanize(number)
        HUMANIZE_LIST[number]
    end
end
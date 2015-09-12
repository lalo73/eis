class Chopper
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
        case number
        when 1
            'uno'
        when 4
            'cuatro'
        end
    end
end
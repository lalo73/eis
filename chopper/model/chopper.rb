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
            'uno'
        end
    end
end
module NotationConverter
    def notation_to_coordinate(notation)
        col = notation[0].ord - 'a'.ord
        row = 8 - notation[1].to_i
        [row, col]
    end

    def coordinate_to_notation(coordinate)
        col = (coordinate[1] + 'a'.ord).chr
        row = (8 - coordinate[0]).to_s
        "#{col}#{row}"
    end
end
  
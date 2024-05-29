# frozen_string_literal: true

# The InvalidMoveError class is a custom exception raised when a player
# attempts to make an invalid move. It provides an error message to indicate
# why the move was invalid.
class InvalidMoveError < ArgumentError
end

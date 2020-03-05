require_relative "piece.rb"
require "singleton"
class NullPiece < Piece
  include Singleton

  def symbol
    " "
  end

  def initialize(pos=0, color=0, board=0)
  end

  def moves
    []
  end
end
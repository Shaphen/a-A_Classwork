require_relative "piece.rb"
require "singleton"
class NullPiece < Piece
  include Singleton

  def initialize(pos=0, color=0, board=0)
  end
end
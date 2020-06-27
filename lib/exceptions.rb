class TileError < StandardError
  def initialize(message = 'Tile is invalid')
    super
  end
end

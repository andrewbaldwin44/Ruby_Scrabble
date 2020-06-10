class TileError < StandardError
  def initialize(message)
    @message = message
  end

  attr_reader :message
end

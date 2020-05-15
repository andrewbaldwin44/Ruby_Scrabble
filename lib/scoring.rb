module Scoring
  def score
    values.sum if valid?
  end
end

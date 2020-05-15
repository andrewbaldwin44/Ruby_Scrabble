module Scoring
  def score
    values.sum if valid_letters?
  end
end

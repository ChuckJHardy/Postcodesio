# frozen_string_literal: true

class Postcodesio
  class NullResult
    def valid?
      false
    end

    def as_hash
      {}
    end
  end
end

require "roda"

class RankWithMe < Roda
  route do |r|
    r.root do 
      "Hello, [modified] World!"
    end
  end
end

run RankWithMe.freeze.app
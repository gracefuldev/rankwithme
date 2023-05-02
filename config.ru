require "roda"

class RankWithMe < Roda
  route do |r|
    r.root do 
      "Hello, World!"
    end
  end
end

run RankWithMe.freeze.app
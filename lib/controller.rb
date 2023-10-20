require_relative 'gossip'
require_relative 'view'

class Controller

    def create_gossip
        @gossip = Gossip.new
    end
end
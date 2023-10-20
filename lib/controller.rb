require_relative 'gossip'
require_relative 'view'

class Controller

    def create_gossip

        params = {
            author: @view.author
            content: @view.content
        }
        @gossip = Gossip.new
        gossip = Gossip.new(:author, :content) #crée une instance de la classe Gossip
        gossip.save #demande au model de l'enregistrer dans le CSV
        @view = View.new 
        @view.create_gossip #exécute la méthode create_gossip de la View afin de récupérer les infos de l'utilisateur
    end
end
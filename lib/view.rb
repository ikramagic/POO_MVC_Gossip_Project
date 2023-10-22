require_relative 'controller'
require_relative 'router'

class View

    def create_gossip

        params = {} #crée le hash

        puts "Sur qui tu veux verser du thé ?"
        print ">>>>>> "
        params[:author] = gets.chomp #recupère ce qui sera stocké avec l'identifiant author dans le hash params
        puts "Dis nous en plus sur ce thé : "
        print ">>>>>> "
        params[:content] = gets.chomp #recupère ce qui sera stocké avec l'identifiant content dans le hash params
        return params #renvoie params pour utilisation ailleurs des informations récoltées
    end

    def index_gossip(gossips)
        gossips.each do |displayed_gossip|
            puts displayed_gossip.author
            puts displayed_gossip.content
            #penser à indiquer ce qu'on souhaite afficher avec le puts sinon affichera l'objet Gossip avec ID au lieu de la valeur
        end
    end
end
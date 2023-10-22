require_relative 'controller'
require_relative 'router'

class View

    def create_gossip

        params = {} #crée le hash

        puts "Sur qui tu veux verser du thé ?"
        puts ">>>>>> "
        params[:author] = gets.chomp #recupère ce qui sera stocké avec l'identifiant author dans le hash params
        puts "Dis nous en plus sur ce thé : "
        puts ">>>>>> "
        params[:content] = gets.chomp #recupère ce qui sera stocké avec l'identifiant content dans le hash params
        return params #renvoie params pour utilisation ailleurs des informations récoltées
    end
end
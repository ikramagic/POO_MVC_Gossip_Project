require_relative 'controller'
require_relative 'router'

class View

    def create_gossip
        #TODO : 
        #demander deux variables (l'auteur et le contenu) à l'utilisateur (via des puts et gets.chomp)
        #retourner ces deux variables.

        puts "Sur qui tu veux verser du thé ?"
        puts ">>>>>>"
        who_is_served = gets.chomp
        puts "Dis nous en plus sur ce thé : "
        what_is_served = gets.chomp
        return params = { content: what_is_served, author: who_is_served}
    end
end
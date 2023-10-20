require 'controller'

class Router

    def initialize
        @controller =  Controller.new 
        #créera une instance de controller si Router.new est appelé dans app.rb
    end 
    
    def perform
        puts "Bienvenue dans ZE GOSSIPEUH PRO-JACTE :"

        while true 
            #lance une boucle while pour contenir le menu, il faut faire un choix sinon ça continuera à s'afficher
            puts "L'ami, veux-tu jacter ou dégager ?"
            print ">>>>"

            puts "1: On jacte ferme, comme Loin Rueil dans Queneau (1944, p. 198)"
            puts "4: On jacte pas nouuuus. Je veux quitter l'app."

            choice = gets.chomp.to_i 
            #demande une saisie à l'utilisateur en chiffre avec .to_i

            case choice 
            when 1 
                puts "Tu as choisi de jacter." 
                #puts qui confirme le choix
                @controller.create_gossip 
                #renvoie vers la méthode qui crée le gossip dans controller
            
            when 4 
                puts "Tu as choisi de quitter l'app. Au revoir." 
                #puts qui confirme le choix
                break 
                #permet de sortir de la boucle while, c'est même la seule façon d'en sortir
            
            else 
                #si saisie autre que choix dispo
                puts "Oh, oh. Ce choix n'est pas disponible. Tu dois choisir une des options affichées. Retente ta chance." 
                #on l'indique à l'utilisateur
            end
        end
    end
end
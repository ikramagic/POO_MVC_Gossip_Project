require_relative 'controller'

class Router

    def initialize
        @controller =  Controller.new 
        #créera une instance de controller si Router.new est appelé dans app.rb
    end 
    
    def perform
        puts "Bienvenue dans The Gossip Project."
        puts "Edition : Les Pro-Jacteurs"

        sleep 2

        puts "Oh la la!"

        sleep 2

        while true 
            #lance une boucle while pour contenir le menu, il faut faire un choix sinon ça continuera à s'afficher
            puts "🗣 Qu'est-ce qui vous ferait plaisir ?"

            sleep 2

            puts "1: Ajouter un potin : Je veux parler sur le dos de quelqu'un de manière anonyme car je suis plein(e) de bravitude."
            puts "2: Voir les potins : Je veux avoir accès aux archives pour lire les déblatérations déjà postées."
            puts "3: Supprimer un potin : Je veux supprimer une déblatération de la base de données."
            puts "4: M'en aller : Je veux quitter l'app et retourner à ma vie paisible d'ermite dans les Pyrénées."

            sleep 1

            print ">>>> "
            params_menu = gets.chomp.to_i 
            #demande une saisie à l'utilisateur en chiffre avec .to_i

            case params_menu 
            when 1 
                puts "Tu as choisi de parler sur le dos de quelqu'un de manière anonyme." 
                #puts qui confirme le choix
                @controller.create_gossip 
                #renvoie vers la méthode qui crée le gossip dans controller

            when 2
                puts "Tu as choisi d'accéder aux archives. Bienvenue dans la base de données Askip++."
                @controller.index_gossip

            when 3
                puts "Tu as choisi de supprimer un potin."
                @controller.destroy
            
            when 4 
                puts "Tu as choisi de quitter l'app. Bon retour dans les Pyrénées." 
                #puts qui confirme le choix
                break 
                #permet de sortir de la boucle while, c'est même la seule façon d'en sortir
            
            else 
                #si saisie autre que choix dispo
                puts "Oh, oh. Ce choix n'est pas disponible. Tu dois choisir une des options affichées à l'aide des numéros affichés." 
                #on l'indique à l'utilisateur
            end
        end
    end
end
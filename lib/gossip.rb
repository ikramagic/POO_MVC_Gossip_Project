require 'csv'

class Gossip
    attr_reader :author, :content

    def initialize(author, content)
        @content = content
        @author = author
    end

    def save
        CSV.open("db/gossip.csv", "a+") do |stored| 
            #indique la localisation du fichier csv
            #itère les espaces dispo dans fichier csv
            # a+ = "append and read", ajouter des lignes à ton fichier + lire ce qu'il y a dedans.
        stored << [@author, @content] 
        #envoie ce qui a été entré comme valeur dans le CSV
        #DOIT ETRE DANS UNE ARRAY pour pouvoir être envoyé, sinon ça ne fonctionne pas
        end
    end

    def self.all

        all_gossips_array = []

        CSV.foreach("db/gossip.csv") do |ligne_de_gossip| 
            #itère sur chachune des lignes du fichier CSV qui deviennent ligne_de gossip
            gossip_provisoire = Gossip.new(ligne_de_gossip[0], ligne_de_gossip[1])
            #crée un objet gossip avec l'index 0 (auteur) ensuite l'index 1 de ligne de gossip (contenu)
            all_gossips_array << gossip_provisoire
            #renvoie tout ça dans l'array
        end
        return all_gossips_array
    end
end
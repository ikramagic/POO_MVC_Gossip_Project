require 'csv'

class Gossip
    attr_reader :author, :content

    def initialize(author, content)
        @content = content
        @author = author
    end

    def save
        CSV.open("/home/ikramiste/THP/20_10_23_Gossip_Project/db/gossip.csv", "a+") do |stored| 
            #indique la localisation du fichier csv
            #itère les espaces dispo dans fichier csv
            # a+ = "append and read", ajouter des lignes à ton fichier + lire ce qu'il y a dedans.
        stored << [@author, @content] #envoie ce qui a été entré comme valeur dans le CSV
        #DOIT ETRE DANS UNE ARRAY pour pouvoir être envoyé, sinon ça ne fonctionne pas
        end
    end
end
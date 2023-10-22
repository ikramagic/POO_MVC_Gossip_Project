require_relative 'gossip'
require_relative 'view'

class Controller

    def create_gossip
        @view = View.new #crée une instance de la classe View 
        #DELETED & WHY: 
        #@view.create_gossip - PAS BESOIN CAR DEJA EXECUTE AVEC LA CREATION DE L'INSTANCE DE CLASSE View
        params = @view.create_gossip 
            #indique à la méthode create_gossip de Controller où récupérer le hash params dont on aura besoin
        @gossip = Gossip.new(params[:author], params[:content])
            #crée une instance de la classe Gossip avec les valeurs de la hash params
        @gossip.save 
            #demande au model (=gossip) de l'enregistrer dans le CSV
    end

#à noter qu'il est aussi possible, de manière un peu moins compacte 
#de créer une variable gossip = Gossip.new... pour créer l'instance de classe, et ensuite d'utiliser cette variable pour appliquer la méthode save

    def index_gossip
        all_gossips_array = Gossip.all #Controller demande à Gossip (modèle) de récupérer les gossips
        View.new.index_gossip(all_gossips_array) #View s'instance et exécute sa propre méthode `index_gossip` qui affichera tous les potins    
    end

    def destroy
        puts "Pour des raisons évidentes de sécurité et de préservation de la croustillance des potins, une vérification est nécessaire." 
        puts "Veuillez retaper le potin tel qu'il a été saisi lors de son enregistrement pour le supprimer : "
        print ">>>>> "
        gossip_to_delete = gets.chomp
        stored_gossips = 'db/gossip.csv'
        read_stored_gossips = CSV.read(stored_gossips)
      
        read_stored_gossips.delete_if { |row| row['raw_gossips'].include?(gossip_to_delete) } 
        #itère pour scanner les rangées à voir si elles incluent le gossip_to_delete
        #supprime si la condition est remplie
      
        CSV.open(stored_gossips, 'w') do |refill_csv| 
          #ouvre le fichier en écriture pour permettre l'enregistrement des modifications
          refill_csv << read_stored_gossips[0] 
          #permets de conserver l'en-tête (index 0 du CSV donc 1er élément) après la suppression
          read_stored_gossips.each { |row| refill_csv << row } 
          #itère dans le tableau "nettoyé" et réécris les données conservées
        end
    end 
end
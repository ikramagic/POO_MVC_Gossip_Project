require_relative 'gossip'
require_relative 'view'

class Controller

    def create_gossip
        @view = View.new #crée une instance de la classe View 
        #DELETED & WHY: 
        #@view.create_gossip- PAS BESOIN CAR DEJA EXECUTE AVEC LA CREATION DE L'INSTANCE DE CLASSE View
        params = @view.create_gossip 
            #indique à la méthode create_gossip de Controller où récupérer le hash params dont on aura besoin
        @gossip = Gossip.new(params[:author], params[:content])
            #crée une instance de la classe Gossip avec les valeurs de la hash params
        @gossip.save 
            #demande au model (=gossip) de l'enregistrer dans le CSV
    end
end

#à noter qu'il est aussi possible, de manière un peu moins compacte 
#de créer une variable gossip = Gossip.new... pour créer l'instance de classe, et ensuite d'utiliser cette variable pour appliquer la méthode save
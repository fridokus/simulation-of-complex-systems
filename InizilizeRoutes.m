function routes = InizilizeRoutes(cars,nodes,roads,startNode, stopNode, numberOfUninitializedCars)
    

    nbrOfCars = size(cars,1);
    networkMatrix = loadNetworkMatrix(roads,nodes);
    routes = zeros(nbrOfCars+numberOfUninitializedCars,size(roads,1));
    
    
    for i = 1:nbrOfCars
        routes(i,:) = uppdateRoutes(cars,i,routes(i,:),startNode,stopNode,nodes,roads,networkMatrix);
    end
    
    
end

    
    

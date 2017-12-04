function routes = InizilizeRoutes(cars,nodes,roads)
    
    nbrOfCars = size(cars,1);
    networkMatrix = loadNetworkMatrix(roads,nodes);
    routes = zeros(nbrOfCars,size(roads,1));
    
    
    for i = 1:nbrOfCars
        startNode = 1;
        stopNode = 34;
        routes(i,:) = uppdateRoutes(cars,i,routes(i,:),startNode,stopNode,nodes,roads,networkMatrix);
    end
    
    
end

    
    
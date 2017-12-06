function routes = InizilizeRoutes(cars,nodes,roads,startNode, stopNode, numberOfUninitializedCars)
    

    nbrOfCars = size(cars,1);
    networkMatrix = loadNetworkMatrix(roads,nodes);
    routes = zeros(nbrOfCars+numberOfUninitializedCars,size(roads,1));
    
   for i = 1:nbrOfCars
        routes(i,:) = uppdateRoutes(cars,i,routes(i,:),startNode,stopNode,nodes,roads,networkMatrix);
   end
   if nbrOfCars > 1
       for j = 1:length(cars)
           route = zeros(1, size(roads,1)) - 1;
           startRoad = randi(size(roads,1));
           nextRoad = getNextRoadIndex(startRoad, roads);
           route(1) = startRoad;
           route(2) = nextRoad;
           routes(j,:) = route;
       end
   end
    
end

    
    

function routes = updateRoutesCars(cars,routes,roadDecision,nodes,roads)
    
    global roadIndex;
    
    networkMatrix = loadNetworkMatrix(roads,nodes);
    nbrCars = size(cars,1);
    
    for i = 1:nbrCars
        if roadDecision(i) == 1
           route = routes(i,:);
           startNode = roads(cars(i,roadIndex),2);
           index = find(route == 0);
           stopNode = roads(route(index(1)-1),2);
           route = uppdateRoutes(cars,i,route,startNode,stopNode,nodes,roads,networkMatrix);
           routes(i,:) = route;
        end
    end
    
end
    
function [routes, cars] = updateRoutesCars(cars,routes,roadDecision,nodes,roads)
    
    global roadIndex;
    global nextRoadInRouteIndex; 
    global nextRoadIndex;
    global targetCar;
    
    networkMatrix = loadNetworkMatrix(roads,nodes);
    nbrCars = size(cars,1);
    
    for i = 1:nbrCars
        if roadDecision(i) == 1 && routes(i,end) ~= -1 && cars(i,targetCar) == 1
           route = routes(i,:);
           start = cars(i,roadIndex);
           startNode = roads(cars(i,roadIndex),2);
           index = find(route == 0);
           stopNode = roads(route(index(1)-1),2);
           [route2,~] = uppdateRoutes(cars,i,route,startNode,stopNode,nodes,roads,networkMatrix);
           route(2:end) = route2(1:end-1);
           route(1) = start;
           routes(i,:) = route;
           
           cars(i,nextRoadInRouteIndex) = 1;
           %cars(i,nextRoadIndex) = routes(i,1);
           cars(i, roadIndex) = route(1);
           cars(i, nextRoadIndex) = route(2);
        end
    end
    
end
    
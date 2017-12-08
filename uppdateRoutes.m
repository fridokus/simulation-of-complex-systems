function [route,costMatrix] = uppdateRoutes(cars,uppdateCarNbr,route,startNode,stopNode,nodes,roads,networkMatrix)
    % Update route for car number uppdateCarNbr
    global roadIndex;
    global currentVelocityIndex;
    global nextRoadInRouteIndex;
    
    carsV = cars(:,currentVelocityIndex);
    carsR = cars(:,roadIndex);
    
    averageV = getAvregeVMatrix(carsV,carsR,nodes,roads);

    [path,costMatrix] = dijkstrasGetPath(startNode,stopNode,networkMatrix,averageV);

    pathRoad = fromNodeToRoad(path,roads);
    
%     temproute = route;
    route = zeros(1,length(route));
    %route(1:nextRoadInRouteIndex) = temproute((1:nextRoadInRouteIndex));
    route(1:length(pathRoad)) = pathRoad;
%     route(1:cars(uppdateCarNbr,nextRoadInRouteIndex)) = temproute((1:cars(uppdateCarNbr,nextRoadInRouteIndex)));
%     route(cars(uppdateCarNbr,nextRoadInRouteIndex):cars(uppdateCarNbr,nextRoadInRouteIndex)-1+length(pathRoad)) = pathRoad;
%     
end
    
    
    
    
    
    


function cars = updatePosition(cars,nodes,roads,routes, networkMatrix)
    % Uppdate postion and road parameter 
    global positionIndex;
    global currentVelocityIndex;
    global roadIndex;
    global nextRoadIndex;
    global timeStep;
    global nextRoadInRouteIndex;
   
%     needNewRoads = find(cars(:,roadIndex) == cars(:,nextRoadIndex));
%     for i=1:length(needNewRoads)
%       index = needNewRoads(i);
%       currentRoad = cars(index, roadIndex);
%       cars(index, nextRoadIndex) = getNextRoadIndex(currentRoad, roads);
%     end
    
    oldPosition = cars(:,positionIndex);
    velocity = cars(:,currentVelocityIndex);
    currentRoad = cars(:,roadIndex);
    
    distVector = nodes(roads(currentRoad,1),:)-nodes(roads(currentRoad,2),:);
    lengthOldRoad = sqrt(distVector(:,1).^2+distVector(:,2).^2); 

    distanceTraveled = oldPosition + timeStep*velocity;
    
    roadDecision = distanceTraveled > lengthOldRoad;
    
    nbrOfRoads = size(roads, 1);
    iCarsAboutToTurn = find(roadDecision == 1);
    for i=1:length(iCarsAboutToTurn)
        uppdateCarNbr = iCarsAboutToTurn(i);
        startRoad = cars(uppdateCarNbr,roadIndex);
        startNode = roads(startRoad, 2);
        currentRoute = routes(uppdateCarNbr,:);
        zeroIndices = find(currentRoute == 0);
        stopRoad = currentRoute(zeroIndices(1) - 1);
        stopNode = roads(stopRoad, 2);
        if stopNode ~= startNode
            tmp_route = zeros(1,nbrOfRoads);
            route = uppdateRoutes(cars,uppdateCarNbr,tmp_route,startNode,stopNode,nodes,roads,networkMatrix);
            iZero = find(route == 0);
            iNotZero = find(route ~= 0);
            if iZero(1) == 1
                routeLength = iNotZero(end) - iNotZero(1);
                route(1:routeLength+1) = route(iNotZero(1):iNotZero(end));
            end
            routes(uppdateCarNbr,:) = route;
            cars(uppdateCarNbr,nextRoadInRouteIndex) = 2;
            cars(uppdateCarNbr, nextRoadIndex) = route(2);
        end
    end 
    nextRoad = cars(:,nextRoadIndex);
    newPosition = oldPosition + timeStep*velocity -roadDecision.*lengthOldRoad;
    cars(:,positionIndex) = newPosition;
    cars(:,roadIndex) = nextRoad.*roadDecision +(1-roadDecision).*currentRoad;
    
    cars = updatNextRoadInRouteIndex(cars,routes,roadDecision);
    
    
end




function cars = updatePosition(cars,nodes,roads,routes)
    % Uppdate postion and road parameter 
    global positionIndex;
    global currentVelocityIndex;
    global roadIndex;
    global nextRoadIndex;
    global timeStep;
   
%     needNewRoads = find(cars(:,roadIndex) == cars(:,nextRoadIndex));
%     for i=1:length(needNewRoads)
%       index = needNewRoads(i);
%       currentRoad = cars(index, roadIndex);
%       cars(index, nextRoadIndex) = getNextRoadIndex(currentRoad, roads);
%     end
    
    oldPosition = cars(:,positionIndex);
    velocity = cars(:,currentVelocityIndex);
    currentRoad = cars(:,roadIndex);
    nextRoad = cars(:,nextRoadIndex);
    distVector = nodes(roads(currentRoad,1),:)-nodes(roads(currentRoad,2),:);
    lengthOldRoad = sqrt(distVector(:,1).^2+distVector(:,2).^2); 

    distanceTraveled = oldPosition + timeStep*velocity;
    
    roadDecision = distanceTraveled > lengthOldRoad;
    
    routes = updateRoutesCars(cars,routes,roadDecision,nodes,roads);
    
    newPosition = oldPosition + timeStep*velocity -roadDecision.*lengthOldRoad;
    cars(:,positionIndex) = newPosition;
    cars(:,roadIndex) = nextRoad.*roadDecision +(1-roadDecision).*currentRoad;
    
    cars = updatNextRoadInRouteIndex(cars,routes,roadDecision, roads);
    
    
    
    
end




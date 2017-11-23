function cars = UpdatePosition(cars,roadDecision,nodes,roads,timeStep)
    % Uppdate postion and road parameter 
    global positionIndex;
    global currentVelocityIndex;
    global roadIndex;
    global nextRoadIndex;
    
    
    oldPosition = cars(:,positionIndex);
    velocity = cars(:,currentVelocityIndex);
    oldRoad = cars(:,roadIndex);
    newRoad = cars(:,nextRoadIndex);
    distVector = nodes(roads(oldRoad,1),:)-nodes(roads(oldRoad,2),:);
    lengthOldRoad = sqrt(distVector(:,1).^2+distVector(:,2).^2); 

    newPosition = oldPosition + timeStep*velocity -roadDecision.*lengthOldRoad;
    cars(:,positionIndex) = newPosition;
    cars(:,roadIndex) = newRoad.*roadDecision +(1-roadDecision).*oldRoad;
    
end

    
    

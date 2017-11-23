function cars = updatePosition(cars,roadDecision,nodes,roads)
    % Uppdate postion and road parameter 
    global positionIndex;
    global currentVelocityIndex;
    global roadIndex;
    global nextRoadIndex;
    global timeStep;
   
    oldPosition = cars(:,positionIndex);
    velocity = cars(:,currentVelocityIndex);
    currentRoad = cars(:,roadIndex);
    nextRoad = cars(:,nextRoadIndex);
    distVector = nodes(roads(currentRoad,1),:)-nodes(roads(currentRoad,2),:);
    lengthOldRoad = sqrt(distVector(:,1).^2+distVector(:,2).^2); 

    newPosition = oldPosition + timeStep*velocity -roadDecision.*lengthOldRoad;
    cars(:,positionIndex) = newPosition;
    cars(:,roadIndex) = nextRoad.*roadDecision +(1-roadDecision).*currentRoad;
    
end
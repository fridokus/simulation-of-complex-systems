function cars = UpdatePosition(cars,roadDecision,nodes,roads,timeStep)
    % Update postion and road parameter 
    
    oldPosition = cars(:,1);
    velocity = cars(:,4);
    oldRoad = cars(:,2);
    newRoad = cars(:,3);
    distVector = nodes(roads(oldRoad,1),:)-nodes(roads(oldRoad,2),:);
    lengthOldRoad = sqrt(distVector(:,1).^2+distVector(:,2).^2); 

    newPosition = oldPosition + timeStep*velocity -roadDecision.*lengthOldRoad;
    cars(:,1) = newPosition;
    cars(:,2) = newRoad.*roadDecision +(1-roadDecision).*oldRoad;
    cars = cars;
    
end

    
    

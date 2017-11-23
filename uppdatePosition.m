function cars = uppdatePosition(cars,roadDecision,nodes,roads)
    % Uppdate postion and road parameter 
    deltaT = 0.1;
    
    oldPosition = cars(:,1);
    velocity = cars(:,4);
    oldRoad = cars(:,2);
    newRoad = cars(:,3);
    distVector = nodes(roads(oldRoad,1),:)-nodes(roads(oldRoad,2),:);
    lengthOldRoad = sqrt(distVector(:,1).^2+distVector(:,2).^2); 

    newPosition = oldPosition + deltaT*velocity -roadDecision.*lengthOldRoad;
    cars(:,2) = newRoad.*roadDecision +(1-roadDecision).*oldRoad;
    cars = cars;
    
end

    
    

function cars = updateVelocity(cars,acceleration)
    % Update velocity
    global maxVelocityIndex;
    global currentVelocityIndex;
    global timeStep;
    
    currentVelocity = cars(:,currentVelocityIndex); 
    maxVelocity = cars(:,maxVelocityIndex);
    
    newVelocity = currentVelocity + timeStep*acceleration;
    cars(:,currentVelocityIndex) = newVelocity;
    decision = newVelocity > maxVelocity;
    
    cars(decision,currentVelocityIndex) = maxVelocity(decision);
    decision = newVelocity < 0;
    cars(decision,currentVelocityIndex) = zeros(1, sum(decision));
end
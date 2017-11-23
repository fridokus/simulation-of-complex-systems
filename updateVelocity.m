function cars = updateVelocity(cars,acceleration)
    % Update velocity
    global maxVelocityIndex;
    global currentVelocityIndex;
    global timeStep;
    
    cars
    currentVelocity = cars(:,currentVelocityIndex); 
    maxVelocity = cars(:,maxVelocityIndex);
    
    newVelocity = currentVelocity + timeStep*acceleration;
    decision = ceil((maxVelocity-newVelocity)./(maxVelocity+newVelocity));
    disp(decision)
    disp(newVelocity)
    cars(:,currentVelocityIndex) = decision.*newVelocity + (1-decision).*maxVelocity;
    
end
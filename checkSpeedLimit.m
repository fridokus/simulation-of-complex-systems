function acceleration = checkSpeedLimit(cars, roads)
    global maxAccelerationIndex;
    global currentVelocityIndex;
    global maxDeaccelerationIndex;
    global roadIndex;
    global timeStep;
    
    maxAccelerations = cars(:,maxAccelerationIndex);
    maxDeaccelerations = cars(:,maxDeaccelerationIndex);
    velocities = cars(:,currentVelocityIndex);
    currentRoads = cars(:,roadIndex);
    speedLimits = roads(:,3);
    speedLimitPerCar = speedLimits(currentRoads);
    
    acceleration = (speedLimitPerCar - velocities) / timeStep;
    
    iTooFastAcceleration = find(acceleration > maxAccelerations);
    iTooSlowAcceleration = find(acceleration < maxDeaccelerations);
    acceleration(iTooFastAcceleration) = maxAccelerations(iTooFastAcceleration);
    acceleration(iTooSlowAcceleration) = maxDeaccelerations(iTooSlowAcceleration);
    
end
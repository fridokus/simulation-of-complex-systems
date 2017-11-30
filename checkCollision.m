function acceleration = checkCollision(cars)
  % Adjusts the acceleration depending on how fast the car in front drives
  global positionIndex;
  global currentVelocityIndex;
  global roadIndex;
  global maxAccelerationIndex;
  global timeStep;
  
  nbrOfCars = size(cars, 1);  
  acceleration = cars(:,maxAccelerationIndex);
  safetyDistanceBetweenCars = 4;
  
  for iCar=2:nbrOfCars
    firstCar = cars(iCar,:);
    secondCar = cars(iCar - 1,:);

    if firstCar(roadIndex) == secondCar(roadIndex)
      firstCarUpcomingPosition = firstCar(positionIndex) + firstCar(currentVelocityIndex) * timeStep;
      secondCarUpcomingPosition = secondCar(positionIndex) + secondCar(currentVelocityIndex) * timeStep;
      maxAcceleration = 2*(secondCarUpcomingPosition - firstCarUpcomingPosition - safetyDistanceBetweenCars)/timeStep^2;
      if maxAcceleration > secondCar(maxAccelerationIndex)
        maxAcceleration = secondCar(maxAccelerationIndex);
      end
    else
      maxAcceleration = secondCar(maxAccelerationIndex);
    end
    
    acceleration(iCar) = maxAcceleration;
  end

end
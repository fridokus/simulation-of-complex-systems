function acceleration = CheckCollision(cars)
  global positionIndex;
  global currentVelocityIndex;
  global roadIndex;
  global maxAccelerationIndex;
  global timeStep;
  
  nbrOfCars = size(cars, 1);  
  acceleration = zeros(nbrOfCars, 1);
  acceleration(1) = cars(1, maxAccelerationIndex);

  for iCar=2:nbrOfCars
    firstCar = cars(iCar,:);
    secondCar = cars(iCar - 1,:);

    if firstCar(indexOfRoadSegment) == secondCar(roadIndex)
      firstCarUpcomingPosition = firstCar(positionIndex) + firstCar(currentVelocityIndex) * timeStep;
      secondCarUpcomingPosition = secondCar(positionIndex) + secondCar(currentVelocityIndex) * timeStep;
      maxAcceleration = 2*(secondCarUpcomingPosition - firstCarUpcomingPosition - 10)/timeStep^2;
      % the 1 is the safety distance between cars
      if maxAcceleration > secondCar(maxAccelerationIndex)
        maxAcceleration = secondCar(maxAccelerationIndex);
      end
    else
      maxAcceleration = secondCar(maxAccelerationIndex);
    end

    acceleration(iCar) = maxAcceleration;
  end
end


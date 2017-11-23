function acceleration = CheckCollision(cars, timeStep)

  indexOfPosition = 1;
  indexOfVelocity = 2;
  indexOfRoadSegment = 3;
  indexOfMaxVelocity = 4;
  indexOfMaxAcceleration = 5;
  nbrOfCars = size(cars, 1);
  
  acceleration = zeros(nbrOfCars, 1);
  acceleration(1) = cars(1, indexOfMaxAcceleration);

  for iCar=2:nbrOfCars
    firstCar = cars(iCar,:);
    secondCar = cars(iCar - 1,:);

    if firstCar(indexOfRoadSegment) == secondCar(indexOfRoadSegment)
      firstCarUpcomingPosition = firstCar(indexOfPosition) + firstCar(indexOfVelocity) * timeStep;
      secondCarUpcomingPosition = secondCar(indexOfPosition) + secondCar(indexOfVelocity) * timeStep;
      maxAcceleration = 2*(secondCarUpcomingPosition - firstCarUpcomingPosition - 10)/timeStep^2;
      % the 1 is the safety distance between cars
      if maxAcceleration > secondCar(indexOfMaxAcceleration)
        maxAcceleration = secondCar(indexOfMaxAcceleration);
      end
    else
      maxAcceleration = secondCar(indexOfMaxAcceleration);
    end

    acceleration(iCar) = maxAcceleration;
  end
end


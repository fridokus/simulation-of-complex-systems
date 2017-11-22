function acceleration = checkForCollision(cars) 
  global positionIndex;
  global roadIndex;
  global maxVelocityIndex;
  global currentVelocityIndex;
  global maxAccelerationIndex;
  global maxDeaccelerationIndex
  global visionIndex;
  global nextRoadIndex;

  acceleration = cars(:, maxAccelerationIndex);
  for i = 2:length(acceleration)
    currentCar = cars(i,:);
    nextCar = cars(i-1,:);
    if (nextCar(positionIndex) < currentCar(positionIndex)+currentCar(visionIndex) && nextCar(roadIndex) == currentCar(roadIndex))
      acceleration(i) = -cars(i, maxDeaccelerationIndex);
    end
  end
  
end

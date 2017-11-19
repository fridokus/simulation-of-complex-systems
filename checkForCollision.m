function limitingVelocities = checkForCollision(cars) 
  limitingVelocities = cars(:,3);
  for i = 2:length(limitingVelocities)
    currentCar = cars(i,:)
    nextCar = cars(i-1,:)
    if nextCar(1) < currentCar(1)+currentCar(5) && nextCar(2) == currentCar(2)
      limitingVelocities(i) = nextCar(4);
  end
  
end

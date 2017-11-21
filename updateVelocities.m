function cars = updateVelocities(cars, nodes, roads)
  limitingVelocities = checkForCollision(cars)
  cars(:,4) = cars(:,4) + 0.001 .*(cars(:,4) <limitingVelocities)
  cars(:,4) = cars(:,4) - 0.001 .*(cars(:,4) >limitingVelocities)
%  [collisionCars, limitingCars] = checkForCollision(cars, nodes, roads);
%  if ~isempty(collisionCars)
%    cars(collisionCars, 4) = cars(limitingCars, 4);
%  end

end

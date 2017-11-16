function cars = updateVelocities(cars, nodes, roads)
  acceleration = 0.0000001
  cars(:,4) = cars(:,4) + 0.001 .*(cars(:,4) < cars(:,3))
%  [collisionCars, limitingCars] = checkForCollision(cars, nodes, roads);
%  if ~isempty(collisionCars)
%    cars(collisionCars, 4) = cars(limitingCars, 4);
%  end

end

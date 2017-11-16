function cars = updateCarPositions(cars, nodes, roads)
  if cars(:,1) < calculateRoadLength(nodes, roads)
    cars = updateVelocities(cars, nodes, roads);
    cars(:,1) = cars(:,1) + cars(:,4);
  end
end

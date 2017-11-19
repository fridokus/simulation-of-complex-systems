function cars = updateCarPositions(cars, nodes, roads)
  cars = sortrows(cars, [2 1], 'descend');
  if cars(:,1) < calculateRoadLength(nodes, roads)
    cars = updateVelocities(cars, nodes, roads);
    cars(:,1) = cars(:,1) + cars(:,4);
  end
end

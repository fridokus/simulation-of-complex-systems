function cars = updateCarPositions(cars, nodes, roads)
  if cars(:,1) < calculateRoadLength(nodes, roads)
    cars(:,1) = cars(:,1) + cars(:,3);
  end
end

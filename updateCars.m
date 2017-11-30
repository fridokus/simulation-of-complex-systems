function cars = updateCars(cars, nodes, roads)

  cars = -sortrows(-cars, [2 1]);
  roadLengths = calculateRoadLength(nodes, roads);
  
  acceleration = updateAcceleration(cars, nodes, roads);%checkCollision(cars);
  
  carsAtIntersection = intersection(cars, roadLengths);
  
  cars = updateVelocity(cars,acceleration);
  
  cars = updatePosition(cars,carsAtIntersection,nodes,roads);
  

end
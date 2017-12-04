
function cars = updateCars(cars, nodes, roads, routes)
  global positionIndex;
  global roadIndex;
  global maxVelocityIndex;
  global currentVelocityIndex;
  global maxAccelerationIndex;
  global maxDeacelerationIndex;
  global visionIndex;
  global nextRoadIndex;
  global nextRoadInRouteIndex;


  cars = -sortrows(-cars, [2 1]);
  roadLengths = calculateRoadLength(nodes, roads);
  
  acceleration = updateAcceleration(cars, nodes, roads);%checkCollision(cars);
  
  carsAtIntersection = intersection(cars, roadLengths);

  cars = updateVelocity(cars,acceleration);
  
  cars = updatePosition(cars,carsAtIntersection,nodes,roads);
  cars = updatNextRoadInRouteIndex(cars,routes,carsAtIntersection);
  
end


function cars = updateCars(cars, nodes, roads, routes, networkMatrix)
      global positionIndex;
      global roadIndex;
      global maxVelocityIndex;
      global currentVelocityIndex;
      global maxAccelerationIndex;
      global maxDeacelerationIndex;
      global visionIndex;
      global nextRoadIndex;
      global nextRoadInRouteIndex;



      [cars, order] = sortrows(-cars, [2 1]);
      cars = -cars;
      routes = routes(order,:);
      roadLengths = calculateRoadLength(nodes, roads);

      acceleration = updateAcceleration(cars, nodes, roads);%checkCollision(cars);

      %carsAtIntersection = intersection(cars, roadLengths);

      cars = updateVelocity(cars,acceleration);

      cars = updatePosition(cars,nodes,roads,routes, networkMatrix);


  
end

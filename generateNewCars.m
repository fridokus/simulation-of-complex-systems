function [routes newCar] = generateNewCar(startnode, endnode, nodes, roads, numberOfUninitializedCars)
  newCar = [0, 150, 30, 5, 4, -8, 4, 2, 1];
  routes = InizilizeRoutes(newCar,nodes,roads, startnode, endnode, 0);
end

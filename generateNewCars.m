function [routes newCar] = generateNewCar(startnode, endnode, nodes, roads, numberOfUninitializedCars,target)
  newCar = [0, 150, 30, 5, 4, -8, 4, 2, 1, target];
  routes = InizilizeRoutes(newCar,nodes,roads, startnode, endnode, 0);
end

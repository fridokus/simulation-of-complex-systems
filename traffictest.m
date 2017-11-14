clear all
clf
clc

numberOfCars = 1;
numberOfIterations = 9000;


nodes = [0 1; 20 17];
roads = [1 2];

cars = [0 1 0.015; 2 1 0.01];

for i = 1:numberOfIterations
  cars = updateCarPositions(cars, nodes, roads)
  plotCoordinates = parameterCoordinates(cars, nodes, roads)

  scatter(plotCoordinates(:,1), plotCoordinates(:,2))
  axis([0 25 0 25])
  drawnow
end

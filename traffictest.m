clear all
clf
clc

numberOfIterations = 1500;

nodes = initializeNodes();
roads = initializeRoads(nodes);

cars = initializeCars(nodes, roads);
    
routes = [1 2 3 4 1 2 3 4 0;1 2 3 4 1 2 3 4 0;1 2 3 4 1 2 3 4 0];


global positionIndex;
positionIndex = 1;
global roadIndex;
roadIndex = 2;
global maxVelocityIndex;
maxVelocityIndex = 3;
global currentVelocityIndex;
currentVelocityIndex = 4;
global maxAccelerationIndex;
maxAccelerationIndex = 5;
global maxDeaccelerationIndex;
maxDeaccelerationIndex = 6;
global visionIndex;
visionIndex = 7;
global nextRoadIndex;
nextRoadIndex = 8;
global nextRoadInRouteIndex; 
nextRoadInRouteIndex = 9;
global timeStep;
timeStep = 0.1;
global maxVelocityInIntersection;
maxVelocityInIntersection = 15;

cars = -sortrows(-cars, [2 1]);
nbrOfCars = size(cars, 1);
velos = ones(numberOfIterations, nbrOfCars);
for i = 1:numberOfIterations
  cars = updateCars(cars, nodes, roads,routes);

  plotCoordinates = parameterCoordinates(cars, nodes, roads);

  velocities = cars(:,currentVelocityIndex);
  positions = cars(:,positionIndex);
  clf;
  scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
  hold on
  %text(-5, 102, num2str(velocities));
  %text(-5, 10, num2str(positions, 4));
  text(0, 190, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
  axis([-10 110 -10 210])
  plotRoads(roads, nodes);
  drawnow
  velos(i,:) = velocities;
end

clf
figure(2)
plot(linspace(0, i.*0.1, i), velos(:,1), '-.r')
hold on
plot(linspace(0, i.*0.1, i), velos(:,2), '-.b')
plot(linspace(0, i.*0.1, i), velos(:,3), '-.g')
legend('Car 1', 'Car 2', 'Car 3')

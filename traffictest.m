clear all
clf
clc

numberOfIterations = 7000;

nodes = initializeNodes();

roads = initializeRoads();

numberOfRandomCars = 80;

cars = initializeCars(nodes, roads, numberOfRandomCars);

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

nIteration = 0;
nbrOfCars = size(cars, 1);

initializedCarIndices = find(sum(cars'));
unInitializedCarIndices = find(sum(cars')==0);

% savePosition = zeros(nbrOfCars,numberOfIterations);
% saveRoad = zeros(nbrOfCars,numberOfIterations);
% saveMaxVelocity = zeros(nbrOfCars,numberOfIterations);
% saveCurrentVelocity = zeros(nbrOfCars,numberOfIterations);
% saveMaxAcceleration = zeros(nbrOfCars,numberOfIterations);
% saveMaxDeacceleration = zeros(nbrOfCars,numberOfIterations);
% saveVision = zeros(nbrOfCars,numberOfIterations);
% saveNextRoad = zeros(nbrOfCars,numberOfIterations);


cars(:,positionIndex) = 0;
routes = InizilizeRoutes(cars(initializedCarIndices,:),nodes,roads, 56, 55, length(unInitializedCarIndices));
cars(initializedCarIndices,roadIndex) = routes(initializedCarIndices,1);
cars(initializedCarIndices,nextRoadIndex) = routes(initializedCarIndices,2);
cars(initializedCarIndices,nextRoadInRouteIndex) = 2;
[cars routes] = sortwrapper(cars, routes);


for i = 1:numberOfIterations
  nIteration = nIteration + 1;
  initializedCarIndices = find(0<sum(cars') & sum(cars')<1e7);
  unInitializedCarIndices = find(sum(cars')==0);
  [cars(initializedCarIndices,:) routes(initializedCarIndices,:)] = updateCars(cars(initializedCarIndices,:), nodes, roads,routes(initializedCarIndices,:));
  initializedCarIndices = find(sum(cars'));

  if ~isempty(unInitializedCarIndices)
    size(cars(unInitializedCarIndices(1),:));
    size(routes(unInitializedCarIndices(1),:));
    [routes(unInitializedCarIndices(1),:) cars(unInitializedCarIndices(1),:)] = generateNewCars(55, 56, nodes, roads, length(unInitializedCarIndices));
    cars(unInitializedCarIndices(1), roadIndex) = routes(unInitializedCarIndices(1),1);
    cars(unInitializedCarIndices(1), nextRoadIndex) = routes(unInitializedCarIndices(1),2);
    cars(unInitializedCarIndices(1), nextRoadInRouteIndex) = 2;
    [cars routes] = sortwrapper(cars, routes);
  end

  initializedCarIndices = find(0<sum(cars') & sum(cars')<1e7);
  parkedCarIndices = find( sum(cars')<1e7);
    
    if mod(i, 5) == 0
        plotCoordinates = parameterCoordinates(cars(initializedCarIndices,:), nodes, roads);
        clf;
        scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
        hold on
        %text(-5, 102, num2str(velocities));
        %text(-5, 10, num2str(positions, 4));
        text(0, 190, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
        %axis([-10 510 -10 510])
        plotRoads(roads, nodes);
        %cars(:,currentVelocityIndex)
        drawnow
    end
end


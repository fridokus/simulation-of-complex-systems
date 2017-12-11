clc
clf
plotTrace(saveRoad, nodes, roads);

%%
clear all
clf
clc

numberOfIterations = 7000;

nodes = initializeNodes();
nbrOfNodes = size(nodes, 1);
xmax = max(nodes(:,1));
ymax = max(nodes(:,2));
roads = initializeRoads();
roads(125,3) = 42;
roads(126,3) = 42;
roads(149,3) = 10;
roads(144,3) = 10;
roads(133,3) = 15;
roads(134,3) = 15;

numberOfRandomCars = 0;
numberOfCars = 5;


cars = initializeCars(nodes, roads, numberOfCars, numberOfRandomCars);

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
maxVelocityInIntersection = 2;

initializedCarIndices = find(sum(cars'));
unInitializedCarIndices = find(sum(cars')==0);

savePosition = zeros(numberOfCars,numberOfIterations);
saveRoad = zeros(numberOfCars,numberOfIterations);
%saveMaxVelocity = zeros(nbrOfCars,numberOfIterations);
saveCurrentVelocity = zeros(numberOfCars,numberOfIterations);
%saveMaxAcceleration = zeros(nbrOfCars,numberOfIterations);
%saveMaxDeacceleration = zeros(nbrOfCars,numberOfIterations);
%saveVision = zeros(nbrOfCars,numberOfIterations);
%saveNextRoad = zeros(nbrOfCars,numberOfIterations);

cars(:,positionIndex) = 0;
routes = InizilizeRoutes(cars(initializedCarIndices,:),nodes,roads, 1, 10, length(unInitializedCarIndices));
cars(initializedCarIndices,roadIndex) = routes(initializedCarIndices,1);
cars(initializedCarIndices,nextRoadIndex) = routes(initializedCarIndices,2);
cars(initializedCarIndices,nextRoadInRouteIndex) = 2;
[cars routes] = sortwrapper(cars, routes);

for i = 1:numberOfIterations
  initializedCarIndices = find(cars(:,roadIndex)>0);
  unInitializedCarIndices = find(sum(cars')==0);
  [~, saveRoad(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveRoad(initializedCarIndices,:)); 
  [~, savePosition(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), savePosition(initializedCarIndices,:)); 
  [~, saveCurrentVelocity(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveCurrentVelocity(initializedCarIndices,:));
  [cars(initializedCarIndices,:) routes(initializedCarIndices,:)] = updateCars(cars(initializedCarIndices,:), nodes, roads,routes(initializedCarIndices,:));
  initializedCarIndices = find(sum(cars'));
  
  if ~isempty(unInitializedCarIndices)
    size(cars(unInitializedCarIndices(1),:));
    size(routes(unInitializedCarIndices(1),:));
    [routes(unInitializedCarIndices(1),:) cars(unInitializedCarIndices(1),:)] = generateNewCars(randi(nbrOfNodes - 1), randi(nbrOfNodes - 1), nodes, roads, length(unInitializedCarIndices));
    cars(unInitializedCarIndices(1), roadIndex) = routes(unInitializedCarIndices(1),1);
    cars(unInitializedCarIndices(1), nextRoadIndex) = routes(unInitializedCarIndices(1),2);
    cars(unInitializedCarIndices(1), nextRoadInRouteIndex) = 1;
    [cars routes] = sortwrapper(cars, routes);
    [~, saveRoad] = sortwrapper(cars, saveRoad); 
    [~, savePosition] = sortwrapper(cars, savePosition); 
    [~, saveCurrentVelocity] = sortwrapper(cars, saveCurrentVelocity);
  end

  initializedCarIndices = find(cars(:,roadIndex)>0);
  randomCarIndices = find(routes(:,end) == -1);
  parkedCarIndices = find(cars(:,roadIndex) == 0);
  targetCarIndies = find(routes(:,end) ~= -1);
  %plotRoute = routes(target) 
    
    if mod(i, 5) == 0
        plotCoordinates = parameterCoordinates(cars(initializedCarIndices,:), nodes, roads);
        plotCoordinatesRandom = parameterCoordinates(cars(randomCarIndices,:), nodes, roads);
        clf;
        scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
        hold on
        scatter(plotCoordinatesRandom(:,1), plotCoordinatesRandom(:,2), 'filled','red')
        hold on 
        text(0, 190, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
        axis([-10, xmax+50, -10, ymax + 50])
        plotRoads(roads, nodes);
        drawnow
    end
    
    [~, saveRoad] = sortwrapper(cars, saveRoad);
    [~, savePosition] = sortwrapper(cars, savePosition);
    [~, saveCurrentVelocity] = sortwrapper(cars, saveCurrentVelocity);
    saveRoad = saveRoads(cars, i, saveRoad);
    savePosition = savePositions(cars, i, savePosition);
    saveCurrentVelocity = saveCurrentVelocities(cars, i, saveCurrentVelocity);
end


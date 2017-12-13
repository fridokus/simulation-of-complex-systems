clear all
clf
clc

numberOfIterations = 7000;

nodes = initializeNodes2R();
xmax = max(nodes(:,1));
ymax = max(nodes(:,2));
roads = initializeRoads2R(nodes);

numberOfRandomCars = 0;
numberOfCars = 200;

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
routes = InizilizeRoutes(cars(initializedCarIndices,:),nodes,roads, 1, 4, length(unInitializedCarIndices));
cars(initializedCarIndices,roadIndex) = routes(initializedCarIndices,1);
cars(initializedCarIndices,nextRoadIndex) = routes(initializedCarIndices,2);
cars(initializedCarIndices,nextRoadInRouteIndex) = 2;
[cars routes] = sortwrapper(cars, routes);


for i = 1:numberOfIterations
  nIteration = nIteration + 1;
  initializedCarIndices = find(cars(:,roadIndex)>0);
  unInitializedCarIndices = find(sum(cars')==0);
  [cars(initializedCarIndices,:) routes(initializedCarIndices,:)] = updateCars(cars(initializedCarIndices,:), nodes, roads,routes(initializedCarIndices,:));
  initializedCarIndices = find(sum(cars'));

  if ~isempty(unInitializedCarIndices) & mod(i, 5) == 0
    [cars routes] = generateCarWrapper(cars, routes, nodes, roads, 1, 6, unInitializedCarIndices);
  end


%  if ~isempty(unInitializedCarIndices) & mod(i, 5) == 0
%    unInitializedCarIndices = find(sum(cars')==0);
%    [cars routes] =generateCarWrapper(cars, routes, nodes, roads, 9, 72, unInitializedCarIndices);
%  end

  initializedCarIndices = find(cars(:,roadIndex)>0);
  randomCarIndices = find(routes(:,end) == -1);
  parkedCarIndices = find(cars(:,roadIndex) == 0);
  targetCarIndies = find(routes(:,end) ~= -1);
  %plotRoute = routes(target) 

    
    if mod(i, 5) == 0
        plotCoordinates = parameterCoordinates(cars(initializedCarIndices,:), nodes, roads);
        translatedPlotCoordinates = orthogonalTranslation(plotCoordinates, nodes, roads, cars(initializedCarIndices, :));
        if randomCarIndices > 0
          plotCoordinatesRandom = parameterCoordinates(cars(randomCarIndices,:), nodes, roads);
          translatedPlotCoordinatesRandom = orthogonalTranslation(plotCoordinatesRandom, nodes, roads, cars(randomCarIndices, :));
        end
        clf;
        scatter(translatedPlotCoordinates(:,1), translatedPlotCoordinates(:,2), 'filled')
        hold on
        if randomCarIndices > 0
          scatter(translatedPlotCoordinatesRandom(:,1), translatedPlotCoordinatesRandom(:,2), 'filled','red')
        end
        hold on 
        text(0, 190, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
        axis([-10, xmax+50, -10, ymax + 50])
        plotRoads(roads, nodes);
        drawnow
    end
end


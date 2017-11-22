clear all; 
clc;

nodes = [0, 0;
  0, 100;
  100, 100;
  100, 0];

roadSegments = [1, 2;
  2, 3;
  3, 4; 
  4, 1];

cars = [0, 10.0, 1, 20];
%   10, 10.0, 1, 20;
%   0, 10.0, 2, 20;
%   0, -10, 3, -20;
%   0, -10, 4, -20]; %position, velocity, roadSegment, desiredVelocity

nbrOfCars = size(cars,1);
nbrOfRoadSegments = size(roadSegments, 1);
maxAcceleration = 5;
timeStep = 0.1;
totalTimeSteps = 120;

for t=1:totalTimeSteps
  for segment=1:nbrOfRoadSegments
    segmentLength = norm(nodes(roadSegments(segment, 1),:) - nodes(roadSegments(segment,2),:));
    iCarsInRoadSegment = find(cars(:,3) == segment);
    if ~isempty(iCarsInRoadSegment)
      nbrCarsInRoadSegment = length(iCarsInRoadSegment);
      for i=1:nbrCarsInRoadSegment
        car = cars(iCarsInRoadSegment(i),:);
        position = UpdatePosition(car, segmentLength, timeStep);
        velocity = UpdateVelocity(car, maxAcceleration, segmentLength, timeStep);
        cars(iCarsInRoadSegment(i),1) = position;
        cars(iCarsInRoadSegment(i),2) = velocity;
      end
    end
  end
  PlotMap(cars, nodes, roadSegments);
end







function [distanceTargetCar, distanceStandardCar] = getAverageDistance(roadIndices, targetMatrix, roads, nodes)
   
    numberOfCars = size(roadIndices, 1);
    roadLengths = calculateRoadLength(nodes, roads);
    distances = zeros(1, numberOfCars);
    for iCar=1:numberOfCars
        uniqueRoads = unique(roadIndices(iCar,:));
        uniqueRoads = uniqueRoads(uniqueRoads ~= 0);
        distance = sum(roadLengths(uniqueRoads));
        distances(iCar) = distance;
    end
    
    targets = sum(targetMatrix,2);
    distanceTargetCar = distances(targets(:,1) > 0);
    if ~isempty(distanceTargetCar)
        distanceTargetCar = mean(distanceTargetCar);
    else
        distanceTargetCar = 0;
    end
    distanceStandardCar = distances(targets(:,1) < 0);
    if ~isempty(distanceStandardCar)
        distanceStandardCar = mean(distanceStandardCar);
    else
        distanceStandardCar = 0;
    end
    
end
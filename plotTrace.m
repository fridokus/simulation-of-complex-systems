function plotTrace(roadIndices, nodes, roads)
    % antal bilar som passerar per sekund
    % antal bilar som v�ljer v�gen
    % hastigheten vs antalet bilar - k�
    nbrOfIterations = size(roadIndices, 2);
    nbrOfCars = size(roadIndices, 1);
    nbrOfRoads = size(roads, 1);
    usedRoads = zeros(1, nbrOfRoads + 1);
    
    for i=1:nbrOfIterations
        existingCars = find(roadIndices(:,i));
        usedRoads(roadIndices(existingCars, i)) = usedRoads(roadIndices(existingCars, i)) + 1;
    end
    
    
    uniqueDensitites = unique(usedRoads);
    nbrOfDensities = length(uniqueDensitites);    
    c = jet(100);
    
    figure(1)
    plotRoads(roads, nodes)
    for i=1:nbrOfRoads
        road = roads(i,:);
        startNode = nodes(road(1),:);
        endNode = nodes(road(2),:);
        if usedRoads(i) ~= 0
            colorIndex = floor(usedRoads(i)/max(usedRoads)*100);
            plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], 'Color', c(colorIndex,:), 'Linewidth', 3);
            hold on
        end
    end
    title("Road Density in City")
    xlabel("Distance [m]")
    ylabel("Distance [m]")
    caxis([0, max(usedRoads)*0.1])
    colormap(c);
    c = colorbar();
    c.Label.String = "Density (cars/m)";
    
    
    
    % Densities
    avgTimes = zeros(1, nbrOfRoads + 1);
    nbrOfCarsPerRoad = zeros(1, nbrOfRoads + 1);
    for iCar=1:nbrOfCars
        previousRoad = roadIndices(iCar, 1);
        travelTime = 0;
        for time=2:497%nbrOfIterations
            currentRoad = roadIndices(iCar, time);
            if currentRoad ~= previousRoad && previousRoad ~= 0
                avgTimes(previousRoad) = avgTimes(previousRoad) + travelTime;
                nbrOfCarsPerRoad(previousRoad) = nbrOfCarsPerRoad(previousRoad) + 1;
                travelTime = 0;
            end
            previousRoad = currentRoad;
            travelTime = travelTime + 0.1;
        end
    end
    
    figure(2)
    plotRoads(roads, nodes)
    density = avgTimes./nbrOfCarsPerRoad;
    maxDensity = round(max(density), 2) * 100;
    c = jet(fix(maxDensity));
    for i=1:nbrOfRoads
        road = roads(i,:);
        startNode = nodes(road(1),:);
        endNode = nodes(road(2),:);
        if density(i) > 0
            colorIndex = fix(density(i) * 100);
            plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], 'Color', c(colorIndex,:), 'Linewidth', 3);
            hold on
        end
    end
    title("Avg Time Spent on Roads")
    xlabel("Distance [m]")
    ylabel("Distance [m]")
    caxis([0, maxDensity*0.01])
    colormap(c);
    c = colorbar();
    c.Label.String = "Density (time/car)";
    
    
%     nbrIterations = size(positions, 2);
%     nbrOfNodes = size(nodes, 1);
%     colorGrid = zeros(max(nodes(:,2)), max(nodes(:,1)));
%     
%     startingPoints = [nodes(roads(:,1)), nodes(roads(:,1) + nbrOfNodes)];
%     endPoints = [nodes(roads(:,2)), nodes(roads(:,2) + nbrOfNodes)];
%     directionVectors = endPoints - startingPoints;
%     roadLengths = calculateRoadLength(nodes, roads);
%     
%     for i=1:500%nbrIterations
%         existingCars = find(roadIndices(:,i));
%         pos = floor(positions(existingCars,i))
%         coordinates = startingPoints(roadIndices(existingCars,i),:) + pos./roadLengths(roadIndices(existingCars,i)).* directionVectors(roadIndices(existingCars,i),:);
%         coordinates = int64(coordinates);
%         coordinates(:,1)
%         colorGrid(coordinates(:,1), coordinates(:,2)) = colorGrid(coordinates(:,1), coordinates(:,2)) + 1;
%     end
%     
%     colorGrid = rot90(colorGrid);
%     imshow(colorGrid)
%     colormap jet
%     colorbar()
end
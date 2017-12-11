function plotDensities(roadIndices, velocities, nodes, roads)
    % antal bilar som passerar per sekund
    % antal bilar som väljer vägen
    % hastigheten vs antalet bilar - kö
    nbrOfIterations = size(roadIndices, 2);
    nbrOfCars = size(roadIndices, 1);
    nbrOfRoads = size(roads, 1);
    usedRoads = zeros(1, nbrOfRoads + 1);
    totalTime = nbrOfIterations;
    
       
    avgTimes = zeros(1, nbrOfRoads);
    avgVelocities = zeros(1, nbrOfRoads);
    nbrOfCarsPerRoad = zeros(1, nbrOfRoads);
    for iCar=1:nbrOfCars
        previousRoad = roadIndices(iCar, 1);
        travelTime = 0;
        velocity = 0;
        for time=2:nbrOfIterations
            currentRoad = roadIndices(iCar, time);
            if currentRoad ~= previousRoad && previousRoad ~= 0
                avgTimes(previousRoad) = avgTimes(previousRoad) + travelTime;
                nbrOfCarsPerRoad(previousRoad) = nbrOfCarsPerRoad(previousRoad) + 1;
                avgVelocities(previousRoad) = avgVelocities(previousRoad) + velocity/(travelTime*10);
                travelTime = 0;
                velocity = 0;
            end
            previousRoad = currentRoad;
            travelTime = travelTime + 0.1;
            velocity = velocity + velocities(iCar, time);
        end
    end
    
    c = jet(100);
    figure(1)
    density = nbrOfCarsPerRoad/nbrOfCars;
    plotRoads(roads, nodes)
    for i=1:nbrOfRoads
        road = roads(i,:);
        startNode = nodes(road(1),:);
        endNode = nodes(road(2),:);
        if density(i) ~= 0
            colorIndex = floor(density(i)*100);
            plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], 'Color', c(colorIndex,:), 'Linewidth', 3);
            hold on
        end
    end
    title("Fraction of Cars Using a Road")
    xlabel("Distance [m]")
    ylabel("Distance [m]")
    caxis([0, 1])
    colormap(c);
    c = colorbar();
    c.Label.String = "Fraction Cars";
    
    
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
    
    figure(3)
    plotRoads(roads, nodes)
    density = nbrOfCarsPerRoad*60/(totalTime*0.1); %cars per minute
    maxDensity = fix(max(density) * 1000);
    c = jet(fix(maxDensity));
    for i=1:nbrOfRoads
        road = roads(i,:);
        startNode = nodes(road(1),:);
        endNode = nodes(road(2),:);
        if density(i) > 0
            colorIndex = fix(density(i) * 1000);
            plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], 'Color', c(colorIndex,:), 'Linewidth', 3);
            hold on
        end
    end
    title(sprintf("Traffic flow, total time %.1f s", totalTime))
    xlabel("Distance [m]")
    ylabel("Distance [m]")
    caxis([0, maxDensity*0.001])
    colormap(c);
    c = colorbar();
    c.Label.String = "Flow (cars/min)";
    
    %Velocities
    figure(4)
    plotRoads(roads, nodes)
    density = avgVelocities./nbrOfCarsPerRoad;
    maxVelocity = max(density);
    c = jet(fix(maxVelocity * 100));
    for i=1:nbrOfRoads
        road = roads(i,:);
        startNode = nodes(road(1),:);
        endNode = nodes(road(2),:);
        if density(i) < maxVelocity
            colorIndex = fix(density(i) * 100);
            plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], 'Color', c(colorIndex,:), 'Linewidth', 3);
            hold on
        end
    end
    title("Avg Velocity Per Road")
    xlabel("Distance [m]")
    ylabel("Distance [m]")
    caxis([0, maxVelocity])
    colormap(c);
    c = colorbar();
    c.Label.String = "Velocity [m/s]";
end
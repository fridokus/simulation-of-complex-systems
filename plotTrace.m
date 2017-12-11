function colorGrid =  plotTrace(roads, nodes, positions, roadIndices)
    
    nbrIterations = size(positions, 2);
    nbrOfNodes = size(nodes, 1);
    colorGrid = zeros(max(nodes(:,2)), max(nodes(:,1)));
    
    startingPoints = [nodes(roads(:,1)), nodes(roads(:,1) + nbrOfNodes)];
    endPoints = [nodes(roads(:,2)), nodes(roads(:,2) + nbrOfNodes)];
    directionVectors = endPoints - startingPoints;
    roadLengths = calculateRoadLength(nodes, roads);
    
    
    for i=1:500%nbrIterations
        existingCars = find(roadIndices(:,i));
        coordinates = startingPoints(roadIndices(existingCars,i),:) + positions(existingCars,i)./roadLengths(roadIndices(existingCars,i)).* directionVectors(roadIndices(existingCars,i),:);
        coordinates = uint32(coordinates);
        colorGrid(coordinates(:,1), coordinates(:,2)) = colorGrid(coordinates(:,1), coordinates(:,2)) + 1;
    end

    colorGrid = rot90(colorGrid);
    fig = figure(1);
    imshow(colorGrid)
    colormap jet
end
function colorGrid =  plotTrace(roads, nodes, positions, roadIndices)
    
    nbrIterations = size(positions, 2);
    nbrOfNodes = size(nodes, 1);
    colorGrid = zeros(max(nodes(:,2)), max(nodes(:,1)));
    
    startingPoints = [nodes(roads(:,1)), nodes(roads(:,1) + nbrOfNodes)];
    endPoints = [nodes(roads(:,2)), nodes(roads(:,2) + nbrOfNodes)];
    directionVectors = endPoints - startingPoints;
    roadLengths = calculateRoadLength(nodes, roads);
    
    
    for i=1:10%nbrIterations
        existingCars = find(roadIndices(:,i));
        coordinates = startingPoints(roadIndices(existingCars,i),:) + positions(existingCars,i)./roadLengths(roadIndices(existingCars,i)).* directionVectors(roadIndices(existingCars,i),:);
        coordinates = uint32(coordinates);
        %coordinates(:,1)
        colorGrid(coordinates(:,1), coordinates(:,2)) = colorGrid(coordinates(:,1), coordinates(:,2)) + 1;
    end
    maximum = 0;
    for i=1:1500
        if max(colorGrid(i,:)) > maximum
            maximum = max(colorGrid(i,:));
        end
    end
    
    heatmap(colorGrid)
    
%     fig = figure(1);
%     truesize(fig, [1500, 1500])
%     imshow(colorGrid, 'InitialMagnification','fit')
end
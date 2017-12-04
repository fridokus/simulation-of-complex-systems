function path = dijkstrasGetPath(startNode,stopNode,networkMatrix,averageV)

    costMatrix = networkMatrix.*averageV;
    nbrNodes = size(costMatrix,1);
    
    distance = ones(1,nbrNodes)*1000000;
    nodeBefore = zeros(1,nbrNodes);
    distanceNotVisited = ones(1,nbrNodes)*1000000;
    vistited = [];
    
    distanceNotVisited(startNode) = 0;
    
    while length(vistited) < nbrNodes
        i = find(distanceNotVisited == min(distanceNotVisited));
        neighbours = find(costMatrix(i(1),:) ~= 0);
        for j = 1:length(neighbours)
            n = neighbours(j);
            if distanceNotVisited(n) > distanceNotVisited(i(1)) + costMatrix(i(1),n)
                distanceNotVisited(n) = distanceNotVisited(i(1)) + costMatrix(i(1),n);
                nodeBefore(n) = i(1);
            end
        end
        vistited(end + 1) = i(1);
        distance(i(1)) = distanceNotVisited(i(1));
        distanceNotVisited(i(1)) = 1000000;
    end
    
    currentNode = stopNode;
    path = [];
    
    while currentNode ~= startNode
        path(end + 1)= currentNode;
        currentNode = nodeBefore(currentNode);
    end
    path(end + 1) = currentNode;
    path = flip(path);
end
        
    
    
    
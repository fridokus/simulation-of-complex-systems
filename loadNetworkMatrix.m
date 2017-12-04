function networkMatrix = loadNetworkMatrix(nodes, roads)
    nbrOfNodes = size(nodes, 1);
    nbrOfRoads = size(roads, 1);
    networkMatrix = zeros(nbrOfNodes, nbrOfNodes);
    
    for i=1:nbrOfRoads
        startNode = roads(i,1);
        endNode = roads(i, 2);
        networkMatrix(startNode, endNode) = 1;
    end
    
end
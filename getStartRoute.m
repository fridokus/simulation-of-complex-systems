function route = getStartRoute(start,stop)

    networkMatrix = loadNetworkMatrix;
    
    currentNode = start;
    route = [];
    
    while currentNode ~= stop
        networkMatrix(:,currentNode) = 1000;
        [V,nextNode] = min(networkMatrix(currentNode,:));
        route(end + 1) = currentNode*nextNode;
        currentNode = nextNode;
    end
        
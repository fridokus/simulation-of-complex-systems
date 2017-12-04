function population = InitializePopulation(populationSize,startNode,stopNode,networkMatrix)
    
    nbrNodes = size(networkMatrix,1);
    
    for i = 1:populationSize
        
        j = 1;
        tempNetworkMatrix = networkMatrix;
        currentNode = startNode;
        visitedNodes = zeros(1,nbrNodes+1);
        visitedNodes(j) = startNode;  
    
        while currentNode ~= stopNode
            j = j +1;
            tempNetworkMatrix(:,currentNode) = 0;
            temp = tempNetworkMatrix(currentNode,:);
            index = find(temp ~= 0 );
            if length(index) > 0
                r = randi(length(index),1,1);
                nextNode = index(r);
            else
                visitedNodes = zeros(1,nbrNodes+1);
                j = 1;
                nextNode = startNode;
                tempNetworkMatrix = networkMatrix;
            end
            visitedNodes(j) = nextNode;
            currentNode = nextNode;
        end
        
        population(i,:) = visitedNodes;
    end
    
end
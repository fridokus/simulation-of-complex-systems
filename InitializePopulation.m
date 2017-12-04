function population = InitializePopulation(populationSize,networkMatrix)
    
%     nbrNodes = size(networkMatrix,1);
%     distances = zeros(nbrNodes, nbrNodes);
%     for i=1:nbrNodes
%         tmp_distance = Inf(1, nbrNodes);
%         queue = [];
%         visited = [];
%         queue(1) = i;
%         tmp_distance(i) = 0.0;
%         while ~isempty(queue)
%            [~, iNextNode] =  min(tmp_distance(queue));
%            shortestDistanceNode = queue(iNextNode);
%            visited(length(visited) + 1) = shortestDistanceNode;
%            queue(iNextNode) = [];
%            neighbouringNodes = find(networkMatrix(shortestDistanceNode,:) ~= 0);
%            for j=1:length(neighbouringNodes)
%                neighbourNode = neighbouringNodes(j);
%                newDistance = tmp_distance(shortestDistanceNode) + 1;
%                if newDistance < tmp_distance(neighbourNode) && ~ismember(neighbourNode, visited)
%                   tmp_distance(neighbourNode) = newDistance;
%                   queue(length(queue) + 1) = neighbourNode;
%                end
%            end
%         end
%         tmp_distance(i) = Inf;
%         distances(i,:) = tmp_distance;
%     end
%     
%     for i=1:populationSize
%         startNode = randi(nbrNodes);
%         endNode = randi(nbrNodes);
%         while startNode == endNode
%             endNode = randi(nbrNodes);
%         end
%         currentNode = startNode;
%         path = zeros(1, nbrNodes + 1);
%         j = 1;
%         path(1) = currentNode;
%         while currentNode ~= endNode
%             [~, nextNode] = min(distances(currentNode,:));
%             path(j) = nextNode;
%             currentNode = nextNode;
%             j=j+1;
%         end
%         population(i,:) = path;
%     end
    

    nbrNodes = size(networkMatrix,1);
    for i = 1:populationSize
        disp(i)
        j = 1;
        tempNetworkMatrix = networkMatrix;
        startNode = randi(nbrNodes);
        stopNode = randi(nbrNodes);
        while startNode == stopNode
            stopNode = randi(nbrNodes);
        end
        currentNode = startNode;
        visitedNodes = zeros(1,nbrNodes+1);
        visitedNodes(j) = startNode;  
    
        while currentNode ~= stopNode
            j = j +1;
            tempNetworkMatrix(:,currentNode) = 0;
            temp = tempNetworkMatrix(currentNode,:);
            index = find(temp ~= 0 );
            if ~isempty(index)
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
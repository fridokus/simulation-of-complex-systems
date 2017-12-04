function path = dijkstrasGetPath(startNode,stopNode,networkMatrix,averageV)

    costMatrix = networkMatrix.*averageV;
    nbrNodes = size(costMatrix,1);
    tmp_distance = Inf(1, nbrNodes);
    
    queue = [];
    visited = [];
    queue(1) = startNode;
    tmp_distance(startNode) = 0.0;
    
    while ~isempty(queue)
           [~, iNextNode] =  min(tmp_distance(queue));
           shortestDistanceNode = queue(iNextNode(1));
           visited(length(visited) + 1) = shortestDistanceNode;
           queue(iNextNode) = [];
           neighbouringNodes = find(networkMatrix(shortestDistanceNode,:) ~= 0);
           for j=1:length(neighbouringNodes)
               neighbourNode = neighbouringNodes(j);
               newDistance = tmp_distance(shortestDistanceNode) + costMatrix(shortestDistanceNode,neighbourNode);
               if newDistance < tmp_distance(neighbourNode) && ~ismember(neighbourNode, visited)
                  tmp_distance(neighbourNode) = newDistance;
                  queue(length(queue) + 1) = neighbourNode;
                  nodeBefore(neighbourNode) = shortestDistanceNode;
               end
           end
    end
        tmp_distance(startNode) = Inf;
    
    
    
%     distance = Inf(1,nbrNodes);
%     nodeBefore = zeros(1,nbrNodes);
%     distanceNotVisited = Inf(1,nbrNodes);
%     vistited = [];
%     queue = [];
%     
%     queue(1) = startNode;
%    
%     distanceNotVisited(startNode) = 0;
%     
%     l = 1;
%     
%     while l > 0
%         i = find(distanceNotVisited =~ Inf);
%         s = find(s == min(s));
%         i = i(s(1));
%         neighbours = find(costMatrix(i(1),:) ~= 0);
%         
%         for j = 1:length(neighbours)
%             n = neighbours(j);
%             if distanceNotVisited(n) > distanceNotVisited(i(1)) + costMatrix(i(1),n)
%                 distanceNotVisited(n) = distanceNotVisited(i(1)) + costMatrix(i(1),n);
%                 nodeBefore(n) = i(1);
%                 queue(end + 1) = n;
%             end
%         end
%         vistited(end + 1) = i(1);
%         distance(i(1)) = distanceNotVisited(i(1));
%         distanceNotVisited(i(1)) = Inf;
%         l = length(queue) - 1;
%     end
%     
    currentNode = stopNode;
    path = [];
    
    while currentNode ~= startNode
        path(end + 1)= currentNode;
        disp(currentNode)
        currentNode = nodeBefore(currentNode);
    end
    path(end + 1) = currentNode;
    path = flip(path);
end
      
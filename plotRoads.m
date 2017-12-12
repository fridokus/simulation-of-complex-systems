
function plotRoads(roads, nodes)
  nbrOfRoads = size(roads, 1);
  for i=1:nbrOfRoads
    road = roads(i,:);
    startNode = nodes(road(1),:);
    endNode = nodes(road(2),:);
    plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], '-.k');
    hold on
  end
end
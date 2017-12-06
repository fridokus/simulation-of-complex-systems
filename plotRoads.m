
function plotRoads(roads, nodes)
  nbrOfRoads = size(roads, 1);
  for i=1:nbrOfRoads
    road = roads(i,:);
    startNode = nodes(road(1),:);
    endNode = nodes(road(2),:);
%    speedLimit = road(3);
%     if speedLimit == 10
%         color = '.-b';
%     elseif speedLimit == 17
%         color = '.-c';
%     elseif speedLimit == 20
%         color = '.-y';
%     elseif speedLimit == 25
%         color = '.-g';
%     elseif speedLimit == 30
%         color = '.-m';
%     elseif speedLimit == 42
%         color = '.-r';
%     else
%         speedLimit
%         color = '.-k';
%     end
    plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], '-.k');
    hold on
  end
end
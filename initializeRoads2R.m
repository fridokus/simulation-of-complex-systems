function roads = initializeRoads2R(nodes)
  numberOfRoads = length(nodes);;
  roads = zeros(numberOfRoads, 3);;
  roads(1, :) = [1 2 30];
  roads(2, :) = [2 1 30];
  roads(3, :) = [2 3 30];
  roads(4, :) = [3 2 30];
  roads(5, :) = [2 4 30];
  roads(6, :) = [4 2 30];
  roads(7, :) = [3 5 30];
  roads(8, :) = [5 3 30];
  roads(9, :) = [4 5 30];
  roads(10, :) = [5 4 30];
  roads(11, :) = [5 6 30];
  roads(12, :) = [6 5 30];
end

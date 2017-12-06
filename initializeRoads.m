
function roads = initializeRoads()
  roads = zeros(157, 3);
  in = load('RoadsWithSpeedLimit.mat');
  cell1 = struct2cell(in);
  cell2 = cell1{1};
  roads = cell2mat(cell2{1});
  roads(150,:) = [55 9 20];
  roads(151,:) = [9 55 20];
  roads(152,:) = [56 50 20];
  roads(153,:) = [50 56 20];
  roads(154,:) = [57 2 20];
  roads(155,:) = [57 2 20];
  roads(156,:) = [58 51 20];
  roads(157,:) = [51 58 20];
end

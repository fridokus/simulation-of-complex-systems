function roads = initializeRoads()
  in = load('RoadsWithSpeedLimit.mat');
  cell1 = struct2cell(in);
  cell2 = cell1{1};
  roads = cell2mat(cell2{1});
end

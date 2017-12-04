function roads = initializeRoads(nodes)
  in = load('roads.mat');
  cell1 = struct2cell(in);
  roads = cell2mat(cell1{1});
end

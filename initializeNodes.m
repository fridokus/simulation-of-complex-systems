function nodes = initializeNodes()
  in = load('nodes.mat');
  cell1 = struct2cell(in);
  nodes = cell2mat(cell1{1});
end

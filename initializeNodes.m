function nodes = initializeNodes()
  nodes = zeros(58, 2);
  in = load('nodes.mat');
  cell1 = struct2cell(in);
  nodes = cell2mat(cell1{1});
  nodes(55, :) = [100 50];
  nodes(56, :) = [500 500];
  nodes(57, :) = [0 500];
  nodes(58, :) = [450 50];
end

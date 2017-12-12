function nodes = initializeNodes()
  nodes = zeros(58, 2);
  in = load('nodes.mat');
  cell1 = struct2cell(in);
  nodes = cell2mat(cell1{1});
  scaleFactor = 3.0;
  nodes = nodes.*scaleFactor;
  nodes(55, :) = [100 50].*scaleFactor;
  nodes(56, :) = [500 500].*scaleFactor;;
  nodes(57, :) = [0 500].*scaleFactor;;
  nodes(58, :) = [450 50].*scaleFactor;;
end

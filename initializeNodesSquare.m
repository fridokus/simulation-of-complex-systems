function nodes = initializeNodes()
  squarelength = 300;
  sideLength = 9;
  numberOfNodes = sideLength^2;
  nodes = zeros(numberOfNodes, 2);
  k = 1;
  for  i = 1:sqrt(numberOfNodes)
    for j = 1:sqrt(numberOfNodes)
      nodes(k,1) = squarelength * i;
      nodes(k,2)= squarelength*j;
      k = k + 1;
    end
  end
  nodes = nodes - 300;
end

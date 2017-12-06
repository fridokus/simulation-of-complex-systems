function cars = initializeCars(nodes, roads, numberOfRandomCars)
  cars = zeros(100, 9);

  for i = 1:numberOfRandomCars
    cars(i,:) = [10 0 30 0 4 -8 3 0 1]; 
  end
end

function cars = initializeCars(nodes, roads, numberOfCars, numberOfRandomCars)
  cars = zeros(numberOfCars, 10);

  for i = 1:numberOfRandomCars
    cars(i,:) = [10 0 12 0 4 -8 3 0 1 2]; 
  end
end

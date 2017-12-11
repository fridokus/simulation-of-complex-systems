function cars = initializeCars(nodes, roads, numberOfCars, numberOfRandomCars)
  cars = zeros(numberOfCars, 9);

  for i = 1:numberOfRandomCars
    cars(i,:) = [10 0 45 0 4 -8 3 0 1]; 
  end
end

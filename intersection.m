function carsAtIntersection = intersection(cars, roadLengths)
  carsAtIntersection = cars(:,1) >= roadLengths(cars(:,2));
end

function carsAtIntersection = intersection(cars, roadLengths)
  carsAtIntersection = find(cars(:,1) >= roadLengths(cars(:,2)))
end

function translatedCoordinates = orthogonalTranslation(coordinates, nodes, roads, cars)
  global roadIndex;

  translatedCoordinates = coordinates;
  roadOfCars = roads(cars(:,roadIndex), 1:2);
  startPoint = nodes(roadOfCars(:,1), :);
  endPoint = nodes(roadOfCars(:,2), :);
  directionVector = endPoint - startPoint;

  roadDirection = sign(sum(directionVector, 2));
  for i = 1:size(coordinates, 1)
    coordinates(i,:);
    orthogonalVector = null(coordinates(i,:));
    size(orthogonalVector);
    size(coordinates(i,:));
    size(translatedCoordinates(i,:));
    translatedCoordinates(i,:) = coordinates(i,:) - 10.*roadDirection(i).*orthogonalVector(:,1)';
  end
end

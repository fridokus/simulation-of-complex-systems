function [cars routes] = sortwrapper(cars, routes)
  
  [cars index]= sortrows(-cars, [2 1]);
  cars = -cars;
  routes = routes(index,:);
end

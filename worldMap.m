clear all;
clc;
clf;
%{
% Noder från Malin
nodes = [0 100;
         100 100; 
         100 0; 
         0 0;
         50 50;
         25 50;
         0 150;
         50 150;
         100 150;
         100 200;
         50 200;
         50 125;
         50 75;
         ];
     %}        
%{
%Vägar från Malin
roads = [ 1 2; 
          2 3; 
          3 4; 
          4 1;
          6 1;
          5 6;
          1 7;
          7 8;
          8 9;
          9 10;
          10 11;
          11 8;
          8 12;
          12 1;
          1 13;
          13 5;
          ];
      %}

nodes = importdata('nodes.xlsx');
roads = importdata('roads.xlsx');
maxNode = max(nodes);
minNode = min(nodes);
xMin = (minNode(1))-50;
xMax = (maxNode(1))+50;
yMin = (minNode(2))-50;
yMax = (maxNode(2))+50;


for i = 1:size(nodes,1)
    scatter(nodes(i,1) ,nodes(i,2), 'filled')
    hold on
    axis([xMin, xMax, yMin, yMax])
end
 plotRoads(roads, nodes);
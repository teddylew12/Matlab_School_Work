%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 04
lewitt@usc.edu
%}
clear;clc;

%%Load The Data
load('carData.mat');
%%Find Medians
medStickerPrice=median(carData(:,1));
medRebate=median(carData(:,2));
medTaxes=median(carData(:,3));
medDealerFees=median(carData(:,4));
%%Find Median Car Price
finalmedianPrice=(medStickerPrice-medRebate).*(1+(medTaxes+ medDealerFees)/100);
%%Printing Values
fprintf('Average median price: $%.2f',finalmedianPrice)
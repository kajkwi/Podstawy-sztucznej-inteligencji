close all; clear all; clc;

net = newp([0 1; 0 1], 1,'hardlim');   %tworzenie sieci o jednym neuronie
dane_wejsciowe = [0 0 1 1;             %wartości wejściowe pierwszej zmiennej
                  0 1 0 1];            %wartości wejściowe drugiej zmiennej
wyjscie = [0 0 0 1];                   %wartości wyjściowe bramki logicznej
plotpv(dane_wejsciowe, wyjscie);       %wykres z wynikami

%parametry uczenia - współczynniki uczenia
net.trainParam.epochs = 8;
net.trainParam.goal = 0.01;
net.trainParam.mu = 0.001;
 
net = train(net, dane_wejsciowe, wyjscie);  %uczenie
plotpc(net.iw{1, 1}, net.b{1})

Y = sim(net, dane_wejsciowe);           %symulacja danych
test = randi([0 1], 2, randi(5));       %test na wylosowanych danych
efekt = sim(net, test);                 %efekt uczenia

test
efekt

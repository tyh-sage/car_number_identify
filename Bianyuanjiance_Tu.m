%% ±ßÔµ¼ì²â
function Ib = Bianyuanjiance_Tu(Ia)
I2 = edge(Ia,'roberts',0.25,'both');                          %3.±ßÔµ¼ì²â
%figure('name','±ßÔµ¼ì²â'),
subplot(233),imshow(I2);title('robertËã×Ó±ßÔµ¼ì²â') 
Ib = I2;
end

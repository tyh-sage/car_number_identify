%% ��Ե���
function Ib = Bianyuanjiance_Tu(Ia)
I2 = edge(Ia,'roberts',0.25,'both');                          %3.��Ե���
%figure('name','��Ե���'),
subplot(233),imshow(I2);title('robert���ӱ�Ե���') 
Ib = I2;
end

%% Ԥ����
function Ia = Yuchuli_Caitu(I)
I1 = rgb2gray(I);                                    %1.RGBͼ��ת�Ҷ�ͼ��
I1 = imadjust(I1,[0.3,0.7],[]);
figure('name','Ԥ������ͼƬ'),subplot(231),imshow(I1);
title('�Ҷȴ����ĻҶ�ͼ');
subplot(122),imhist(I1);
title('�Ҷȴ����ĻҶ�ͼֱ��ͼ');
%-------��ֵ�˲�
 I1 = medfilt2(I1);                                          %2.��ֵ�˲�    
 subplot(232),imshow(I1);title('��ֵ�˲�');
 Ia = I1;
end

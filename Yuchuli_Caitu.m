%% 预处理
function Ia = Yuchuli_Caitu(I)
I1 = rgb2gray(I);                                    %1.RGB图像转灰度图像
I1 = imadjust(I1,[0.3,0.7],[]);
figure('name','预处理后的图片'),subplot(231),imshow(I1);
title('灰度处理后的灰度图');
subplot(122),imhist(I1);
title('灰度处理后的灰度图直方图');
%-------中值滤波
 I1 = medfilt2(I1);                                          %2.中值滤波    
 subplot(232),imshow(I1);title('中值滤波');
 Ia = I1;
end

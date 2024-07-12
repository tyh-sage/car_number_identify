%% 腐蚀、平滑、擦除
function Ic = Xingtaixue_Tu(Ib)
se = [1;1;1];%设置结构元素对象
I3 = imerode(Ib,se);                                         %4.腐蚀图像
% 腐蚀Imerode(X,SE).其中X是待处理的图像，SE是结构元素对象
%figure('name','腐蚀后图像'),
subplot(234),imshow(I3);title('腐蚀后的图像');
se = strel('rectangle',[20,20]);
%strel(shape,parameters)：shape为形状参数；parameters为控制形状大小参数
 I4 = imclose(I3,se);                                        %5.平滑处理
 %用25*25的矩形对图像进行闭运算(先膨胀后腐蚀)有平滑边界作用
 %该函数功能是对灰度图像执行形态学闭运算
 %figure('name','平滑处理'),
 subplot(235),imshow(I4);title('平滑图像的轮廓');
 I5 = bwareaopen(I4,200);                                      %6.擦除
 % 从二进制图像中移除所有少于200像素的连接对象，消失的是连续的白色像素数量少于2000的字符
%figure('name','擦除'),
subplot(236),imshow(I5);title('擦除');
Ic = I5;
end

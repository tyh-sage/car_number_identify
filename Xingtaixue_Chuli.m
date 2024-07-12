function bw=Xingtaixue_Chuli(bw,threshold)
bw = bwmorph(bw,'hbreak',inf);
% hbreak:断开图像中的H型连接，也就是去除两平行线中间的短小连接
figure, subplot(231),imshow(bw);
title('断开H连接'); 
bw = bwmorph(bw,'spur',inf); %移除刺激像素，细小分支，也叫“毛刺”
subplot(232),imshow(bw);
title('移除毛刺'); 
bw=bwmorph(bw,'open',5); %执行形态学开操作（先腐蚀后膨胀）
%可应用在去除电路板线路，只留元器件
subplot(233),imshow(bw);
title('先腐蚀后膨胀');
bw = bwareaopen(bw, threshold);  %删除二值图像BW中面积小于threshold的对象，默认情况下使用8邻域
subplot(234),imshow(bw);
title('擦除');
bw=~bw;  
subplot(235),imshow(bw);
title('取反');
end

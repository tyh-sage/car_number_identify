function bw=Xingtaixue_Chuli(bw,threshold)
bw = bwmorph(bw,'hbreak',inf);
% hbreak:�Ͽ�ͼ���е�H�����ӣ�Ҳ����ȥ����ƽ�����м�Ķ�С����
figure, subplot(231),imshow(bw);
title('�Ͽ�H����'); 
bw = bwmorph(bw,'spur',inf); %�Ƴ��̼����أ�ϸС��֧��Ҳ�С�ë�̡�
subplot(232),imshow(bw);
title('�Ƴ�ë��'); 
bw=bwmorph(bw,'open',5); %ִ����̬ѧ���������ȸ�ʴ�����ͣ�
%��Ӧ����ȥ����·����·��ֻ��Ԫ����
subplot(233),imshow(bw);
title('�ȸ�ʴ������');
bw = bwareaopen(bw, threshold);  %ɾ����ֵͼ��BW�����С��threshold�Ķ���Ĭ�������ʹ��8����
subplot(234),imshow(bw);
title('����');
bw=~bw;  
subplot(235),imshow(bw);
title('ȡ��');
end

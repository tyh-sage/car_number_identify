%% ��ʴ��ƽ��������
function Ic = Xingtaixue_Tu(Ib)
se = [1;1;1];%���ýṹԪ�ض���
I3 = imerode(Ib,se);                                         %4.��ʴͼ��
% ��ʴImerode(X,SE).����X�Ǵ������ͼ��SE�ǽṹԪ�ض���
%figure('name','��ʴ��ͼ��'),
subplot(234),imshow(I3);title('��ʴ���ͼ��');
se = strel('rectangle',[20,20]);
%strel(shape,parameters)��shapeΪ��״������parametersΪ������״��С����
 I4 = imclose(I3,se);                                        %5.ƽ������
 %��25*25�ľ��ζ�ͼ����б�����(�����ͺ�ʴ)��ƽ���߽�����
 %�ú��������ǶԻҶ�ͼ��ִ����̬ѧ������
 %figure('name','ƽ������'),
 subplot(235),imshow(I4);title('ƽ��ͼ�������');
 I5 = bwareaopen(I4,200);                                      %6.����
 % �Ӷ�����ͼ�����Ƴ���������200���ص����Ӷ�����ʧ���������İ�ɫ������������2000���ַ�
%figure('name','����'),
subplot(236),imshow(I5);title('����');
Ic = I5;
end

%% ��λ�����÷���ɫ����
function [PY2,PY1,PX2,PX1]=Chepai_Dingwei(bw)
%���õ����Ƶ��ϱ߽�PY1���±߽�PY2����߽�PX1���ұ߽� PX2
[y,x,~]=size(bw);% size(A) ���ؾ�������/����/Ƭ��          %1.��ȡbw��size
myI=double(bw);                                  %2.��bw����ת����˫������

 %====================== Y ����====================    %3.��ȡ�������±߽�
 Blue_y=zeros(y,1); %����������y*1                    
 % zeros(M,N) ��ʾ����M��*N�е�ȫ0����
for i=1:y                                        %% a.ͳ��ÿ����ɫ���ص���
    for j=1:x
         if(myI(i,j,1)==1) %���Ԥ�����ͼ����ж���ɫ����
        % if((I(i,j,1)<=48)&&((I(i,j,2)<=100)&&(I(i,j,2)>=40))&&((I(i,j,3)<=200)&&(I(i,j,3)>=80))) 
            % ����ɫ���ص���ж���䣬�����ԭʼͼ�����õĻ�������������I
             Blue_y(i,1)= Blue_y(i,1)+1;     % ��ɫ���ص�ͳ��                    
        end  
    end       
end
 [temp,MaxY]=max(Blue_y); % Y����������ȷ�� [temp MaxY]��ʱ����MaxY
 %temp��ʾ���ĵ�����MaxY��ʾ���������ڵ���
 
  if temp<=20    %����ɫ����С�����ֵ�������  2048*1536  ����
           msgbox('���ƶ�λ����','warning'); % �����Ի�����msgbox       
           pause;
  end
 
 PY1=MaxY;                                         %% b.Ѱ�ҳ����ϱ߽�PY1
 Y_threshlow=5;  %��ȡ��ͼ���������ӣ���ֵ
 while ((Blue_y(PY1,1)>=Y_threshlow)&&(PY1>1)) %�����ɫ���ص���������ֵ
         PY1=PY1-1;                            %������
 end    
 PY2=MaxY;                                         %% c.Ѱ�ҳ����±߽�PY2
 while ((Blue_y(PY2,1)>=Y_threshlow)&&(PY2<y)) %���ұ�֤������ͼ�������С
         PY2=PY2+1;
 end

  %====================== X ����====================   %4.��ȡ�������ұ߽�
 Blue_x=zeros(1,x);   %����������1*x                      %% ����ο�Y����
 for j=1:x
      for i=PY1:PY2  % ��Ϊȷ�������½緶Χ�����ֻ��Ҫ����PY1:PY2��Χ
          if(myI(i,j,1)==1) %���Ԥ�����ͼ����ж���ɫ����
        % if((I(i,j,1)<=48)&&((I(i,j,2)<=100)&&(I(i,j,2)>=40))&&((I(i,j,3)<=200)&&(I(i,j,3)>=80))) 
            % ����ɫ���ص���ж���䣬�����ԭʼͼ�����õĻ�������������I
             Blue_x(1,j)= Blue_x(1,j)+1; % ��ɫ���ص�ͳ��             
          end 
      end   
 end

 PX1 = 1;                                          %% a. Ѱ�ҳ������λ��
 X_threshlow = 16;  %��ȡ��ͼ���������ӣ���ֵ
 while ((Blue_x(1,PX1)<X_threshlow)&&(PX1<x))
        PX1 = PX1+1;
 end    
 PX2 = x;                                          %% b. Ѱ�ҳ����Ҳ�λ��
 while ((Blue_x(1,PX2)<3)&&(PX2>PX1))
         PX2 = PX2-1;
 end
   %======================����====================      %5.�Գ��Ʊ߽�����
X_firrectify=0;    %��������
Y_firrectify=fix((PY2-PY1)/5); %ȡ����������������ϵ��
%fitΪȡ������
%PY1=PY1-Y_firrectify+60;%�Գ������������,���ϣ�����һ��PY1=PY1-Y_firrectify��
PY1=PY1-Y_firrectify;
%PY2=PY2+Y_firrectify-80;%�Գ������������,���£�����һ��PY2=PY2+Y_firrectify��
PY2=PY2+Y_firrectify;
%PX1=PX1-X_firrectify+20;% �Գ������������������һ��PX1=PX1-X_firrectify��
PX1=PX1-X_firrectify;
PX2=PX2+X_firrectify-18;% �Գ��������������
end

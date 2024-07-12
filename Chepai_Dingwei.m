%% 定位：适用非蓝色车辆
function [PY2,PY1,PX2,PX1]=Chepai_Dingwei(bw)
%并得到车牌的上边界PY1、下边界PY2、左边界PX1、右边界 PX2
[y,x,~]=size(bw);% size(A) 反回矩阵行数/列数/片数          %1.读取bw的size
myI=double(bw);                                  %2.将bw数据转换成双精度型

 %====================== Y 方向====================    %3.获取车牌上下边界
 Blue_y=zeros(y,1); %创建列向量y*1                    
 % zeros(M,N) 表示的是M行*N列的全0矩阵
for i=1:y                                        %% a.统计每行蓝色像素点数
    for j=1:x
         if(myI(i,j,1)==1) %针对预处理后图像的判断蓝色像素
        % if((I(i,j,1)<=48)&&((I(i,j,2)<=100)&&(I(i,j,2)>=40))&&((I(i,j,3)<=200)&&(I(i,j,3)>=80))) 
            % 此蓝色像素点的判断语句，是针对原始图像；如用的话，需加输入参数I
             Blue_y(i,1)= Blue_y(i,1)+1;     % 蓝色像素点统计                    
        end  
    end       
end
 [temp,MaxY]=max(Blue_y); % Y方向车牌区域确定 [temp MaxY]临时变量MaxY
 %temp表示最多的点数，MaxY表示最多点数所在的行
 
  if temp<=20    %若蓝色像素小于这个值，则代表  2048*1536  照相
           msgbox('车牌定位出错','warning'); % 弹出对话框函数msgbox       
           pause;
  end
 
 PY1=MaxY;                                         %% b.寻找车牌上边界PY1
 Y_threshlow=5;  %提取彩图的质量因子，阈值
 while ((Blue_y(PY1,1)>=Y_threshlow)&&(PY1>1)) %如果蓝色像素点数大于阈值
         PY1=PY1-1;                            %则上移
 end    
 PY2=MaxY;                                         %% c.寻找车牌下边界PY2
 while ((Blue_y(PY2,1)>=Y_threshlow)&&(PY2<y)) %并且保证不跳出图像自身大小
         PY2=PY2+1;
 end

  %====================== X 方向====================   %4.获取车牌左右边界
 Blue_x=zeros(1,x);   %创建行向量1*x                      %% 步骤参考Y方向
 for j=1:x
      for i=PY1:PY2  % 因为确定了上下界范围，因此只需要处理PY1:PY2范围
          if(myI(i,j,1)==1) %针对预处理后图像的判断蓝色像素
        % if((I(i,j,1)<=48)&&((I(i,j,2)<=100)&&(I(i,j,2)>=40))&&((I(i,j,3)<=200)&&(I(i,j,3)>=80))) 
            % 此蓝色像素点的判断语句，是针对原始图像；如用的话，需加输入参数I
             Blue_x(1,j)= Blue_x(1,j)+1; % 蓝色像素点统计             
          end 
      end   
 end

 PX1 = 1;                                          %% a. 寻找车牌左侧位置
 X_threshlow = 16;  %提取彩图的质量因子，阈值
 while ((Blue_x(1,PX1)<X_threshlow)&&(PX1<x))
        PX1 = PX1+1;
 end    
 PX2 = x;                                          %% b. 寻找车牌右侧位置
 while ((Blue_x(1,PX2)<3)&&(PX2>PX1))
         PX2 = PX2-1;
 end
   %======================修正====================      %5.对车牌边界修正
X_firrectify=0;    %干扰因子
Y_firrectify=fix((PY2-PY1)/5); %取整，车牌区域修正系数
%fit为取整函数
%PY1=PY1-Y_firrectify+60;%对车牌区域的修正,向上（类型一：PY1=PY1-Y_firrectify）
PY1=PY1-Y_firrectify;
%PY2=PY2+Y_firrectify-80;%对车牌区域的修正,向下（类型一：PY2=PY2+Y_firrectify）
PY2=PY2+Y_firrectify;
%PX1=PX1-X_firrectify+20;% 对车牌区域的修正（类型一：PX1=PX1-X_firrectify）
PX1=PX1-X_firrectify;
PX2=PX2+X_firrectify-18;% 对车牌区域的修正，
end

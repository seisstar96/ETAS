clc;clear;close all


M_min = 1.4;
M_max=10;
F=ftplain_sa();

data=load('N_all_cata_m1.5.txt');

year = data(:,1);
month = data(:,2);
day = data(:,3);
hour = data(:,4);
minute = data(:,5);
sec = round(data(:,6));
lat = data(:,7); %33
lon = data(:,8); %-116
dep = data(:,9);
mag = data(:,10);
t=datenum(year,month,day,hour,minute,sec);
t_new = t-t(1);
len=length(t_new);
num_fs=1:1:len;
data_new=[data t_new];
data=[];
data=sortrows(data_new,12); 

n1='Northern_eq_etas_pre.txt';

all_data=[];
for i=2:1:len
   t_diff=data(i,12)-data(i-1,12); 
   if t_diff>0
   all_data=[all_data;data(i,:)];
   end
end

data=all_data;


len = length(data);

randx1=(-1000 + (1000+1000)*rand(len,1))*0.00000001;
randx2=(-1000 + (1000+1000)*rand(len,1))*0.00000001;
randx3=(-100 + (100+100)*rand(len,1))*0.01;

fid1 = fopen(n1,'w');
att1=[];
for i=2:1:len
   tt1=t_new(i) - t_new(i-1);
   att1=[att1;i tt1];
   fprintf(fid1,'%d %02d %02d %02d %02d %05.2f %11.8f %12.8f %05.2f %4.2f\n',...
   round(data(i,1)),round(data(i,2)),round(data(i,3)),round(data(i,4)),...
   round(data(i,5)),round(data(i,6))+randx3(i),data(i,7)+randx1(i),data(i,8)+randx2(i),...
   data(i,9),data(i,10));
end
fclose(fid1);

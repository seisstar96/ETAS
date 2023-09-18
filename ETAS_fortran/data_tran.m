clc;clear;close all
data=load('Northern_eq_etas_pre.txt');
data1=[-119.94 32.56
-116.23 32.21
-114.13 33.51
-120.42 43.51
-127.78 41.88
-125.84 37.19
-124.39 36.53];
plot(data(:,8),data(:,7),'.');hold on
plot(data1(:,1),data1(:,2),'.-');

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
data=sortrows(data_new,11); 

randx1=(-1000 + (1000+1000)*rand(len,1))*0.00000001;
randx2=(-1000 + (1000+1000)*rand(len,1))*0.00000001;
randx3=(-0.1 + (0.1+0.1)*rand(len,1));

all_data=[];
for i=2:1:len
   t_diff=data(i,11)-data(i-1,11); 
   if t_diff>0
   all_data=[all_data;data(i,:)];
   end
end

n1='N_SA_eq_FS.etas';
fid1 = fopen(n1,'w');
data=all_data;
for i=1:1:length(all_data)
   fprintf(fid1,'%d  %f %f %4.2f %f %5.2f %d %d %d\n',...
   i,data(i,8),data(i,7),data(i,10),data(i,11),-data(i,9),data(i,1),data(i,2),data(i,3));
end
fclose(fid1);



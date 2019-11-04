close all
clear all 
clc
%introduce los grados y la distancia de los dos eslabones
prompt = 'Introduir el valor del angulo uno:';
angDeg = input (prompt);
prompt = 'Introduir el valor del angulo dos:';
angDeg2 = input (prompt);
prompt = 'Introduir el valor del angulo tres:';
angDeg3 = input (prompt);
prompt = 'Introduir el valor de L1:';
L1 = input (prompt);
prompt = 'Introduir el valor de L2:';
L2 = input (prompt);
prompt = 'Introduir el valor de L3:';
L3 = input (prompt);
angRad = deg2rad(angDeg);
%Imprimir los ejes en 2D
printAxis();
%Define el punto inicial
p1 =[0 0 0]';
%verifica el angulo y crea el vector
if angDeg>=0
    angVec = 0:0.1:angRad;
else 
    angVec = 0:-0.1:angRad;
end

for i=1:length(angVec)
    clf
    printAxis();
    TRz1 = [cos(angVec(i)) -sin(angVec(i)) 0 0; sin(angVec(i)) cos(angVec(i)) 0 0; 0 0 1 0; 0 0 0 1];
    TTx1 = [1 0 0 0; 0 1 0 0; 0 0 1 L1; 0 0 0 1];
    T1 = TRz1*TTx1;
    p2 = T1(1:3,4);
    eje_x_1= T1(1:3,1);
    eje_y_1= T1(1:3,2);
    line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 0 1],'linewidth',5 )
    line([p1(1) eje_x_1(1)],[p1(2) eje_x_1(2)],[p1(3) eje_x_1(3)],'color',[0 1 0],'linewidth',5 )
    line([p1(1) eje_y_1(1)],[p1(2) eje_y_1(2)],[p1(3) eje_y_1(3)],'color',[1 0 0],'linewidth',5 )
   
    TRy2 = [cos(0) 0 -sin(0) 0; 0 1 0 0; sin(0) 0 cos(0) 0; 0 0 0 1];
    TTx2 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T2 = TRy2*TTx2;
    Tf = T1*T2;
    p3 = Tf(1:3,4);
    eje_x_2 = p2+ Tf(1:3,1);
    eje_y_2 = p2+ Tf(1:3,2);
    eje_x_3 = p3+ Tf(1:3,1);
    eje_y_3 = p3+ Tf(1:3,2);
    line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 1 1],'linewidth',5 )
    line([p2(1) eje_x_2(1)],[p2(2) eje_x_2(2)],[p2(3) eje_x_2(3)],'color',[0 1 0],'linewidth',5 )
    line([p2(1) eje_y_2(1)],[p2(2) eje_y_2(2)],[p2(3) eje_y_2(3)],'color',[1 0 0],'linewidth',5 )
    line([p3(1) eje_x_3(1)],[p3(2) eje_x_3(2)],[p3(3) eje_x_3(3)],'color',[0 1 0],'linewidth',5 )
    line([p3(1) eje_y_3(1)],[p3(2) eje_y_3(2)],[p3(3) eje_y_3(3)],'color',[1 0 0],'linewidth',5 )
   
    TRy3 = [cos(0) 0 -sin(0) 0; 0 1 0 0; sin(0) 0 cos(0) 0; 0 0 0 1];
    TTx3 = [1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T3 = TRy3*TTx3;
    Tr = Tf*T3;
    p4 = Tr(1:3,4);
    eje_x_2 = p2+ Tr(1:3,1);
    eje_y_2 = p2+ Tr(1:3,2);
    eje_x_3 = p3+ Tr(1:3,1);
    eje_y_3 = p3+ Tr(1:3,2);
    eje_x_4 = p4+ Tr(1:3,1);
    eje_y_4 = p4+ Tr(1:3,2);
    line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0 0],'linewidth',5 )
    line([p3(1) eje_x_3(1)],[p3(2) eje_x_3(2)],[p3(3) eje_x_3(3)],'color',[0 1 0],'linewidth',5 )
    line([p3(1) eje_y_3(1)],[p3(2) eje_y_3(2)],[p3(3) eje_y_3(3)],'color',[1 0 0],'linewidth',5 )
    line([p4(1) eje_x_4(1)],[p4(2) eje_x_4(2)],[p4(3) eje_x_4(3)],'color',[0 1 0],'linewidth',5 )
    line([p4(1) eje_y_4(1)],[p4(2) eje_y_4(2)],[p4(3) eje_y_4(3)],'color',[1 0 0],'linewidth',5 )
    grid on
    pause (0.1)
end

if angDeg2>=0
    angVec2 = 0:0.1:angRad;
else 
    angVec2 = 0:-0.1:angRad;
end
%Movimiento del segundo eslabon
for i=1:length(angVec2)
    clf
    printAxis();
    p2 = T1(1:3,4);
    eje_x_1 = T1(1:3,1);
    eje_y_1 = T1(1:3,2);
    line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 0 1],'linewidth',5 )
    line([p1(1) eje_x_1(1)],[p1(2) eje_x_1(2)],[p1(3) eje_x_1(3)],'color',[0 1 0],'linewidth',5 )
    line([p1(1) eje_y_1(1)],[p1(2) eje_y_1(2)],[p1(3) eje_y_1(3)],'color',[1 0 0],'linewidth',5 )
    
    TRy2 = [cos(angVec2(i)) 0 -sin(angVec2(i)) 0;0 1 0 0;sin(angVec2(i)) 0 cos(angVec2(i)) 0; 0 0 0 1];
    TTx2 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T2 = TRy2*TTx2;
    Tf = T1*T2;
    p3 = Tf(1:3,4);
    eje_x_2 = p2+ Tf(1:3,1);
    eje_y_2 = p2+ Tf(1:3,2);
    eje_x_3 = p3+ Tf(1:3,1);
    eje_y_3 = p3+ Tf(1:3,2);
    line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 1 1],'linewidth',5 )
    line([p2(1) eje_x_2(1)],[p2(2) eje_x_2(2)],[p2(3) eje_x_2(3)],'color',[0 1 0],'linewidth',5 )
    line([p2(1) eje_y_2(1)],[p2(2) eje_y_2(2)],[p2(3) eje_y_2(3)],'color',[1 0 0],'linewidth',5 )
    line([p3(1) eje_x_3(1)],[p3(2) eje_x_3(2)],[p3(3) eje_x_3(3)],'color',[0 1 0],'linewidth',5 )
    line([p3(1) eje_y_3(1)],[p3(2) eje_y_3(2)],[p3(3) eje_y_3(3)],'color',[1 0 0],'linewidth',5 )
    
    TRy3 = [cos(0) 0 -sin(0) 0; 0 1 0 0; sin(0) 0 cos(0) 0; 0 0 0 1];
    TTx3 = [1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T3 = TRy3*TTx3;
    Tr = Tf*T3;
    p4 = Tr(1:3,4);
    eje_x_2 = p2+ Tr(1:3,1);
    eje_y_2 = p2+ Tr(1:3,2);
    eje_x_3 = p3+ Tr(1:3,1);
    eje_y_3 = p3+ Tr(1:3,2);
    eje_x_4 = p4+ Tr(1:3,1);
    eje_y_4 = p4+ Tr(1:3,2);
    line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0 0],'linewidth',5 )
    line([p3(1) eje_x_3(1)],[p3(2) eje_x_3(2)],[p3(3) eje_x_3(3)],'color',[0 1 0],'linewidth',5 )
    line([p3(1) eje_y_3(1)],[p3(2) eje_y_3(2)],[p3(3) eje_y_3(3)],'color',[1 0 0],'linewidth',5 )
    line([p4(1) eje_x_4(1)],[p4(2) eje_x_4(2)],[p4(3) eje_x_4(3)],'color',[0 1 0],'linewidth',5 )
    line([p4(1) eje_y_4(1)],[p4(2) eje_y_4(2)],[p4(3) eje_y_4(3)],'color',[1 0 0],'linewidth',5 )
    grid on
    pause (0.1)
end

if angDeg3>=0
    angVec3 = 0:0.1:angRad;
else 
    angVec3 = 0:-0.1:angRad;
end
%Movimiento del segundo eslabon
for i=1:length(angVec3)
    clf
    printAxis();
    p2 = T1(1:3,4);
    eje_x_1 = T1(1:3,1);
    eje_y_1 = T1(1:3,2);
    line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 0 1],'linewidth',5 )
    line([p1(1) eje_x_1(1)],[p1(2) eje_x_1(2)],[p1(3) eje_x_1(3)],'color',[0 1 0],'linewidth',5 )
    line([p1(1) eje_y_1(1)],[p1(2) eje_y_1(2)],[p1(3) eje_y_1(3)],'color',[1 0 0],'linewidth',5 )
    
    p3 = Tf(1:3,4);
    eje_x_2 = p2+ Tf(1:3,1);
    eje_y_2 = p2+ Tf(1:3,2);
    eje_x_3 = p3+ Tf(1:3,1);
    eje_y_3 = p3+ Tf(1:3,2);
    line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 1 1],'linewidth',5 )
    line([p2(1) eje_x_2(1)],[p2(2) eje_x_2(2)],[p2(3) eje_x_2(3)],'color',[0 1 0],'linewidth',5 )
    line([p2(1) eje_y_2(1)],[p2(2) eje_y_2(2)],[p2(3) eje_y_2(3)],'color',[1 0 0],'linewidth',5 )
    
    TRy3 = [cos(angVec3(i)) 0 -sin(angVec3(i)) 0;0 1 0 0;sin(angVec3(i)) 0 cos(angVec3(i)) 0; 0 0 0 1];
    TTx3 = [1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T3 = TRy3*TTx3;
    Tr = Tf*T3;
    p4 = Tr(1:3,4);
    eje_x_2 = p2+ Tr(1:3,1);
    eje_y_2 = p2+ Tr(1:3,2);
    eje_x_3 = p3+ Tr(1:3,1);
    eje_y_3 = p3+ Tr(1:3,2);
    eje_x_4 = p4+ Tr(1:3,1);
    eje_y_4 = p4+ Tr(1:3,2);
    line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0 0],'linewidth',5 )
    line([p3(1) eje_x_3(1)],[p3(2) eje_x_3(2)],[p3(3) eje_x_3(3)],'color',[0 1 0],'linewidth',5 )
    line([p3(1) eje_y_3(1)],[p3(2) eje_y_3(2)],[p3(3) eje_y_3(3)],'color',[1 0 0],'linewidth',5 )
    line([p4(1) eje_x_4(1)],[p4(2) eje_x_4(2)],[p4(3) eje_x_4(3)],'color',[0 1 0],'linewidth',5 )
    line([p4(1) eje_y_4(1)],[p4(2) eje_y_4(2)],[p4(3) eje_y_4(3)],'color',[1 0 0],'linewidth',5 )
    grid on
    pause (0.1)
end



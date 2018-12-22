0
%% MODELADO DE SISTEMAS BIONICOS:
% Mostrar leyes de control en SIMULINK para PVTOL X & Y se van a cero. (Si
% se quiere que llegen a X & Y las funciones de estado tienen que estar en
% funcion de los errores:
%   e_x = x_d - x, e_y = y_d - y,
%   e''_x = -x'', e''_y = -y'',
%   e''_x = u_1*sin(phi), e''_y = 1 - u_1*cos(phi), phi = u_2

% Valores Iniciales:
x0 = input('Introduzca x0: ');
y0 = input('Introduzca y0: ');
xf = input('Introduzca xf: ');
yf = input('Introduzca yf: ');
% % Simulink:
% sim birotorPVTOLalorigen2
% % Graficas:
% figure, subplot(2,1,1)
%     plot(t,X,t,Y,t,phi),
%     grid on,
%     legend('x','y','phi'),
%     title ('Resuesta en tiempo PVTOL')
%     xlabel('tiempo')
% subplot(2,1,2)
%     plot(X,Y,x0,y0,'s',0,0,'o'),
%     grid on,
%     legend('trayectoria','origen','destino'),
%     title ('Resuesta X vs Y PVTOL')
%     xlabel('X')
%     xlabel('Y')
% Simulink:
sim birotorPVTOL
% Graficas:
figure, 
subplot(1,2,1)
    plot(t,X,t,Y), 
    axis([0,10,min([min(Y),min(X)])-1,max([max(Y),max(X)])+1])
    grid on,
    legend('x','y','Location','SouthOutside'),
    title ('Resuesta en tiempo PVTOL')
    xlabel('Tiempo (s)')
    ylabel('Coordenadas')
subplot(1,2,2)
    plot(X,Y,'b',x0,y0,'gs',xf,yf,'ro'),axis([min(X)-1,max(X)+1,min(Y)-1,max(Y)+1])
    grid on,
    legend('Trayectoria','Origen','Destino','Location','SouthOutside'),
    title ('Resuesta X vs Y PVTOL')
    xlabel('X')
    ylabel('Y')
figure % Simulacion
    p = round(length(t)/240);
    plot(X,Y,'b',x0,y0,'gs',xf,yf,'ro'), hold on, grid on,
    dibujarBirotor(X(1),Y(1),phi(1)),
    axis([min(X)-1,max(X)+1,min(Y)-1,max(Y)+1])
    title(['PVTOL simulacion - Tiempo: ',num2str(t(1))])
    for i = p+1:p:length(t)
        pause((t(i)-t(i-p))/1000)
        plot(X,Y,'b',x0,y0,'gs',xf,yf,'ro'), hold on, grid on,
        dibujarBirotor(X(i),Y(i),phi(i)), 
        axis([min(X)-1,max(X)+1,min(Y)-1,max(Y)+1])
        title(['PVTOL simulacion - Tiempo: ',num2str(t(i))])
    end
    plot(X,Y,'b',x0,y0,'gs',xf,yf,'ro'), hold on, grid on,
    dibujarBirotor(X(length(t)),Y(length(t)),phi(length(t)))
    axis([min(X)-1,max(X)+1,min(Y)-1,max(Y)+1])
    title(['PVTOL simulacion - Tiempo: ',num2str(t(length(t)))])
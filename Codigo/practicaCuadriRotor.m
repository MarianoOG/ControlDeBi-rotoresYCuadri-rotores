%% MODELADO DE SISTEMAS BIONICOS:
% Mostrar leyes de control en SIMULINK para cuadri-rotor X, Y y Z. 
% Simulacion 3D.

% Valores Iniciales:
x0 = input('Introduzca x0: ');
y0 = input('Introduzca y0: ');
z0 = input('Introduzca z0: ');
xf = input('Introduzca xf: ');
yf = input('Introduzca yf: ');
zf = input('Introduzca zf: ');
b = input('Introduzca b: ');
% Simulink:
sim cuadriRotor
% Graficas:
figure,
subplot(1,3,1)
    plot(t,X,t,Y,t,Z), 
    axis([0,max(t),min([min(Z),min(Y),min(X)])-1,max([max(Z),max(Y),max(X)])+1])
    grid on,
    legend('x','y','z','Location','SouthOutside'),
    title ('Resuesta en tiempo de coordenadas')
    xlabel('Tiempo (s)')
    ylabel('Coordenadas')
subplot(1,3,2)
    plot(t,phi,t,theta), 
    axis([0,max(t),min([min(phi),min(theta)]-0.5),max([max(phi),max(theta)]+0.5)])
    grid on,
    legend('phi','theta','Location','SouthOutside'),
    title ('Resuesta en tiempo de angulos')
    xlabel('Tiempo (s)')
    ylabel('Angulos')
subplot(1,3,3)
    plot3(X,Y,Z,'b',x0,y0,z0,'gs',xf,yf,zf,'ro'),axis([min(X)-1,max(X)+1,min(Y)-1,max(Y)+1,min(Z)-1,max(Z)+1])
    grid on,
    legend('Trayectoria','Origen','Destino','Location','SouthOutside'),
    title ('Resuesta XYZ cuadri-rotor')
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
figure % Simulacion
     for i = 1:length(t)
         pause(0.05)
         plot3(X,Y,Z,'b',x0,y0,z0,'gs',xf,yf,zf,'ro'), hold on, grid on,
         dibujarCuadrirotor(X(i),Y(i),Z(i),theta(i),phi(i)),
         axis([min(X)-1,max(X)+1,min(Y)-1,max(Y)+1,min(Z)-1,max(Z)+1])
         title(['Cuadri-rotor simulacion - Tiempo: ',num2str(t(i))])
         xlabel('X'),ylabel('Y'),zlabel('Z')
     end
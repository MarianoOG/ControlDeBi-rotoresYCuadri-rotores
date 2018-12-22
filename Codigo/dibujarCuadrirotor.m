function dibujarCuadrirotor(x,y,z,theta,phi)
    plot3([x-0.5*cos(theta),x+0.5*cos(theta)],[y,y],[z+0.5*sin(theta),z-0.5*sin(theta)],'k')
    hold on
    plot3([x,x],[y+0.5*cos(phi),y-0.5*cos(phi)],[z+0.5*sin(phi),z-0.5*sin(phi)],'k')
    plot3([x,x+0.25*sin(theta)],[y,y-0.25*cos(theta)*sin(phi)],[z,z+0.25*cos(theta)*cos(phi)],'r')
    plot3(x,y,z,'r*')
    hold off
end
function dibujarBirotor(x,y,phi)
    plot([x-0.5*cos(phi),x+0.5*cos(phi)],[y-0.5*sin(phi),y+0.5*sin(phi)],'k')
    hold on
    plot([x,x-0.25*sin(phi)],[y,y+0.25*cos(phi)],'k')
    plot(x,y,'r*')
    hold off
end
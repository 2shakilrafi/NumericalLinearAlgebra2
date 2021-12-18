function [t,u] = beuler(f, tspan, y0, Nh)
 
xvect = linspace(tspan(end)-tspan(1),Nh);
h = (tspan(end)-tspan(1)) / Nh;
yvect = zeros(1,length(xvect));
yvect(1) = y0;
 
for i = 1:length(xvect)
    yvect(i+1) = yvect(i) + h * f(xvect(i),t);
end
 
u = yvect(end);

end
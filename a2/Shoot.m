function hit = Shoot(init_pos,init_theta,init_vel,init_p)


%
% Initial position and velocity
%
x0=init_pos(1);
y0=init_pos(2);
theta0=init_theta;
v0=init_vel;
p0=init_p;

%Initial Conditions
init = [x0; y0; theta0; v0; p0; 1]; %(last column is pig's initial velocity)
time_span = 0:0.05:5;

%
% Solve ODE: complete the commented call to ode45 below
%
options=odeset('Events',@events,'Refine',10,'MaxStep',0.01);
[t, z] = ode45(@motion_ode, [0:0.05:5], init, options);

%
% After the calculation, plot/animate the trajectory of the triangle
%
f = figure(1);
hold on;
n=length(t);
tri_h=plot(z(1,1),z(1,2),'r>','linewidth',10,'MarkerFaceColor','r');
%set(tri_h,'erasemode','normal');
pig = findobj(f,'Tag','Pig'); % locate the pig object
% first frame:
set(tri_h,'XData',z(2,1),'YData',z(2,2));
dot_h=plot(z(1,1),z(1,2),'.','color',[1,0.5,0.5],'linewidth',4,'MarkerFaceColor','g');
set(pig,'XData',z(2,5)*[1 1]);
% next frames:
for s=3:n,
  % set coordinates for triangle
  set(tri_h,'XData',z(s,1),'YData',z(s,2));
  % append coordinates for bird trajectory
  dx=[get(dot_h,'XData') z(s-1,1)];
  dy=[get(dot_h,'YData') z(s-1,2)];
  set(dot_h,'XData',dx,'YData',dy);
  % set x-coordinates for pig
  set(pig,'XData',z(s,5)*[1 1]);
  drawnow;
  pause(0.1);
end

% detect hit
hit = norm([z(n,1)-z(n,5) z(n,2)-0.05]) < 0.05;
    
    %
    % Dynamics function for the triangle: Complete the missing parts
    %
    function dz = motion_ode(t,z)
        dz = zeros(6,1);
        g = 9.81;
        w = -2;
        m = 0.3;
        ad = 1.29;
        c = 0.6;
        s = 0.005;
        %fill in the column vector dz
        dz(1) = z(4)*cos(z(3));
        dz(2) = z(4)*sin(z(3));
        dz(3) = -g/z(4)*cos(z(3));
        dz(4) = -c*ad*s/2/m*((dz(1)-w)^2+dz(2)^2)-g*sin(z(3));
        dz(5) = z(6);
        dz(6) = -5*pi*(z(5)-1);
    end
    
    %
    % Event function: Complete the missing parts
    %
    function [values,halt,direction]=events(t,z)

        x=z(1); 
        y=z(2);
              
      

        
        
        %fill in the third column here
        values    = [ y;  x-2;     sqrt((x-z(5))^2+(y-0.05)^2)-0.05      ];
        halt      = [ 1;    1;     1      ];
        direction = [-1;    1;     0      ];

    end

end

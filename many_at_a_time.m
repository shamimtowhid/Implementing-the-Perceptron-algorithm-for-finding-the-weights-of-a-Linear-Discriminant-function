class1=[1 1;1 -1;4 5];
class2=[2 2.5;0 2;2 3];
%plotting the sample points
plot(class1(:,1),class1(:,2),'s','MarkerFaceColor','g');
hold on;
plot(class2(:,1),class2(:,2),'d','MarkerFaceColor','r');

%generating high dimensional sample points using fi function
%y=[x1^2 x2^2 x1*x2 x1 x2 1]
for m=1:3
    for n=1:6
        if n==1
            x(m,n)=class1(m,n)^2;
        elseif n==2
            x(m,n)=class1(m,n)^2;
        elseif n==3
            x(m,n)=class1(m,1)*class1(m,2);
        elseif n==4
            x(m,n)=class1(m,1);
        elseif n==5
            x(m,n)=class1(m,2);
        else 
            x(m,n)=1;
        end
    end
end

for m=1:3
    for n=1:6
        if n==1
            y(m,n)=class2(m,n)^2;
        elseif n==2
            y(m,n)=class2(m,n)^2;
        elseif n==3
            y(m,n)=class2(m,1)*class2(m,2);
        elseif n==4
            y(m,n)=class2(m,1);
        elseif n==5
            y(m,n)=class2(m,2);
        else 
            y(m,n)=1;
        end
    end
end
%disp(x);
%disp(y);


%normalization of class 2
y=-y;
%disp(y);

%Applying perceptron algorithm to find the weight coefficients
final=[x;y];
disp(final);
weight=[0 0 0 0 0 0]; %initialization
g=[0 0 0 0 0 0];
counter=0;
flag=true;
control=6;
while flag
    for m=1:6
        g(m)=g(m)+final(m,:)*weight';
    end
    for m=1:6
        if g(m)<1
                weight=weight+final(m,:)*0.17;%assuming alpha(learning rate) = 1
                control=control+1;
                
        else
            control=control-1;
        end
    end
    if control==0
        flag=false;
    else
        control=6;
    end
    g = zeros(size(g));
    counter=counter+1;
end
disp(counter);
disp(weight);
%drawing decision boundary
syms x1 x2;
s=sym(weight(1)*x1*x1+weight(2)*x2*x2+weight(3)*x1*x2+weight(4)*x1+weight(5)*x2+weight(6));
s2=solve(s,x2);

xvals1=(-10:0.01:10);
xvals2(1,:)=subs(s2(2),x1,xvals1);
plot(xvals1,xvals2(1,:),'k');

legend('Class 1','Class 2');
title('finding weights of linear discrminant function using perceptron algorithm');
grid;
xlabel('X axis');
ylabel('Y axis');
hold off;
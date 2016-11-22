x=[0.1 0.17 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
one_at_a_time=[147 132 112 124 105 105 194 194 194 194 127];
many_at_a_time=[166 114 118 123 146 146 106 106 106 106 154];

plot(x,one_at_a_time,x,many_at_a_time);

legend('one at a time','many at a time');

title('one at a time VS many at a time');
grid;
xlabel('learning rate');
ylabel('steps taken to compute g(x)');





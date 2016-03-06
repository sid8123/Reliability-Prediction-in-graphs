clc
network=[
    0 1 0 1 0 0;
    0.9 0 1 1 0 0;
    0 0.9 0 1 1 1;
    1 1 1 0 1 0;
    0 0 1 1 0 1;
    0 0 1 0 1 0];

[n n] = size(network);

p = [];
kp = 1;

for i = 1 : n
    for j = 1 : i - 1
        if network(i , j) > 0
            p(kp) = network(i , j);
            kp = kp + 1;
        end
    end
end

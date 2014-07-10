%non overlapping first return time experiment

clear all;

q = 1/4;
entropy = -(1-q)*log2(1-q) - q*log2(q);
Max_Block = 20;
M = round(2^(entropy*Max_Block))*10;
N = M*Max_Block;
Sq = binornd(1, (1-q), 1, N);

R = zeros(Max_Block, 1);

for i = 1:Max_Block
    k = 1;
    while (sum(abs(Sq(1:i)-Sq((1+i*k):(i*(k+1))))) > 0)
        if (k > M-2)
            k = M;
            break
        end
        k = k+1;
    end
    if (k < N)
        R(i) = k;
        R2(i) = (log2(R(i))-0.83)./i;
    else
        break
    end
   
end

plot(R2, 'rO');
Hold on;
plot([0, Max_Block], [entropy, entropy]);
axis([0 Max_Block 0 1.2]);
Hold off;    
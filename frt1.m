% First return time experimenting

clear all;

q = 1/4;
entropy = -(1-q)*log2(1-q) - q*log2(q);
Max_Block = 18;
N = round(2^(entropy*Max_Block))*10;

Sq = binornd(1, (1-q), 1, N);

R = zeros(Max_Block, 1);

for i = 1:Max_Block
    k = 1;
    while (sum(abs(Sq(1:i)-Sq((1+k):(k+i)))) > 0)
        if (k > N-(i+1))
            k = N;
            break
        end
        k = k+1;
    end
    if (k < N)
        R(i) = k;
        R2(i) = log2(R(i))./i;
    else
        break
    end
   
end

plot(R2, 'rO');
Hold on;
plot([0, Max_Block], [entropy, entropy]);
axis([0 Max_Block 0 1.2]);
Hold off;    
%first return time log of the averages

clear all;

q = 1/10;
entropy = -(1-q)*log2(1-q) - q*log2(q);
Max_Block = 12;
N = round(2^(entropy*Max_Block))*500;
Sample = 1000;

R2 = zeros(Max_Block, Sample);
AveR = zeros(Max_Block, 1);

for s = 1:Sample
    Sq = binornd(1, (1-q), 1, N);
    R = zeros(Max_Block);
    
    for i = 1:Max_Block
    k = 1;
    while (sum(abs(Sq(1:i)-Sq((1+k):(k+i)))) > 0)
        if (k > N-(i+1))
            k = N;
            break
        end
        k = k+1;
    end
        R(i) = k;
        R2(i,s) = R(i);
    
    end
end

for m = 1:Max_Block
    AveR(m) = log2(sum(R2(m, 1:Sample))/Sample)./m;
end

axis([0 Max_Block 0 1.2]);
plot(AveR, 'rO');
Hold on;
plot([0, Max_Block], [entropy, entropy]);
axis([0 Max_Block 0 1.2]);
Hold off;    
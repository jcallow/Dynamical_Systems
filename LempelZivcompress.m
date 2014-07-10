%Lempel-Ziv compression algorithm/experiment

clear all;

q = 1/5;
entropy = -(1-q)*log2(1-q) - q*log2(q);
Max_Block = 5;
N = 1000000;
Sq = binornd(1, (1-q), 1, N);
C = 0;
i = 1;
Largest = 0;

while (i <= N)
    block = 2+Sq(i);
    address = 0;
    for j = 1:C
        if (block == phrase(j))
            address = j;
            if (i < N)
                i = i+1;
                block = block*2+Sq(i);
            end
        end
    end
    C = C+1;
    phrase(C)=block;
    LZ(C)={[address, Sq(i)]};
    i = i+1;
    if (address > Largest)
        Largest = address;
    end
end

for i = 1:C
    LZ{i};
end

bits = ceil(log2(Largest)) + 1;
Totalbits = bits*C

Compratio = Totalbits/N

entropy

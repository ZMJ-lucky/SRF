function [accuracy, ConMtx] = Eva_CA(dataCluster,dataLabel)

nData = length( dataLabel );
nC = max(dataLabel);
E = zeros( nC, nC );
for m = 1 : nData
    i1 = dataCluster( m );
    i2 = dataLabel( m );
    E( i1, i2 ) = E( i1, i2 ) + 1;
end
%E = int32( E' );
%[ nMatch, matchV ] = BMWM_Mex( E );
ConMtx=E';
E=-E;
[C,T]=hungarian(E);
nMatch=0;
for i=1:nC
    nMatch=nMatch-E(C(i),i);
end

accuracy = nMatch/nData;
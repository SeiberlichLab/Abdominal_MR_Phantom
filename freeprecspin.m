function Mout = freeprecspin(M,relaxTime,T1,T2,df,Nspins)
    [Atr,Btr] = freeprecess(relaxTime,T1,T2,df);
    Btr = repmat(Btr,[1 Nspins]);
    Mout = Atr*M + Btr;
end
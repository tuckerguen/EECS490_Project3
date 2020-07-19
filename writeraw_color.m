function count = writeraw_color(G,filename)
    fid=fopen(filename,'wb');
    if (fid==-1)
        error('can not open output image filem press CTRL-C to exit \n');
        pause
    end
    [X,Y,~]=size(G);  
    final = zeros(Y*3,X);
    for i=1:3
        n = i:3:Y*3;
        final(n,:)=G(:,:,i)';
    end
    count=fwrite(fid,final, 'uchar');
    fclose(fid);
end
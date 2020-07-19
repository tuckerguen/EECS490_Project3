function final =readraw_color(filename)
    disp(['	Retrieving Image ' filename ' ...']);
	fid=fopen(filename,'rb');
	if (fid==-1)
	  	error('can not open input image file press CTRL-C to exit \n');
	  	pause
	end
	pixel=fread(fid,inf, 'uchar');
	fclose(fid);
    [a,~]=size(pixel);  
    N = sqrt(a/3);
    for i=1:3
        n = i:3:a;
        G=zeros(N,N);
        G(1:N*N)=pixel(n);
        final(:,:,i)=G';
    end
    final = uint8(final);
end
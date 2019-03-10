function H = train(n)

    num = zeros(150,150,3);
    den = zeros(150,150,3);
    for i = 1:n
        j =  num2str(i);
        j = strcat(j,'.jpg');
        img = imread(strcat('train/',j));
        img = imgaussfilt(img,rand);
        img = imresize(img,[150,150]);
        D = fft2(img);
        noise = imnoise(img,'gaussian',rand);
        X = fft2(noise);
        num = num + abs(X.*conj(D));
        den = den + X.*conj(X);
    end
    H = num./den;
end

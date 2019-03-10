ntrain = 12;
ntest = 10;
psn_1 = 0; 
psn_2 = 0; 
mse = 0; 
H = train(ntrain);
for i = 1:ntest
    orig = imread('test/10.jpg');
    orig = imresize(orig,[150,150]);
    img = imgaussfilt(orig,0.1);
    noise = imnoise(img,'gaussian',rand);
    X = fft2(noise);
    D = fft2(img);
    Y = H.*X;
    out = real(ifft2(Y));
    output = uint8(out);
    output_1 = im2double(output);
    noise_1  = im2double(noise);
    img_1 = im2double(orig);
    psn_1 = psn_1 + psnr(output_1,img_1);
    mse = mse + immse(output_1,img_1);
    psn_2 = psn_2 + psnr(noise_1,img_1);
end
psn_1 = psn_1/ntest;
psn_2 = psn_2/ntest; 
mse = mse/ntest;
disp(psn_1);
disp(psn_2);
disp(mse);


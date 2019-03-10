n = 12;
H = train(n);

orig = imread('test/9.jpg');
orig = imresize(orig,[150,150]);
img = imgaussfilt(orig,0.5);

noise = imnoise(img,'gaussian',0.5);
X = fft2(noise);
D = fft2(img);

Y = H.*X;

out = real(ifft2(Y));
output = uint8(out);
output_1 = im2double(output);
noise_1 = im2double(noise);
img_1 = im2double(orig);

disp(psnr(img_1,output_1))
disp(psnr(noise_1,img_1))
disp(immse(img_1,output_1))

subplot (1,4,4);
imshow(output);

subplot (1,4,1);
imshow(orig);

subplot (1,4,3);;
imshow(noise);

subplot (1,4,2);
imshow(img);

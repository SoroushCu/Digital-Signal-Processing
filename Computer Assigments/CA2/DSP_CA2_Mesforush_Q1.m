%In this part we observe the effect of different filters on our photo.
Pic = imread('img.jpg');
%The original picture
%figure()
%imshow(Pic)
%Applying the Gaussian filter
figure();
H1= fspecial('gaussian',[3 3],0.5);
PicGaussian= imfilter(Pic,H1,'replicate');
imshow(PicGaussian);
title('Gaussian filter applied');
%Applying the Sobel filter
%figure();
H2= fspecial('sobel');
PicSobel= imfilter(Pic,H2,'replicate');
imshow(PicSobel);
title('Sobel filter applied');
%Applying the Disk filter
figure();
H3= fspecial('disk',5);
PicDisk= imfilter(Pic,H3,'replicate');
imshow(PicDisk);
title('Disk filter applied');
%Applying the Unsharp filter
figure();
H4= fspecial('unsharp',0.2);
PicUnsharp= imfilter(Pic,H4,'replicate');
imshow(PicUnsharp);
title('Unsharp filter applied');
%Applying the Average filter
figure();
H5= fspecial('average',[3 3]);
PicAverage= imfilter(Pic,H5,'replicate');
imshow(PicAverage);
title('Average filter applied');
%Applying the Laplacian filter
figure();
H6= fspecial('laplacian',1);
PicLaplacian= imfilter(Pic,H6,'replicate');
imshow(PicLaplacian);
title('Laplacian filter applied');

%Here we go for the plots.
%Applying the Gaussian filter
PicGaussianGray= rgb2gray(PicGaussian);
PicGaussianGrayF= fftshift(fft2(PicGaussianGray));
x=length(PicGaussianGrayF);
f=linspace(-x/2,x/2,x);
figure();
plot(f,abs(PicGaussianGrayF));
title('Magnitude of frequency response for Gaussian filter');

%Applying the Sobel filter

PicSobelGray= rgb2gray(PicSobel);
PicSobelGrayF= fftshift(fft2(PicSobelGray));
x=length(PicSobelGrayF);
f=linspace(-x/2,x/2,x);
figure();
plot(f,abs(PicSobelGrayF));
title('Magnitude of frequency response of Sobel filter');


%Applying the Disk filter

PicDiskGray= rgb2gray(PicDisk);
PicDiskGrayF= fftshift(fft2(PicDiskGray));
x=length(PicDiskGrayF);
f=linspace(-x/2,x/2,x);
figure();
plot(f,abs(PicDiskGrayF));
title('Magnitude of frequency response for Disk filter');

%Applying the Unsharp filter

PicUnsharpGray= rgb2gray(PicUnsharp);
PicUnsharpGrayF= fftshift(fft2(PicUnsharpGray));
x=length(PicUnsharpGrayF);
f=linspace(-x/2,x/2,x);
figure();
plot(f,abs(PicUnsharpGrayF));
title('Magnitude of frequency response for Unsharp filter');


%Applying the Average filter

PicAverageGray= rgb2gray(PicAverage);
PicAverageGrayF= fftshift(fft2(PicAverageGray));
x=length(PicAverageGrayF);
f=linspace(-x/2,x/2,x);
figure();
plot(f,abs(PicAverageGrayF));
title('Magnitude of frequency response for Average filter');


%Applying the Laplacian filter

PicLaplacianGray= rgb2gray(PicLaplacian);
PicLaplacianGrayF= fftshift(fft2(PicLaplacianGray));
x=length(PicLaplacianGrayF);
f=linspace(-x/2,x/2,x);
figure();
plot(f,abs(PicLaplacianGrayF));
title('Magnitude of frequency response of Laplacian filter');
    







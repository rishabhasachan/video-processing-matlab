function [ work_status ] = Video_processing(fno, vpath, inpath)

%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
video = VideoReader(vpath);
inpath=load (inpath)
			%Determine the column c and row r indices of the pixels to extract.
rand_row =inpath(:,1)%randi([1, 500], 1, 200);
rand_col =inpath(:,2)%randi([1, 500], 1, 200); 

			%Return the data at the selected pixel locations.

for img= 1:video.NumberOfFrames
	filename=strcat('frames\frame',num2str(img),'.jpg');
	b=read(video,img);%Current frame
	imwrite(b,filename);% Current frame written to a file
end


file = fopen('output.txt', 'w');
fprintf(file, '%10s  %10s\n\n', 'Coordinates', 'RGB values');
fname=strcat('frames\frame',num2str(fno),'.jpg');
RGB=imread(fname);% reading the current frame image
fprintf(file, '\n-------Frame %d -------\n\n', fno);

 for i=1:size(inpath,1)
        pixels = impixel(RGB,rand_row(i),rand_col(i))
        fprintf(file, '%3d %3d    %3d %3d %3d\n', rand_row(i), rand_col(i), pixels(1), pixels(2), pixels(3));
 end

fprintf(file, '\n---------------------- \n');

fclose(file);

work_status=1;



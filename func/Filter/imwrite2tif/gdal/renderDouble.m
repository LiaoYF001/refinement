function renderDouble(srcPath, dstPath, flag, scale)
gdalpath = "D:\code\match\EXP\CACHERES\gdal\";
if strcmp(flag, "hillshade")
    if  nargin == 3
        cmd1 = gdalpath + "gdaldem.exe hillshade " +srcPath + " " + dstPath;
        system(cmd1);
    else
        cmd1 = gdalpath + "gdaldem.exe hillshade " +srcPath + " " + dstPath + " -z " + num2str(scale);
        system(cmd1);
    end
elseif strcmp(flag, "hillshade_log")
    im = imread(srcPath);
    imwrite2tif(log(im),[], char(gdalpath + "Temp.tif"), 'double');
    cmd1 = gdalpath + "gdaldem.exe hillshade " +srcPath + " " + dstPath;
    system(cmd1);
elseif strcmp(flag, "hillshade_10")
    cmd1 = gdalpath + "gdaldem.exe hillshade " +srcPath + " " + dstPath + " -z 10";
    system(cmd1);
elseif strcmp(flag, "uint8")
    im = imread(srcPath);
    M = max(im(:));
    m = min(im(:));
    im = 255 * (im - m) / (M - m);
    imwrite(uint8(im), dstPath);
else
    im = imread(srcPath);
    f1 = figure; imagesc(im), colormap(char(flag)); axis off;
    set(f1, 'position', get(0,'ScreenSize'));
    saveas(f1, dstPath, "tif");
end

end


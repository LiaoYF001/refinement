%% 
close all
clear
clc
addpath(genpath("./func/"))
warning('off')

lam = 0.5;
path1 = ".\data\1\pair1.jpg";
path2 = ".\data\1\pair2.jpg";
model = "HOMOGRAPHY"; %["POLY", "AFFINE", "HOMOGRAPHY"];
lss = "mi";%["mi", "cc", "ssd", "rc", "cd2", "ms"];
pt_path1 = ".\data\1\CPT1.mat";
pt_path2 = ".\data\1\CPT2.mat";

CPT1 = load(pt_path1); CPT1 = double(CPT1.CPT1);
CPT2 = load(pt_path2); CPT2 = double(CPT2.CPT2);


im1 = ToDouble(ToGray(imread(path1)));
im2 = ToDouble(ToGray(imread(path2)));

[PT1, PT2] = refineLoc(im1, im2, CPT1, CPT2, lam, model, lss);


im1 = imread(path1); im2 = imread(path2);
figure; showMatchedFeatures(im1, im2, PT1, PT2, 'montage');











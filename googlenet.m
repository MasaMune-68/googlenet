%%
%%googlenetを読み込む
net = googlenet;
%%
%%ネットワークの入力サイズに変更
inputSize = net.Layers(1).InputSize
%%
%%合計1000個のクラスのうち、10個をランダムに表示
classNames = net.Layers(end).ClassNames;
numClasses = nume(classNames);
disp(classNames(randperm(numClasses,10)))
%%
%%イメージを読み取りと入力サイズに変更
I = imread('frenchloaf.jpg');
figure
imshow(I)

size(I)

I = imresize(I,inputSize(1:2));
figure
imshow(I)
%%
%%イメージの分類
[label,scores] = classify(net,I);
label
%%
%%予測確率を表示
figure
imshow(I)
title(string(label) + ", " + num2str(100*scores(classNames == label),3) + "%");
%%
%%最後に上位の予測の表示
[~,idx] = sort(scores,'descend');
idx = idx(5:-1:1);
classNamesTop = net.Layers(end).ClassNames(idx);
scoresTop = scores(idx);

figure
barh(scoresTop)
xlim([0 1])
title('Top 5 Predictions')
xlabel('Probability')
yticklabels(classNamesTop)
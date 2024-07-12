function net = createLicensePlateRecognitionModel()
    % 创建卷积神经网络模型
    layers = [
        imageInputLayer([32 32 1]) % 输入图像大小取决于字符的预期大小
        convolution2dLayer(3, 16, 'Padding', 'same')
        batchNormalizationLayer
        reluLayer
        
        maxPooling2dLayer(2, 'Stride', 2)
        
        convolution2dLayer(3, 32, 'Padding', 'same')
        batchNormalizationLayer
        reluLayer
        
        maxPooling2dLayer(2, 'Stride', 2)
        
        fullyConnectedLayer(128)
        reluLayer
        
        fullyConnectedLayer(36) % 输出层，36表示0-9数字和26个字母
        softmaxLayer
        classificationLayer
    ];

    % 设置训练选项
    options = trainingOptions('adam', ...
        'MaxEpochs', 10, ...
        'MiniBatchSize', 64, ...
        'Plots', 'training-progress');

    % 使用带有车牌字符的数据集进行训练
    rng('default')
    data = randomLicensePlateDatastore();
    
    % 训练模型
    net = trainNetwork(data, layers, options);
end

function data = randomLicensePlateDatastore()
    % 创建一个随机生成车牌字符和对应标签的数据集
    % 包含真实车牌字符和标签的数据集
    
    numSamples = 1000;
    imageSize = [32 32 1];
    
    data = augmentedImageDatastore(imageSize, 'DataFormat', 'channelsLast', 'NumObservations', numSamples);
    data.Labels = categorical(randi([1, 36], 1, numSamples), 1:36, createAlphabetAndDigitLabels());
end

function labels = createAlphabetAndDigitLabels()
    % 创建字母和数字的标签
    labels = ['0':'9' 'A':'Z'];
end
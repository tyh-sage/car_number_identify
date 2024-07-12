function net = createLicensePlateRecognitionModel()
    % �������������ģ��
    layers = [
        imageInputLayer([32 32 1]) % ����ͼ���Сȡ�����ַ���Ԥ�ڴ�С
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
        
        fullyConnectedLayer(36) % ����㣬36��ʾ0-9���ֺ�26����ĸ
        softmaxLayer
        classificationLayer
    ];

    % ����ѵ��ѡ��
    options = trainingOptions('adam', ...
        'MaxEpochs', 10, ...
        'MiniBatchSize', 64, ...
        'Plots', 'training-progress');

    % ʹ�ô��г����ַ������ݼ�����ѵ��
    rng('default')
    data = randomLicensePlateDatastore();
    
    % ѵ��ģ��
    net = trainNetwork(data, layers, options);
end

function data = randomLicensePlateDatastore()
    % ����һ��������ɳ����ַ��Ͷ�Ӧ��ǩ�����ݼ�
    % ������ʵ�����ַ��ͱ�ǩ�����ݼ�
    
    numSamples = 1000;
    imageSize = [32 32 1];
    
    data = augmentedImageDatastore(imageSize, 'DataFormat', 'channelsLast', 'NumObservations', numSamples);
    data.Labels = categorical(randi([1, 36], 1, numSamples), 1:36, createAlphabetAndDigitLabels());
end

function labels = createAlphabetAndDigitLabels()
    % ������ĸ�����ֵı�ǩ
    labels = ['0':'9' 'A':'Z'];
end
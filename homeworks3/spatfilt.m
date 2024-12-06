function f = spatfilt(g, type, m, n, parameter)
    % SPATFILTER
    % funzione che implementa filtri spaziali lineari e non
    % lineari, restituisce in output l'immagine filtrata
    % Parametri
    % g = immagine degradata
    % type = tipo di filtro da generare
    % m = righe del filtro
    % n = colonne del filtro
    % parameter = parametro aggiuntivo per filtri che lo necessitano
    % (armonica, contrarmonica e alpha-trimmed)
    

    channels = size(g,3);
    f = g; %inizializzo l'immagine
    for chann=1:channels
        img = g(:,:,chann);
        switch(type)
            case "arithmetic"
                h = fspecial("average",[m,n]);
                f(:,:,chann) = imfilter (img,h); %gestisce automaticamente il padding
    
            case "geometric"
                
                % Converti l'immagine in tipo double (evita errori con logaritmo)
                img = double(img);
                
                % Calcola il logaritmo dell'immagine (aggiungi un piccolo offset per evitare log(0))
                logImg = log(img + 1);
                logImg = real(logImg);
                % Dimensione del filtro
                filter = fspecial('average', [m,n]);
                
                % Applica il filtro medio sull'immagine logaritmica
                filteredLogImg = imfilter(logImg, filter, 'replicate'); 
                
                % Calcola l'esponenziale per ottenere la media geometrica
                f(:,:,chann) = exp(filteredLogImg) - 1;
                
            
            case 'harmonic'
                [P, Q, C] = size(img); % Dimensioni dell'immagine input
                padRows = floor(m / 2); % Numero di righe di padding
                padCols = floor(n / 2); % Numero di colonne di padding
                
                % Aggiungere padding all'immagine
                paddedImg = padarray(img, [padRows, padCols]);
                
               
                % Scorrere l'immagine originale
                for i = 1:P
                    for j = 1:Q
                        % Estrarre la finestra m x n
                        window = paddedImg(i:i + m - 1, j:j + n - 1);
                        
                        % Applicare la formula del filtro armonico:
                        % H = m * n / sum(1 ./ window)
                        % Assicurarsi di evitare divisioni per zero
                        window(window == 0) = eps; 
                        harmonicMean = (m * n) / sum(1 ./ window(:));
                        
                        % Salvare il risultato nella posizione corrispondente
                        f(i, j, chann) = uint8(harmonicMean);
                    end
                end
    
            case 'contraharmonic'
                if nargin < 4
                    parameter = 1.5; % Valore di default
                end
    
                Q = parameter;
                [rows, cols] = size(img); % Dimensioni dell'immagine input
                padRows = floor(m / 2); % Numero di righe di padding
                padCols = floor(n / 2); % Numero di colonne di padding
                
                % Aggiungere padding all'immagine
                paddedImg = double(padarray(img, [padRows, padCols]));
                
                
                
                % Scorrere l'immagine originale
                for i = 1:rows
                    for j = 1:cols
                        % Estrarre la finestra m x n
                        window = double(paddedImg(i:i + m - 1, j:j + n - 1));
                        
                        % Applico la formula del filtro contrarmonico
                        sumUpper = sum(double(window(:)).^(Q + 1));
                        sumLower = sum(double(window(:)).^Q);
                        
                        if sumLower == 0 
                            sumLower = eps;
                        end
                        % Salvare il risultato nella posizione corrispondente
                        f(i, j, chann) = sumUpper/sumLower;
                    end
                end
            case 'median'
                f(:,:,chann) = medfilt2(img,[m,n]);
            case 'minimum'
                f(:,:,chann) = ordfilt2(img,1,ones(m,n));
            case 'maximum'
                maximum = m*n;
                f(:,:,chann) = ordfilt2(img,maximum,ones(m,n));
            case 'midpoint'
                [P,Q]= size(img);
                padRows = floor(n/2);
                padCols = floor (m/2);
                paddedImg = padarray(img,[padRows,padCols],'replicate');
                f= zeros(P,Q);
                % Scorrere l'immagine originale
                for i = 1:P
                    for j = 1:Q
                        % Estrarre la finestra m x n
                        window = paddedImg(i:i + m - 1, j:j + n - 1);
                        minValue = min(window(:));
                        maxValue = max(window(:));
                        f(i,j,chann)= (minValue+maxValue)/2;
                    end
                end 
            case 'alpha-trimmed'
                if nargin < 4
                    parameter = 2; % Valore di default
                end
                d = parameter;
                [P,Q]= size(img);
                padRows = floor(n/2);
                padCols = floor (m/2);
                paddedImg = padarray(img,[padRows,padCols],'replicate');
                f= zeros(P,Q);
                % Scorrere l'immagine originale
                for i = 1:P
                    for j = 1:Q
                        % Estrarre la finestra m x n
                        window = paddedImg(i:i + m - 1, j:j + n - 1);
                        sortedWindow = sort(window(:));
                        trimmedWindow = sortedWindow((d / 2 + 1):(end - d / 2));
                        f(i, j,chann) = mean(trimmedWindow);
                    end
                end 
            otherwise
        end

    end

    % Converti l'immagine risultante in uint8
    f = uint8(f);

end
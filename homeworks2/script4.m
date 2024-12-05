%aggiungere padding

% Carica l'immagine e convertila in scala di grigi
img = imread("lena.gif");

% Calcolo della trasformata
F = fft2(img);
F_shifted = fftshift(F);

% Calcola il modulo della trasformata
F_magnitude = log(1 + abs(F_shifted));

% Ricostruzione dell'immagine tramite trasformata inversa
img_reconstructed = uint8(real(ifft2(F)));

% Mostra i risultati
subplot(6, 3, 1), imshow(img), title("Originale");
subplot(6, 3, 2), imshow(F_magnitude, []), title("Trasformata");
subplot(6, 3, 3), imshow(img_reconstructed), title("Immagine ricostruita");

% Dimensioni dell'immagine
[M, N] = size(img);

% Frequenze di taglio come percentuali
percentages = [1, 2, 4, 8, 16]; % percentuali di D0
D_values = (percentages / 100) * max(M, N); % Calcola i valori di D0

% Crea il filtro passabasso
D = 5; % Cutoff
H = zeros(M, N);
center_x = floor(M / 2) + 1;
center_y = floor(N / 2) + 1;

img_position = 4;

for cutoff=1:length(D_values)
    for i = 1:M
        for j = 1:N
            % Calcola la distanza euclidea dal centro
            distance = sqrt((i - center_x)^2 + (j - center_y)^2);
            
            % Applica il filtro
            if distance <= D_values(cutoff)
                H(i, j) = 1;
            end
        end
    end
    
    % Filtra in frequenza
    F_filtered = F_shifted .* H;    %prodotto puntuale
    
    % Trasforma indietro e prendi la parte reale
    filtered_image = real(ifft2(ifftshift(F_filtered)));
    
    filter_show= log(1 + abs(F_filtered)); 
    
    % Visualizza il filtro e le immagini filtrate
    subplot(6, 3, img_position), imshow(H, []), title("Filtro passabasso");
    img_position= img_position+1;
    subplot(6, 3, img_position), imshow(filter_show, []), title("Frequenze filtrate");
    img_position= img_position+1;
    subplot(6, 3, img_position), imshow(uint8(filtered_image)), title("Immagine filtrata");
    img_position= img_position+1;

end




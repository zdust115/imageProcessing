for i=1:256
    for j=1:256
        A(i,j)=j-1;
    end
end

A = mat2gray(A);


for i=1:256
    for j=1:256
        if ((sqrt((i-128)^2 + (j-128)^2)) <100)
            B(i,j)=255;
        else 
            B(i,j)=0;
        end
    end
end

figure, imshow(A);
figure, imshow(B);


for i=1:256
    for j=1:256
        C(i,j)= A(i,j)*B(i,j)/255;
    end
end

figure, imshow(C);

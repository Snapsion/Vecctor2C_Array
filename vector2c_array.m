function str = vector2c_array(vect,type,savedname,file)
%VECTOR2C_ARRAY saves a vector to a C array
%
%   R = VECTOR2C_ARRAY(vect,type,savedname,file)
%       converts vect into a C array of type 'type'
%       and of identifier 'savedname' and saves the result
%       to the .h file specified in 'file' argument.
%       
%       R is a string containing the C array
%
%       Only the 'vect' argument is mandatory


if(nargin <1)
    disp('Error: need more arguments');
end

if(nargin <2)
    type = "double";
end

if(nargin <3)
    savedname = "arr1";
end

if(nargin <4)
    file = "";
end


result =type+' '+savedname+'['+string(length(vect))+']='+newline+'{';
for i = 1:length(vect)
    
   if(mod(i,10)==1)
       result = result + newline + string(vect(i))+',';
   else
       if(i < length(vect))
            result = result + char(9) + string(vect(i))+',';
       else
            result = result + char(9) + string(vect(i));
       end
   end
end

%result(length(result))=[];


result = result +newline+'};'+newline;

if(file ~= "")
    fileID = fopen(file,'w');
    fprintf(fileID,"%s",result);
    fclose(fileID);
end


str = result;



end


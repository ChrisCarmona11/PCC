Vds=[ ]; 						% Initializing Drain Voltage &
Id=[ ]; 						% Drain to Source Current
VgsList = [-4.5:.5:-2 -1.75:.25:0];
for Vgs = VgsList
	data=[ ];
	for Vin = 0:-0.25:-10  %No utilizo el offset de +5V
		outputSingleScan(s,[Vin,Vgs]); 		% Output drain-source, gate voltages
        % 
		%wait (s,.1)
        %dato=inputSingleScan(s);
        dato = read(d, 'OutputFormat', 'Matrix');
        dato=[dato(1)*10 dato(2)];
		data=[data; dato]; 			% Acquire vector of all inputs
        %wait (s,.1)
	end 						% for Vgs
    Id = [Id data(:,1)]; 				% Setting up current matrix
	Vds = [Vds data(:,2)]; 				% Setting up voltage matrix
end 	

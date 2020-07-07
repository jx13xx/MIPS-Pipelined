
function datamemory1_config(this_block)

 

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('datamemory1');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('address');
  this_block.addSimulinkInport('WriteData');
  this_block.addSimulinkInport('MemRead');
  this_block.addSimulinkInport('MemWrite');

  this_block.addSimulinkOutport('ReadData');

  ReadData_port = this_block.port('ReadData');
  ReadData_port.setType('UFix_32_0');

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('address').width ~= 32);
      this_block.setError('Input data type for port "address" must have width=32.');
    end

    if (this_block.port('WriteData').width ~= 32);
      this_block.setError('Input data type for port "WriteData" must have width=32.');
    end

    if (this_block.port('MemRead').width ~= 1);
      this_block.setError('Input data type for port "MemRead" must have width=1.');
    end

    this_block.port('MemRead').useHDLVector(false);

    if (this_block.port('MemWrite').width ~= 1);
      this_block.setError('Input data type for port "MemWrite" must have width=1.');
    end

    this_block.port('MemWrite').useHDLVector(false);

  end  % if(inputTypesKnown)
  % -----------------------------

  % System Generator found no apparent clock signals in the HDL, assuming combinational logic.
  % -----------------------------
   if (this_block.inputRatesKnown)
     inputRates = this_block.inputRates; 
     uniqueInputRates = unique(inputRates); 
     outputRate = uniqueInputRates(1);
     for i = 2:length(uniqueInputRates)
       if (uniqueInputRates(i) ~= Inf)
         outputRate = gcd(outputRate,uniqueInputRates(i));
       end
     end  % for(i)
     for i = 1:this_block.numSimulinkOutports 
       this_block.outport(i).setRate(outputRate); 
     end  % for(i)
   end  % if(inputRatesKnown)
  % -----------------------------

    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('../Pipepline Tanmay/432/432 vhdl files/instruction_memory/instruction_memory.srcs/sources_1/new/datamemory1.vhd');

return;



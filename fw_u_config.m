
function fw_u_config(this_block)



  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('fw_u');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('EX_MEM_Rd');
  this_block.addSimulinkInport('MEM_WB_Rd');
  this_block.addSimulinkInport('EX_MEM_RegWrite');
  this_block.addSimulinkInport('MEM_WB_RegWrite');
  this_block.addSimulinkInport('Rs');
  this_block.addSimulinkInport('Rt');

  this_block.addSimulinkOutport('ForwardA');
  this_block.addSimulinkOutport('ForwardB');

  ForwardA_port = this_block.port('ForwardA');
  ForwardA_port.setType('UFix_2_0');
  ForwardB_port = this_block.port('ForwardB');
  ForwardB_port.setType('UFix_2_0');

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('EX_MEM_Rd').width ~= 5);
      this_block.setError('Input data type for port "EX_MEM_Rd" must have width=5.');
    end

    if (this_block.port('MEM_WB_Rd').width ~= 5);
      this_block.setError('Input data type for port "MEM_WB_Rd" must have width=5.');
    end

    if (this_block.port('EX_MEM_RegWrite').width ~= 1);
      this_block.setError('Input data type for port "EX_MEM_RegWrite" must have width=1.');
    end

    this_block.port('EX_MEM_RegWrite').useHDLVector(false);

    if (this_block.port('MEM_WB_RegWrite').width ~= 1);
      this_block.setError('Input data type for port "MEM_WB_RegWrite" must have width=1.');
    end

    this_block.port('MEM_WB_RegWrite').useHDLVector(false);

    if (this_block.port('Rs').width ~= 5);
      this_block.setError('Input data type for port "Rs" must have width=5.');
    end

    if (this_block.port('Rt').width ~= 5);
      this_block.setError('Input data type for port "Rt" must have width=5.');
    end

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
  this_block.addFile('../Pipepline Tanmay/432/432 vhdl files/forward/forward.srcs/sources_1/new/fw_u.vhd');

return;



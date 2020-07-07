
function hazard_unit_config(this_block)



  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('hazard_unit');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('ID_EX_MemRead');
  this_block.addSimulinkInport('IF_ID_Rs');
  this_block.addSimulinkInport('IF_ID_Rt');
  this_block.addSimulinkInport('ID_EX_Rt');

  this_block.addSimulinkOutport('nop');
  this_block.addSimulinkOutport('PCWrite');
  this_block.addSimulinkOutport('ID_IF_Write');

  nop_port = this_block.port('nop');
  nop_port.setType('UFix_1_0');
  nop_port.useHDLVector(false);
  PCWrite_port = this_block.port('PCWrite');
  PCWrite_port.setType('UFix_1_0');
  PCWrite_port.useHDLVector(false);
  ID_IF_Write_port = this_block.port('ID_IF_Write');
  ID_IF_Write_port.setType('UFix_1_0');
  ID_IF_Write_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('ID_EX_MemRead').width ~= 1);
      this_block.setError('Input data type for port "ID_EX_MemRead" must have width=1.');
    end

    this_block.port('ID_EX_MemRead').useHDLVector(false);

    if (this_block.port('IF_ID_Rs').width ~= 5);
      this_block.setError('Input data type for port "IF_ID_Rs" must have width=5.');
    end

    if (this_block.port('IF_ID_Rt').width ~= 5);
      this_block.setError('Input data type for port "IF_ID_Rt" must have width=5.');
    end

    if (this_block.port('ID_EX_Rt').width ~= 5);
      this_block.setError('Input data type for port "ID_EX_Rt" must have width=5.');
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
  this_block.addFile('../Pipepline Tanmay/432/Hazard/Hazard.srcs/sources_1/new/Hazard_unit.vhd');

return;



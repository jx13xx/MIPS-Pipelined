
function mipsalu_config(this_block)

 

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('mipsalu');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('a');
  this_block.addSimulinkInport('b');
  this_block.addSimulinkInport('aluctl');

  this_block.addSimulinkOutport('aluout');
  this_block.addSimulinkOutport('z');

  aluout_port = this_block.port('aluout');
  aluout_port.setType('UFix_32_0');
  z_port = this_block.port('z');
  z_port.setType('UFix_1_0');
  z_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('a').width ~= 32);
      this_block.setError('Input data type for port "a" must have width=32.');
    end

    if (this_block.port('b').width ~= 32);
      this_block.setError('Input data type for port "b" must have width=32.');
    end

    if (this_block.port('aluctl').width ~= 4);
      this_block.setError('Input data type for port "aluctl" must have width=4.');
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
  this_block.addFile('../Pipepline Tanmay/432/432 vhdl files/alu/alu/alu.srcs/sources_1/new/myalu.vhd');

return;



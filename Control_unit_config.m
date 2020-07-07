
function Control_unit_config(this_block)

 

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('Control_unit');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('opcode');

  this_block.addSimulinkOutport('ALU_op');
  this_block.addSimulinkOutport('Branch');
  this_block.addSimulinkOutport('mem_read');
  this_block.addSimulinkOutport('mem_write');
  this_block.addSimulinkOutport('alu_src');
  this_block.addSimulinkOutport('reg_write');
  this_block.addSimulinkOutport('mem_to_reg');
  this_block.addSimulinkOutport('reg_dst');

  ALU_op_port = this_block.port('ALU_op');
  ALU_op_port.setType('UFix_2_0');
  Branch_port = this_block.port('Branch');
  Branch_port.setType('UFix_1_0');
  Branch_port.useHDLVector(false);
  mem_read_port = this_block.port('mem_read');
  mem_read_port.setType('UFix_1_0');
  mem_read_port.useHDLVector(false);
  mem_write_port = this_block.port('mem_write');
  mem_write_port.setType('UFix_1_0');
  mem_write_port.useHDLVector(false);
  alu_src_port = this_block.port('alu_src');
  alu_src_port.setType('UFix_1_0');
  alu_src_port.useHDLVector(false);
  reg_write_port = this_block.port('reg_write');
  reg_write_port.setType('UFix_1_0');
  reg_write_port.useHDLVector(false);
  mem_to_reg_port = this_block.port('mem_to_reg');
  mem_to_reg_port.setType('UFix_1_0');
  mem_to_reg_port.useHDLVector(false);
  reg_dst_port = this_block.port('reg_dst');
  reg_dst_port.setType('UFix_1_0');
  reg_dst_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('opcode').width ~= 6);
      this_block.setError('Input data type for port "opcode" must have width=6.');
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
  this_block.addFile('../Pipepline Tanmay/432/432 vhdl files/Control_unit/Control_unit.srcs/sources_1/new/Control_unit.vhd');

return;



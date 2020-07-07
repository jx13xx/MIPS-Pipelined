# MIPS-Pipelined
The main **5-Stages** in a RISC pipeline architecture 
 - Instruction Fetch
 - Instruction Decode
 - Execute
 - Memory Access
 - Writeback
 
![](Pipeline_MIPS.png)

### Data Memory

**INPUT:**
- Address: What address in memory you will look up Read/Write.
- Write data: the data that will get written into memory

**OUTPUT:**
- Read Data: data read for a specific address

**CONTROL INPUTS:**
 - MemWrite: take the write data and write it on correct address specified by address input. 
 - MemRead: Look at address, and transfer the data onto read data.


 ```VHDL
  begin
 datamem:
 process(MemRead,MemWrite)
 variable mem_adr: natural;
 
begin
ReadData <= mydata((to_integer(unsigned(address))-268435456)/4);
if(MemWrite='1') then
mydata((to_integer(unsigned(address))-268435456)/4) <= WriteData;
end if;
```

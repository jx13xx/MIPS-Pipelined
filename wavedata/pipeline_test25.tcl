load G:/Xilinx/Vivado/2018.2/lib/win64.o/librdi_dsp_tcltasks.dll
cd {D:/Uni Stuff/ECTE432/Project/P2/wavedata}
dsp_wave_convert {pipeline_test25.wfv} 
set_param project.waveformStandaloneMode 1
start_gui
current_fileset
dsp_register_design_manager
dsp_open_waveform {pipeline_test25.wdb}
open_wave_config {pipeline_test25.wcfg}
source G:/Xilinx/Vivado/2018.2/scripts/sysgen/tcl/SgPaSlaveInterp.tcl

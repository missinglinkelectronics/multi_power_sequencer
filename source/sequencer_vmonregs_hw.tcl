# TCL File Generated by Component Editor 18.0
# Tue Oct 30 08:24:30 CDT 2018
# DO NOT MODIFY


# 
# sequencer_vmonregs "Sequencer Voltage Monitor" v1.0
#  2018.10.30.08:24:30
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module sequencer_vmonregs
# 
set_module_property DESCRIPTION ""
set_module_property NAME sequencer_vmonregs
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "Sequencer Voltage Monitor"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
set_module_property ELABORATION_CALLBACK elaborate


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH generate
add_fileset SIM_VERILOG SIM_VERILOG generate
add_fileset SIM_VHDL SIM_VHDL generate
set_fileset_property QUARTUS_SYNTH TOP_LEVEL sequencer_vmonregs
set_fileset_property SIM_VERILOG TOP_LEVEL sequencer_vmonregs
set_fileset_property SIM_VHDL TOP_LEVEL sequencer_vmonregs


# 
# parameters
# 
add_parameter VRAILS INTEGER 4
set_parameter_property VRAILS DEFAULT_VALUE 4
set_parameter_property VRAILS DISPLAY_NAME "Output Voltage Rails"
set_parameter_property VRAILS DESCRIPTION "The number of output voltage rails being sequenced."
set_parameter_property VRAILS TYPE INTEGER
set_parameter_property VRAILS UNITS None
set_parameter_property VRAILS ALLOWED_RANGES 0:143
set_parameter_property VRAILS HDL_PARAMETER true

add_parameter PG_NUM INTEGER 0
set_parameter_property PG_NUM DEFAULT_VALUE 0
set_parameter_property PG_NUM DISPLAY_NAME "Power Good Inputs"
set_parameter_property PG_NUM DESCRIPTION "The number of power good inputs to be monitored."
set_parameter_property PG_NUM TYPE INTEGER
set_parameter_property PG_NUM UNITS None
set_parameter_property PG_NUM ALLOWED_RANGES 0:143
set_parameter_property PG_NUM HDL_PARAMETER true

add_parameter ADC_VREF FLOAT 2.5
set_parameter_property ADC_VREF DISPLAY_NAME "ADC Reference Voltage"
set_parameter_property ADC_VREF DISPLAY_UNITS "V"
set_parameter_property ADC_VREF DESCRIPTION "Exact level for the ADC reference voltage."

add_parameter FEATURE_LEVEL INTEGER 2
set_parameter_property FEATURE_LEVEL DISPLAY_NAME "Functionality Level"
set_parameter_property FEATURE_LEVEL DESCRIPTION "Functionality Level for the Voltage Monitor.  Reduced functionality will allow for a smaller implementation size."
set_parameter_property FEATURE_LEVEL ALLOWED_RANGES {"0: No PMBus" "1: Hard-Coded Thresholds" "2: Full-featured"}

add_parameter ADC_SAMPLES INTEGER 5
set_parameter_property ADC_SAMPLES DISPLAY_NAME "ADC Samples to Check"
set_parameter_property ADC_SAMPLES DESCRIPTION "Number of contiguous ADC samples for a given input to check, before declaring a warning or fault (overvoltage, undervoltage, power good, etc.)."
set_parameter_property ADC_SAMPLES ALLOWED_RANGES 1:15

add_parameter RETRY_ATTEMPTS INTEGER 0
set_parameter_property RETRY_ATTEMPTS DISPLAY_NAME "Retry Attempts"
set_parameter_property RETRY_ATTEMPTS DESCRIPTION "The number of attempts the sequencer should make to come up, after detecting an error condition."
set_parameter_property RETRY_ATTEMPTS ALLOWED_RANGES {0 1 2 3 4 5 6 "7: Infinite"}

add_parameter RETRY_TIMEOUT INTEGER 0
set_parameter_property RETRY_TIMEOUT DISPLAY_NAME "Timeout Interval on Retry"
set_parameter_property RETRY_TIMEOUT DESCRIPTION "The delay interval that the sequencer will wait between retries."
set_parameter_property RETRY_TIMEOUT ALLOWED_RANGES {"0: No Delay" "1: Use Delay Specified by the Sequencer"}
set_parameter_property RETRY_TIMEOUT DISPLAY_HINT RADIO

# Parameters relating to the VIN input
add_display_item "" "Voltage Monitor Thresholds" GROUP TAB
add_display_item "Voltage Monitor Thresholds" "VIN" GROUP TAB
add_parameter VIN_TYP FLOAT 2.0
set_parameter_property VIN_TYP DISPLAY_NAME "VIN Typical Voltage, Monitored"
set_parameter_property VIN_TYP DISPLAY_UNITS "V"
set_parameter_property VIN_TYP DESCRIPTION "VIN Typical Voltage, as monitored by the ADC (V)."
add_parameter VIN_OVF FLOAT 107.0
set_parameter_property VIN_OVF DISPLAY_NAME "VIN Overvoltage Fault"
set_parameter_property VIN_OVF DISPLAY_UNITS "%"
set_parameter_property VIN_OVF DESCRIPTION "VIN Overvoltage Fault, measured as a percentage of the typical voltage."
add_parameter DV_VIN_OVF FLOAT 0.0
set_parameter_property DV_VIN_OVF DISPLAY_NAME "Derived Overvoltage Fault"
set_parameter_property DV_VIN_OVF DISPLAY_UNITS "V"
set_parameter_property DV_VIN_OVF DERIVED true
add_parameter VIN_OVW FLOAT 105.0
set_parameter_property VIN_OVW DISPLAY_NAME "VIN Overvoltage Warning"
set_parameter_property VIN_OVW DISPLAY_UNITS "%"
set_parameter_property VIN_OVW DESCRIPTION "VIN Overvoltage Warning, measured as a percentage of the typical voltage."
add_parameter DV_VIN_OVW FLOAT 0.0
set_parameter_property DV_VIN_OVW DISPLAY_NAME "Derived Overvoltage Warning"
set_parameter_property DV_VIN_OVW DISPLAY_UNITS "V"
set_parameter_property DV_VIN_OVW DERIVED true
add_parameter VIN_UVW FLOAT 97.0
set_parameter_property VIN_UVW DISPLAY_NAME "VIN Undervoltage Warning"
set_parameter_property VIN_UVW DISPLAY_UNITS "%"
set_parameter_property VIN_UVW DESCRIPTION "VIN Undervoltage Warning, measured as a percentage of the typical voltage."
add_parameter DV_VIN_UVW FLOAT 0.0
set_parameter_property DV_VIN_UVW DISPLAY_NAME "Derived Undervoltage Warning"
set_parameter_property DV_VIN_UVW DISPLAY_UNITS "V"
set_parameter_property DV_VIN_UVW DERIVED true
add_parameter VIN_ON FLOAT 95.0
set_parameter_property VIN_ON DISPLAY_NAME "VIN ON Level"
set_parameter_property VIN_ON DISPLAY_UNITS "%"
set_parameter_property VIN_ON DESCRIPTION "VIN ON Level, measured as a percentage of the typical voltage."
add_parameter DV_VIN_ON FLOAT 0.0
set_parameter_property DV_VIN_ON DISPLAY_NAME "Derived VIN ON Level"
set_parameter_property DV_VIN_ON DISPLAY_UNITS "V"
set_parameter_property DV_VIN_ON DERIVED true
add_parameter VIN_UVF FLOAT 93.0
set_parameter_property VIN_UVF DISPLAY_NAME "VIN Undervoltage Fault"
set_parameter_property VIN_UVF DISPLAY_UNITS "%"
set_parameter_property VIN_UVF DESCRIPTION "VIN Undervoltage Fault, measured as a percentage of the typical voltage."
add_parameter DV_VIN_UVF FLOAT 0.0
set_parameter_property DV_VIN_UVF DISPLAY_NAME "Derived Undervoltage Fault"
set_parameter_property DV_VIN_UVF DISPLAY_UNITS "V"
set_parameter_property DV_VIN_UVF DERIVED true
add_parameter VIN_OFF FLOAT 90.0
set_parameter_property VIN_OFF DISPLAY_NAME "VIN OFF Level"
set_parameter_property VIN_OFF DISPLAY_UNITS "%"
set_parameter_property VIN_OFF DESCRIPTION "VIN OFF Level, measured as a percentage of the typical voltage."
add_parameter DV_VIN_OFF FLOAT 0.0
set_parameter_property DV_VIN_OFF DISPLAY_NAME "Derived VIN OFF Level"
set_parameter_property DV_VIN_OFF DISPLAY_UNITS "V"
set_parameter_property DV_VIN_OFF DERIVED true
add_parameter VIN_OVRSP BOOLEAN true
set_parameter_property  VIN_OVRSP   DISPLAY_NAME   "Overvoltage Faults cause controlled sequence down"
set_parameter_property  VIN_OVRSP   DESCRIPTION    "When enabled, the sequencer sequences all rails down in the presence of an overvoltage fault."
add_parameter VIN_UVRSP BOOLEAN true
set_parameter_property  VIN_UVRSP   DISPLAY_NAME   "Undervoltage Faults cause controlled sequence down"
set_parameter_property  VIN_UVRSP   DESCRIPTION    "When enabled, the sequencer sequences all rails down in the presence of an undervoltage fault."
add_display_item "VIN" VIN_TYP PARAMETER
add_display_item "VIN" VIN_OVF PARAMETER
add_display_item "VIN" VIN_OVW PARAMETER
add_display_item "VIN" VIN_UVW PARAMETER
add_display_item "VIN" VIN_ON  PARAMETER
add_display_item "VIN" VIN_UVF PARAMETER
add_display_item "VIN" VIN_OFF PARAMETER
add_display_item "VIN" VIN_OVRSP PARAMETER
add_display_item "VIN" VIN_UVRSP PARAMETER
add_display_item "VIN" "Derived Thresholds" GROUP
add_display_item "Derived Thresholds" DV_VIN_OVF PARAMETER
add_display_item "Derived Thresholds" DV_VIN_OVW PARAMETER
add_display_item "Derived Thresholds" DV_VIN_UVW PARAMETER
add_display_item "Derived Thresholds" DV_VIN_ON  PARAMETER
add_display_item "Derived Thresholds" DV_VIN_UVF PARAMETER
add_display_item "Derived Thresholds" DV_VIN_OFF PARAMETER

# Parameters relating to the VOUT output rails - loop through the maximum number of rails and create a tab for each one
#   Unused tabs will be hidden, based upon the number of output rails the user creates above, via elaboration callback
for { set idx 0 } { $idx < 143 } { incr idx } {
  add_display_item "Voltage Monitor Thresholds" "VOUT${idx}" GROUP TAB
  add_parameter VOUT${idx}_TYP FLOAT 2.5  
  set_parameter_property VOUT${idx}_TYP DISPLAY_NAME "VOUT${idx} Typical Voltage, Monitored"
  set_parameter_property VOUT${idx}_TYP DISPLAY_UNITS "V"
  set_parameter_property VOUT${idx}_TYP DESCRIPTION "VOUT${idx} Typical Voltage, as monitored by the ADC (V)."
  add_parameter VOUT${idx}_OVF FLOAT 107.0
  set_parameter_property VOUT${idx}_OVF DISPLAY_NAME "VOUT${idx} Overvoltage Fault"
  set_parameter_property VOUT${idx}_OVF DISPLAY_UNITS "%"
  set_parameter_property VOUT${idx}_OVF DESCRIPTION "VOUT${idx} Overvoltage Fault, measured as a percentage of the typical voltage."
  add_parameter DV_VOUT${idx}_OVF FLOAT 0.0
  set_parameter_property DV_VOUT${idx}_OVF DISPLAY_NAME "Derived Overvoltage Fault"
  set_parameter_property DV_VOUT${idx}_OVF DISPLAY_UNITS "V"
  set_parameter_property DV_VOUT${idx}_OVF DERIVED true
  add_parameter VOUT${idx}_OVW FLOAT 105.0
  set_parameter_property VOUT${idx}_OVW DISPLAY_NAME "VOUT${idx} Overvoltage Warning"
  set_parameter_property VOUT${idx}_OVW DISPLAY_UNITS "%"
  set_parameter_property VOUT${idx}_OVW DESCRIPTION "VOUT${idx} Overvoltage Warning, measured as a percentage of the typical voltage."
  add_parameter DV_VOUT${idx}_OVW FLOAT 0.0
  set_parameter_property DV_VOUT${idx}_OVW DISPLAY_NAME "Derived Overvoltage Warning"
  set_parameter_property DV_VOUT${idx}_OVW DISPLAY_UNITS "V"
  set_parameter_property DV_VOUT${idx}_OVW DERIVED true
  add_parameter VOUT${idx}_UVW FLOAT 97.0
  set_parameter_property VOUT${idx}_UVW DISPLAY_NAME "VOUT${idx} Undervoltage Warning"
  set_parameter_property VOUT${idx}_UVW DISPLAY_UNITS "%"
  set_parameter_property VOUT${idx}_UVW DESCRIPTION "VOUT${idx} Undervoltage Warning, measured as a percentage of the typical voltage."
  add_parameter DV_VOUT${idx}_UVW FLOAT 0.0
  set_parameter_property DV_VOUT${idx}_UVW DISPLAY_NAME "Derived Undervoltage Warning"
  set_parameter_property DV_VOUT${idx}_UVW DISPLAY_UNITS "V"
  set_parameter_property DV_VOUT${idx}_UVW DERIVED true
  add_parameter VOUT${idx}_ON FLOAT 95.0
  set_parameter_property VOUT${idx}_ON DISPLAY_NAME "VOUT${idx} Power Good Assertion Level"
  set_parameter_property VOUT${idx}_ON DISPLAY_UNITS "%"
  set_parameter_property VOUT${idx}_ON DESCRIPTION "Level for VOUT${idx} at which Power Good should be asserted, measured as a percentage of the typical voltage."
  add_parameter DV_VOUT${idx}_ON FLOAT 0.0
  set_parameter_property DV_VOUT${idx}_ON DISPLAY_NAME "Derived VOUT${idx} ON Level"
  set_parameter_property DV_VOUT${idx}_ON DISPLAY_UNITS "V"
  set_parameter_property DV_VOUT${idx}_ON DERIVED true
  add_parameter VOUT${idx}_UVF FLOAT 93.0
  set_parameter_property VOUT${idx}_UVF DISPLAY_NAME "VOUT${idx} Undervoltage Fault"
  set_parameter_property VOUT${idx}_UVF DISPLAY_UNITS "%"
  set_parameter_property VOUT${idx}_UVF DESCRIPTION "VOUT${idx} Undervoltage Fault, measured as a percentage of the typical voltage."
  add_parameter DV_VOUT${idx}_UVF FLOAT 0.0
  set_parameter_property DV_VOUT${idx}_UVF DISPLAY_NAME "Derived Undervoltage Fault"
  set_parameter_property DV_VOUT${idx}_UVF DISPLAY_UNITS "V"
  set_parameter_property DV_VOUT${idx}_UVF DERIVED true
  add_parameter VOUT${idx}_OFF FLOAT 90.0
  set_parameter_property VOUT${idx}_OFF DISPLAY_NAME "VOUT${idx} Power Good Deassertion Level"
  set_parameter_property VOUT${idx}_OFF DISPLAY_UNITS "%"
  set_parameter_property VOUT${idx}_OFF DESCRIPTION "Level for VOUT${idx} at which Power Good should be deasserted, measured as a percentage of the typical voltage."
  add_parameter DV_VOUT${idx}_OFF FLOAT 0.0
  set_parameter_property DV_VOUT${idx}_OFF DISPLAY_NAME "Derived VOUT${idx} OFF Level"
  set_parameter_property DV_VOUT${idx}_OFF DISPLAY_UNITS "V"
  set_parameter_property DV_VOUT${idx}_OFF DERIVED true
  add_parameter VOUT${idx}_OVRSP BOOLEAN true
  set_parameter_property  VOUT${idx}_OVRSP   DISPLAY_NAME   "Overvoltage Faults cause controlled sequence down"
  set_parameter_property  VOUT${idx}_OVRSP   DESCRIPTION    "When enabled, the sequencer sequences all rails down in the presence of an overvoltage fault."
  add_parameter VOUT${idx}_UVRSP BOOLEAN true
  set_parameter_property  VOUT${idx}_UVRSP   DISPLAY_NAME   "Undervoltage Faults cause controlled sequence down"
  set_parameter_property  VOUT${idx}_UVRSP   DESCRIPTION    "When enabled, the sequencer sequences all rails down in the presence of an undervoltage fault."
  add_display_item "VOUT${idx}" VOUT${idx}_TYP PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_OVF PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_OVW PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_UVW PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_ON  PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_UVF PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_OFF PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_OVRSP PARAMETER
  add_display_item "VOUT${idx}" VOUT${idx}_UVRSP PARAMETER
  add_display_item "VOUT${idx}" "Derived Thresholds ${idx}" GROUP
  add_display_item "Derived Thresholds ${idx}" DV_VOUT${idx}_OVF PARAMETER
  add_display_item "Derived Thresholds ${idx}" DV_VOUT${idx}_OVW PARAMETER
  add_display_item "Derived Thresholds ${idx}" DV_VOUT${idx}_UVW PARAMETER
  add_display_item "Derived Thresholds ${idx}" DV_VOUT${idx}_ON  PARAMETER
  add_display_item "Derived Thresholds ${idx}" DV_VOUT${idx}_UVF PARAMETER
  add_display_item "Derived Thresholds ${idx}" DV_VOUT${idx}_OFF PARAMETER
}


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock ""
set_interface_property reset synchronousEdges NONE
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset RESET_N reset_n Input 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock CLOCK clk Input 1


# 
# connection point avs
# 
add_interface avs avalon end
set_interface_property avs addressUnits SYMBOLS
set_interface_property avs associatedClock clock
set_interface_property avs associatedReset reset
set_interface_property avs bitsPerSymbol 8
set_interface_property avs burstOnBurstBoundariesOnly false
set_interface_property avs burstcountUnits WORDS
set_interface_property avs explicitAddressSpan 0
set_interface_property avs holdTime 0
set_interface_property avs linewrapBursts false
set_interface_property avs maximumPendingReadTransactions 0
set_interface_property avs maximumPendingWriteTransactions 0
set_interface_property avs readLatency 0
set_interface_property avs readWaitTime 1
set_interface_property avs setupTime 0
set_interface_property avs timingUnits Cycles
set_interface_property avs writeWaitTime 0
set_interface_property avs ENABLED true
set_interface_property avs EXPORT_OF ""
set_interface_property avs PORT_NAME_MAP ""
set_interface_property avs CMSIS_SVD_VARIABLES ""
set_interface_property avs SVD_ADDRESS_GROUP ""

add_interface_port avs AVS_S0_READ read Input 1
add_interface_port avs AVS_S0_WRITE write Input 1
add_interface_port avs AVS_S0_ADDRESS address Input 8
add_interface_port avs AVS_S0_BYTEEN byteenable Input 4
add_interface_port avs AVS_S0_READDATA readdata Output 32
add_interface_port avs AVS_S0_WRITEDATA writedata Input 32
set_interface_assignment avs embeddedsw.configuration.isFlash 0
set_interface_assignment avs embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avs embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avs embeddedsw.configuration.isPrintableDevice 0


# 
# connection point vmon_conduit
# 
add_interface vmon_conduit conduit end
set_interface_property vmon_conduit associatedClock clock
set_interface_property vmon_conduit associatedReset reset
set_interface_property vmon_conduit ENABLED true
set_interface_property vmon_conduit EXPORT_OF ""
set_interface_property vmon_conduit PORT_NAME_MAP ""
set_interface_property vmon_conduit CMSIS_SVD_VARIABLES ""
set_interface_property vmon_conduit SVD_ADDRESS_GROUP ""

add_interface_port vmon_conduit ADC_VIN_LEVEL_Q vin_level Input 14
add_interface_port vmon_conduit ADC_VOUT_LEVEL_Q vout_level Input VRAILS*14


# 
# connection point sequencer_monitor
# 
add_interface sequencer_monitor conduit end
set_interface_property sequencer_monitor associatedClock ""
set_interface_property sequencer_monitor associatedReset ""
set_interface_property sequencer_monitor ENABLED true
set_interface_property sequencer_monitor EXPORT_OF ""
set_interface_property sequencer_monitor PORT_NAME_MAP ""
set_interface_property sequencer_monitor CMSIS_SVD_VARIABLES ""
set_interface_property sequencer_monitor SVD_ADDRESS_GROUP ""

add_interface_port sequencer_monitor SEQ_ENABLE enable Output 1
add_interface_port sequencer_monitor SEQ_VIN_FAULT vin_fault Output 1
add_interface_port sequencer_monitor SEQ_VRAIL_PWRGD vrail_pwrgd Output VRAILS
add_interface_port sequencer_monitor SEQ_VMON_ENA vmon_ena Input VRAILS
add_interface_port sequencer_monitor SEQ_RETRIES reg_retries Output 3
add_interface_port sequencer_monitor SEQ_TIMEOUTDLY reg_timeoutdly Output 3


# 
# connection point smb_alertn
# 
add_interface smb_alertn conduit end
set_interface_property smb_alertn associatedClock clock
set_interface_property smb_alertn associatedReset reset
set_interface_property smb_alertn ENABLED true
set_interface_property smb_alertn EXPORT_OF ""
set_interface_property smb_alertn PORT_NAME_MAP ""
set_interface_property smb_alertn CMSIS_SVD_VARIABLES ""
set_interface_property smb_alertn SVD_ADDRESS_GROUP ""

add_interface_port smb_alertn SMB_ALERTN smb_alertn Output 1


# +----------------------------------------------------------------------------
# | Elaboration callback
# +----------------------------------------------------------------------------
proc elaborate {} {
  set P_ADC_VREF   [get_parameter_value ADC_VREF]
  # Optionally enable the Retry Timeout
  if {[get_parameter_value RETRY_ATTEMPTS] > 0 } {
    # Make the RETRY_TIMEOUT parameter visible
    set_parameter_property RETRY_TIMEOUT VISIBLE true
  } else {
    # Make the PG parameters invisible
    set_parameter_property RETRY_TIMEOUT VISIBLE false
  }
  # Optionally disable the PMBus register interface
  if {[get_parameter_value FEATURE_LEVEL] == "0" } {
    set_port_property AVS_S0_READ termination true
    set_port_property AVS_S0_WRITE termination true
    set_port_property AVS_S0_ADDRESS termination true
    set_port_property AVS_S0_BYTEEN termination true
    set_port_property AVS_S0_READDATA termination true
    set_port_property AVS_S0_WRITEDATA termination true
    set_port_property AVS_S0_READ termination_value 0
    set_port_property AVS_S0_WRITE termination_value 0
    set_port_property AVS_S0_ADDRESS termination_value 0
    set_port_property AVS_S0_BYTEEN termination_value 0
    set_port_property AVS_S0_WRITEDATA termination_value 0
  }
  # Optionally enable the Power Good (PG) interface
  if {[get_parameter_value PG_NUM] > "0" } {
    add_interface_port vmon_conduit POWER_GOOD_IN power_good Input PG_NUM
  }
  # Calculate the derived voltage thresholds for informational purposes, back to the GUI
  set P_VIN_OVF [format "%.3f" [expr [get_parameter_value VIN_OVF] * [get_parameter_value VIN_TYP] / 100 ]]
  set_parameter_value DV_VIN_OVF $P_VIN_OVF
  if { $P_VIN_OVF > $P_ADC_VREF } {
    send_message {warning} "VIN Overvoltage fault threshold exceeds VREF_ADC!!!"
  }
  set P_VIN_OVW [format "%.3f" [expr [get_parameter_value VIN_OVW] * [get_parameter_value VIN_TYP] / 100 ]]
  set_parameter_value DV_VIN_OVW $P_VIN_OVW
  if { $P_VIN_OVW > $P_ADC_VREF } {
    send_message {warning} "VIN Overvoltage warning threshold exceeds VREF_ADC!!!"
  }
  set P_VIN_UVW [format "%.3f" [expr [get_parameter_value VIN_UVW] * [get_parameter_value VIN_TYP] / 100 ]]
  set_parameter_value DV_VIN_UVW $P_VIN_UVW
  if { $P_VIN_UVW > $P_ADC_VREF } {
    send_message {warning} "VIN Undervoltage fault threshold exceeds VREF_ADC!!!"
  }
  set P_VIN_ON  [format "%.3f" [expr [get_parameter_value VIN_ON ] * [get_parameter_value VIN_TYP] / 100 ]]
  set_parameter_value DV_VIN_ON  $P_VIN_ON
  if { $P_VIN_ON > $P_ADC_VREF } {
    send_message {warning} "VIN On threshold exceeds VREF_ADC!!!"
  }
  set P_VIN_UVF [format "%.3f" [expr [get_parameter_value VIN_UVF] * [get_parameter_value VIN_TYP] / 100 ]]
  set_parameter_value DV_VIN_UVF $P_VIN_UVF
  if { $P_VIN_UVF > $P_ADC_VREF } {
    send_message {warning} "VIN Undervoltage fault threshold exceeds VREF_ADC!!!"
  }
  set P_VIN_OFF [format "%.3f" [expr [get_parameter_value VIN_OFF] * [get_parameter_value VIN_TYP] / 100 ]]
  set_parameter_value DV_VIN_OFF $P_VIN_OFF
  if { $P_VIN_OFF > $P_ADC_VREF } {
    send_message {warning} "VIN Off threshold exceeds VREF_ADC!!!"
  }

  for { set idx 0 } { $idx < 143 } { incr idx } {
    # Display only the rails required for the system - first, disable all tabs
    set_display_item_property "VOUT${idx}" VISIBLE false
    if {$idx < [ get_parameter_value VRAILS ]} {
      # Display only the rails required for the system - next, enable the valid VOUT tabs 
      set_display_item_property "VOUT${idx}" VISIBLE true
      # Calculate the derived voltage thresholds for informational purposes, back to the GUI
      set TEMP_OVF [format "%.3f" [expr [get_parameter_value VOUT${idx}_OVF] * [get_parameter_value VOUT${idx}_TYP] / 100 ]]
      set_parameter_value DV_VOUT${idx}_OVF $TEMP_OVF
      if { $TEMP_OVF > $P_ADC_VREF } {
        send_message {warning} "VOUT${idx} Overvoltage fault threshold exceeds VREF_ADC!!!"
      }
      set TEMP_OVW [format "%.3f" [expr [get_parameter_value VOUT${idx}_OVW] * [get_parameter_value VOUT${idx}_TYP] / 100 ]]
      set_parameter_value DV_VOUT${idx}_OVW $TEMP_OVW
      if { $TEMP_OVW > $P_ADC_VREF } {
        send_message {warning} "VOUT${idx} Overvoltage warning threshold exceeds VREF_ADC!!!"
      }
      set TEMP_UVW [format "%.3f" [expr [get_parameter_value VOUT${idx}_UVW] * [get_parameter_value VOUT${idx}_TYP] / 100 ]]
      set_parameter_value DV_VOUT${idx}_UVW $TEMP_UVW
      if { $TEMP_UVW > $P_ADC_VREF } {
        send_message {warning} "VOUT${idx} Undervoltage threshold warning exceeds VREF_ADC!!!"
      }
      set TEMP_ON  [format "%.3f" [expr [get_parameter_value VOUT${idx}_ON ] * [get_parameter_value VOUT${idx}_TYP] / 100 ]]
      set_parameter_value DV_VOUT${idx}_ON  $TEMP_ON
      if { $TEMP_ON > $P_ADC_VREF } {
        send_message {warning} "VOUT${idx} Power Good assertion threshold exceeds VREF_ADC!!!"
      }
      set TEMP_UVF [format "%.3f" [expr [get_parameter_value VOUT${idx}_UVF] * [get_parameter_value VOUT${idx}_TYP] / 100 ]]
      set_parameter_value DV_VOUT${idx}_UVF $TEMP_UVF
      if { $TEMP_UVF > $P_ADC_VREF } {
        send_message {warning} "VOUT${idx} Undervoltage fault threshold exceeds VREF_ADC!!!"
      }
      set TEMP_OFF [format "%.3f" [expr [get_parameter_value VOUT${idx}_OFF] * [get_parameter_value VOUT${idx}_TYP] / 100 ]]
      set_parameter_value DV_VOUT${idx}_OFF $TEMP_OFF
      if { $TEMP_OFF > $P_ADC_VREF } {
        send_message {warning} "VOUT${idx} Power good deassertion threshold exceeds VREF_ADC!!!"
      }
    }
  }
}

# +----------------------------------------------------------------------------
# | Generation callback routine:
# |   This process creates the package of parameters for the voltage monitor,
# |   and adds it as well as all sub-blocks to the project.
# +----------------------------------------------------------------------------
proc generate { entity_name } {
  # Calculate the various thresholds for the voltage comparator logic on VIN and VOUT rails,
  #   storing as hexadecimal values.
  set P_FEATURE_LEVEL  [get_parameter_value FEATURE_LEVEL]
  set P_RETRY_ATTEMPTS [get_parameter_value RETRY_ATTEMPTS]
  set P_RETRY_TIMEOUT  [get_parameter_value RETRY_TIMEOUT]
  set P_SAMPLES  [get_parameter_value ADC_SAMPLES]
  set P_VRAILS   [get_parameter_value VRAILS]
  set P_VRAILSm1 [expr [ get_parameter_value VRAILS ] -1 ]
  set P_VIN_OVF  [format "%X" [expr int([get_parameter_value VIN_OVF] * [get_parameter_value VIN_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
  set P_VIN_OVW  [format "%X" [expr int([get_parameter_value VIN_OVW] * [get_parameter_value VIN_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
  set P_VIN_UVW  [format "%X" [expr int([get_parameter_value VIN_UVW] * [get_parameter_value VIN_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
  set P_VIN_ON   [format "%X" [expr int([get_parameter_value VIN_ON ] * [get_parameter_value VIN_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
  set P_VIN_UVF  [format "%X" [expr int([get_parameter_value VIN_UVF] * [get_parameter_value VIN_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
  set P_VIN_OFF  [format "%X" [expr int([get_parameter_value VIN_OFF] * [get_parameter_value VIN_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
  if { [ get_parameter_value VIN_OVRSP ] == true } {set P_VIN_OVRSP "80"} else {set P_VIN_OVRSP "00"}
  if { [ get_parameter_value VIN_UVRSP ] == true } {set P_VIN_UVRSP "80"} else {set P_VIN_UVRSP "00"}
  # Initialize all of the variables used to store parameter values to NULL
  set P_VOUT_OVF   ""
  set P_VOUT_OVW   ""
  set P_VOUT_UVW   ""
  set P_VOUT_ON    ""
  set P_VOUT_UVF   ""
  set P_VOUT_OFF   ""
  set P_VOUT_OVRSP ""
  set P_VOUT_UVRSP ""
  # Loop through the VOUT rails, calculating the parameter values and appending them to the vector
  for { set idx 0 } { $idx < [get_parameter_value VRAILS] } { incr idx } {
    append P_VOUT_OVF [format "12'h%X" [expr int([get_parameter_value VOUT${idx}_OVF] * [get_parameter_value VOUT${idx}_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
    append P_VOUT_OVW [format "12'h%X" [expr int([get_parameter_value VOUT${idx}_OVW] * [get_parameter_value VOUT${idx}_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
    append P_VOUT_UVW [format "12'h%X" [expr int([get_parameter_value VOUT${idx}_UVW] * [get_parameter_value VOUT${idx}_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
    append P_VOUT_ON  [format "12'h%X" [expr int([get_parameter_value VOUT${idx}_ON ] * [get_parameter_value VOUT${idx}_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
    append P_VOUT_UVF [format "12'h%X" [expr int([get_parameter_value VOUT${idx}_UVF] * [get_parameter_value VOUT${idx}_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
    append P_VOUT_OFF [format "12'h%X" [expr int([get_parameter_value VOUT${idx}_OFF] * [get_parameter_value VOUT${idx}_TYP] * 4096 / 100 / [get_parameter_value ADC_VREF])]]
    if { [ get_parameter_value VOUT${idx}_OVRSP ] == true } {append P_VOUT_OVRSP "8'h80"} else {append P_VOUT_OVRSP "8'h00"}
    if { [ get_parameter_value VOUT${idx}_UVRSP ] == true } {append P_VOUT_UVRSP "8'h80"} else {append P_VOUT_UVRSP "8'h00"}
    if { $idx != [expr [ get_parameter_value VRAILS ] -1 ] } {
      append P_VOUT_OVF   ", "
      append P_VOUT_OVW   ", "
      append P_VOUT_UVW   ", "
      append P_VOUT_ON    ", "
      append P_VOUT_UVF   ", "
      append P_VOUT_OFF   ", "
      append P_VOUT_OVRSP ", "
      append P_VOUT_UVRSP ", "
    }
  }

  # Create a file descriptor to a temporary file that will contain the parameters used by the MegaWizard.
#  set output_dir [create_temp_file ""]
#  set vmon_pkg_file_path [file join $output_dir "sequencer_vmon_pkg.sv"]
  set vmon_pkg_file_path "sequencer_vmon_pkg.sv"
  set f_handle [open $vmon_pkg_file_path w+]
  # Generate the package file with the various constants for the Voltage Monitor
  puts $f_handle "
////////////////////////////////////////////////////////////////////////////////////
//
// Module: sequencer_vmon_pkg.sv
//
// Description: This module contains the parameters for the voltage monitor
//
////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019 Intel Corporation
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the \"Software\"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////////
//
// Current Assumptions/Limitations:
//
////////////////////////////////////////////////////////////////////////////////////

package sequencer_vmon_pkg;
  // Specifies the level of functionality that the voltage monitor logic should provide:
  //   0: No PMBus support
  //   1: Hard-coded thresholds for all voltage level commands
  //   2: Full-featured
  localparam int P_MONITOR_FUNCT_LEVEL    = $P_FEATURE_LEVEL;
  // The number of attempts the sequencer should make to come up, after detecting an error condition.
  localparam bit \[2:0\] P_RETRY_ATTEMPTS   = $P_RETRY_ATTEMPTS;
  // The amount of time the sequencer should wait between retry attempts.  NOTE: This is an encoded
  //   value that indexes the delay specified in the \"P_RESTARTDLY\" parameter in sequencer_params_pkg.sv.
  localparam bit \[2:0\] P_RETRY_TIMEOUT    = $P_RETRY_TIMEOUT;"

  if {$P_FEATURE_LEVEL == 0} { 
    puts $f_handle "
  `define DISABLE_PMBUS"
  }

  puts $f_handle "
  // Number of samples the monitor should observe before declaring a warning or fault.  This
  //   essentially debounces any glitches that could potentially occur on a monitored input.
  localparam int P_SAMPLES                = $P_SAMPLES;

  ////////////////////////////////////////////////////////////////////////////////////
  //
  //      ********** DEFAULT VOLTAGE THRESHOLDS FOR SEQUENCING **********
  //
  ////////////////////////////////////////////////////////////////////////////////////
  // All data for the output voltage and output voltage related parameters will be
  //   stored in the DIRECT format.  Coefficients will be determined by the user, are
  //   specific to each voltage rail for every page, and are based upon the voltage
  //   scaling resistors used in the design.  Please refer to user guide for further
  //   detail on calculating these values.
  ////////////////////////////////////////////////////////////////////////////////////
  //
  // Level at which VIN is too low for use
  localparam bit \[11:0\] P_VIN_OFF                    = 12'h$P_VIN_OFF; 
  // Level at which VIN is determined to be good for use
  localparam bit \[11:0\] P_VIN_UV_FAULT_LIMIT         = 12'h$P_VIN_UVF; 
  // Limit at which an undervoltage fault will be reported on VIN
  localparam bit \[11:0\] P_VIN_ON                     = 12'h$P_VIN_ON; 
  // Limit at which an undervoltage warning will be reported on VIN
  localparam bit \[11:0\] P_VIN_UV_WARN_LIMIT          = 12'h$P_VIN_UVW;
  // Limit at which an overvoltage warning will be reported on VIN
  localparam bit \[11:0\] P_VIN_OV_WARN_LIMIT          = 12'h$P_VIN_OVW;
  // Limit at which an overvoltage fault will be reported on VIN
  localparam bit \[11:0\] P_VIN_OV_FAULT_LIMIT         = 12'h$P_VIN_OVF;
  // Fault response for an undervoltage event on VIN
  localparam bit  \[7:0\] P_VIN_UV_FAULT_RESP          = 8'h$P_VIN_UVRSP;
  // Fault response for an overvoltage event on VIN
  localparam bit  \[7:0\] P_VIN_OV_FAULT_RESP          = 8'h$P_VIN_OVRSP;
  // Level at which VOUT is so low, that POWER_GOOD should be deasserted
  localparam bit \[11:0\] P_POWER_GOOD_OFF \[0:$P_VRAILSm1\]      = '{$P_VOUT_OFF};
  // Level at which VOUT is sufficiently high to assert POWER_GOOD
  localparam bit \[11:0\] P_VOUT_UV_FAULT_LIMIT \[0:$P_VRAILSm1\] = '{$P_VOUT_UVF};
  // Limit at which an undervoltage fault will be reported on VOUT
  localparam bit \[11:0\] P_POWER_GOOD_ON \[0:$P_VRAILSm1\]       = '{$P_VOUT_ON};
  // Limit at which an undervoltage warning will be reported on VOUT
  localparam bit \[11:0\] P_VOUT_UV_WARN_LIMIT \[0:$P_VRAILSm1\]  = '{$P_VOUT_UVW};
  // Limit at which an overvoltage warning will be reported on VOUT
  localparam bit \[11:0\] P_VOUT_OV_WARN_LIMIT \[0:$P_VRAILSm1\]  = '{$P_VOUT_OVW};
  // Limit at which an overvoltage fault will be reported on VOUT
  localparam bit \[11:0\] P_VOUT_OV_FAULT_LIMIT \[0:$P_VRAILSm1\] = '{$P_VOUT_OVF};
  // Fault response for an undervoltage event on VOUT
  //   Valid settings:
  //      0x00: The sequencer continues operation without interruption.
  //      0x80: The sequencer sequences all rails down in the presence of an undervoltage fault.
  localparam bit  \[7:0\] P_VOUT_UV_FAULT_RESP \[0:$P_VRAILSm1\]  = '{$P_VOUT_UVRSP};
  // Fault response for an overvoltage event on VOUT
  //   Valid settings:
  //      0x00: The sequencer continues operation without interruption.
  //      0x80: The sequencer sequences all rails down in the presence of an overvoltage fault.
  localparam bit  \[7:0\] P_VOUT_OV_FAULT_RESP \[0:$P_VRAILSm1\]  = '{$P_VOUT_OVRSP};
  
  ////////////////////////////////////////////////////////////////////////////////////
  //
  //    ********** DO NOT MODIFY ANY OF THE SETTINGS BELOW THIS LINE **********
  //
  ////////////////////////////////////////////////////////////////////////////////////
  
  // What is the number of supported PMBus Commands
  localparam integer   P_NUMBER_COMMANDS         = 26;
  // Supported PMBus Commands
  localparam bit \[7:0\] P_CMD_PAGE                = 8'h00;
  localparam bit \[7:0\] P_CMD_CLEAR_FAULTS        = 8'h03;
  localparam bit \[7:0\] P_CMD_VIN_ON              = 8'h35;
  localparam bit \[7:0\] P_CMD_VIN_OFF             = 8'h36;
  localparam bit \[7:0\] P_CMD_VOUT_OV_FAULT_LIMIT = 8'h40;
  localparam bit \[7:0\] P_CMD_VOUT_OV_FAULT_RESP  = 8'h41;
  localparam bit \[7:0\] P_CMD_VOUT_OV_WARN_LIMIT  = 8'h42;
  localparam bit \[7:0\] P_CMD_VOUT_UV_WARN_LIMIT  = 8'h43;
  localparam bit \[7:0\] P_CMD_VOUT_UV_FAULT_LIMIT = 8'h44;
  localparam bit \[7:0\] P_CMD_VOUT_UV_FAULT_RESP  = 8'h45;
  localparam bit \[7:0\] P_CMD_VIN_OV_FAULT_LIMIT  = 8'h55;
  localparam bit \[7:0\] P_CMD_VIN_OV_FAULT_RESP   = 8'h56;
  localparam bit \[7:0\] P_CMD_VIN_OV_WARN_LIMIT   = 8'h57;
  localparam bit \[7:0\] P_CMD_VIN_UV_WARN_LIMIT   = 8'h58;
  localparam bit \[7:0\] P_CMD_VIN_UV_FAULT_LIMIT  = 8'h59;
  localparam bit \[7:0\] P_CMD_VIN_UV_FAULT_RESP   = 8'h5A;
  localparam bit \[7:0\] P_CMD_POWER_GOOD_ON       = 8'h5E;
  localparam bit \[7:0\] P_CMD_POWER_GOOD_OFF      = 8'h5F;
  localparam bit \[7:0\] P_CMD_STATUS_BYTE         = 8'h78;
  localparam bit \[7:0\] P_CMD_STATUS_WORD         = 8'h79;
  localparam bit \[7:0\] P_CMD_STATUS_VOUT         = 8'h7A;
  localparam bit \[7:0\] P_CMD_STATUS_INPUT        = 8'h7C;
  localparam bit \[7:0\] P_CMD_STATUS_CML          = 8'h7E;
  localparam bit \[7:0\] P_CMD_STATUS_OTHER        = 8'h7F;
  localparam bit \[7:0\] P_CMD_READ_VIN            = 8'h88;
  localparam bit \[7:0\] P_CMD_READ_VOUT           = 8'h8B;
  
  // This structure is used by the command decode logic
  typedef struct packed
  {
    bit \[7:0\]  command;   // 16-bit opcode, enumerated type
    bit        enable;    // enable or disable command usage
    bit        multipage; // '0' = global, '1' = multi-page
    bit \[$P_VRAILSm1:0\] select;    // register select lines (one per page). For global accesses, only bit 0 is used.
  } command_struct_t;
endpackage
"
  close $f_handle
  # Add the IP file generated above to the fileset for the Voltage Monitor
  add_fileset_file sequencer_vmon_pkg.sv SYSTEM_VERILOG PATH $vmon_pkg_file_path
  add_fileset_file sequencer_vmondecode_pkg.sv SYSTEM_VERILOG PATH sequencer_vmondecode_pkg.sv
  add_fileset_file reg_ro.sv SYSTEM_VERILOG PATH reg_ro.sv
  add_fileset_file reg_rw.sv SYSTEM_VERILOG PATH reg_rw.sv
  add_fileset_file reg_rw_bounds.sv SYSTEM_VERILOG PATH reg_rw_page.sv
  add_fileset_file reg_wtc.sv SYSTEM_VERILOG PATH reg_wtc.sv
  add_fileset_file sequencer_vmonregs.sv SYSTEM_VERILOG PATH sequencer_vmonregs.sv TOP_LEVEL_FILE
}
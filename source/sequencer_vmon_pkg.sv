
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
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
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
  localparam int P_MONITOR_FUNCT_LEVEL    = 2;
  // The number of attempts the sequencer should make to come up, after detecting an error condition.
  localparam bit [2:0] P_RETRY_ATTEMPTS   = 3;
  // The amount of time the sequencer should wait between retry attempts.  NOTE: This is an encoded
  //   value that indexes the delay specified in the "P_RESTARTDLY" parameter in sequencer_params_pkg.sv.
  localparam bit [2:0] P_RETRY_TIMEOUT    = 1;

  // Number of samples the monitor should observe before declaring a warning or fault.  This
  //   essentially debounces any glitches that could potentially occur on a monitored input.
  localparam int P_SAMPLES                = 5;

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
  localparam bit [11:0] P_VIN_OFF                    = 12'h98B; 
  // Level at which VIN is determined to be good for use
  localparam bit [11:0] P_VIN_UV_FAULT_LIMIT         = 12'h9DD; 
  // Limit at which an undervoltage fault will be reported on VIN
  localparam bit [11:0] P_VIN_ON                     = 12'hA13; 
  // Limit at which an undervoltage warning will be reported on VIN
  localparam bit [11:0] P_VIN_UV_WARN_LIMIT          = 12'hA49;
  // Limit at which an overvoltage warning will be reported on VIN
  localparam bit [11:0] P_VIN_OV_WARN_LIMIT          = 12'hB23;
  // Limit at which an overvoltage fault will be reported on VIN
  localparam bit [11:0] P_VIN_OV_FAULT_LIMIT         = 12'hB59;
  // Fault response for an undervoltage event on VIN
  localparam bit  [7:0] P_VIN_UV_FAULT_RESP          = 8'h80;
  // Fault response for an overvoltage event on VIN
  localparam bit  [7:0] P_VIN_OV_FAULT_RESP          = 8'h80;
  // Level at which VOUT is so low, that POWER_GOOD should be deasserted
  localparam bit [11:0] P_POWER_GOOD_OFF [0:5]      = '{12'h378, 12'h372, 12'h372, 12'h377, 12'h374, 12'h378};
  // Level at which VOUT is sufficiently high to assert POWER_GOOD
  localparam bit [11:0] P_VOUT_UV_FAULT_LIMIT [0:5] = '{12'h396, 12'h390, 12'h390, 12'h394, 12'h391, 12'h396};
  // Limit at which an undervoltage fault will be reported on VOUT
  localparam bit [11:0] P_POWER_GOOD_ON [0:5]       = '{12'h3AA, 12'h3A3, 12'h3A3, 12'h3A8, 12'h3A5, 12'h3AA};
  // Limit at which an undervoltage warning will be reported on VOUT
  localparam bit [11:0] P_VOUT_UV_WARN_LIMIT [0:5]  = '{12'h3BD, 12'h3B7, 12'h3B7, 12'h3BC, 12'h3B8, 12'h3BD};
  // Limit at which an overvoltage warning will be reported on VOUT
  localparam bit [11:0] P_VOUT_OV_WARN_LIMIT [0:5]  = '{12'h40C, 12'h405, 12'h405, 12'h40B, 12'h407, 12'h40C};
  // Limit at which an overvoltage fault will be reported on VOUT
  localparam bit [11:0] P_VOUT_OV_FAULT_LIMIT [0:5] = '{12'h420, 12'h419, 12'h419, 12'h41E, 12'h41B, 12'h420};
  // Fault response for an undervoltage event on VOUT
  //   Valid settings:
  //      0x00: The sequencer continues operation without interruption.
  //      0x80: The sequencer sequences all rails down in the presence of an undervoltage fault.
  localparam bit  [7:0] P_VOUT_UV_FAULT_RESP [0:5]  = '{8'h80, 8'h80, 8'h80, 8'h80, 8'h80, 8'h80};
  // Fault response for an overvoltage event on VOUT
  //   Valid settings:
  //      0x00: The sequencer continues operation without interruption.
  //      0x80: The sequencer sequences all rails down in the presence of an overvoltage fault.
  localparam bit  [7:0] P_VOUT_OV_FAULT_RESP [0:5]  = '{8'h80, 8'h80, 8'h80, 8'h80, 8'h80, 8'h80};
  
  ////////////////////////////////////////////////////////////////////////////////////
  //
  //    ********** DO NOT MODIFY ANY OF THE SETTINGS BELOW THIS LINE **********
  //
  ////////////////////////////////////////////////////////////////////////////////////
  
  // What is the number of supported PMBus Commands
  localparam integer   P_NUMBER_COMMANDS         = 26;
  // Supported PMBus Commands
  localparam bit [7:0] P_CMD_PAGE                = 8'h00;
  localparam bit [7:0] P_CMD_CLEAR_FAULTS        = 8'h03;
  localparam bit [7:0] P_CMD_VIN_ON              = 8'h35;
  localparam bit [7:0] P_CMD_VIN_OFF             = 8'h36;
  localparam bit [7:0] P_CMD_VOUT_OV_FAULT_LIMIT = 8'h40;
  localparam bit [7:0] P_CMD_VOUT_OV_FAULT_RESP  = 8'h41;
  localparam bit [7:0] P_CMD_VOUT_OV_WARN_LIMIT  = 8'h42;
  localparam bit [7:0] P_CMD_VOUT_UV_WARN_LIMIT  = 8'h43;
  localparam bit [7:0] P_CMD_VOUT_UV_FAULT_LIMIT = 8'h44;
  localparam bit [7:0] P_CMD_VOUT_UV_FAULT_RESP  = 8'h45;
  localparam bit [7:0] P_CMD_VIN_OV_FAULT_LIMIT  = 8'h55;
  localparam bit [7:0] P_CMD_VIN_OV_FAULT_RESP   = 8'h56;
  localparam bit [7:0] P_CMD_VIN_OV_WARN_LIMIT   = 8'h57;
  localparam bit [7:0] P_CMD_VIN_UV_WARN_LIMIT   = 8'h58;
  localparam bit [7:0] P_CMD_VIN_UV_FAULT_LIMIT  = 8'h59;
  localparam bit [7:0] P_CMD_VIN_UV_FAULT_RESP   = 8'h5A;
  localparam bit [7:0] P_CMD_POWER_GOOD_ON       = 8'h5E;
  localparam bit [7:0] P_CMD_POWER_GOOD_OFF      = 8'h5F;
  localparam bit [7:0] P_CMD_STATUS_BYTE         = 8'h78;
  localparam bit [7:0] P_CMD_STATUS_WORD         = 8'h79;
  localparam bit [7:0] P_CMD_STATUS_VOUT         = 8'h7A;
  localparam bit [7:0] P_CMD_STATUS_INPUT        = 8'h7C;
  localparam bit [7:0] P_CMD_STATUS_CML          = 8'h7E;
  localparam bit [7:0] P_CMD_STATUS_OTHER        = 8'h7F;
  localparam bit [7:0] P_CMD_READ_VIN            = 8'h88;
  localparam bit [7:0] P_CMD_READ_VOUT           = 8'h8B;
  
  // This structure is used by the command decode logic
  typedef struct packed
  {
    bit [7:0]  command;   // 16-bit opcode, enumerated type
    bit        enable;    // enable or disable command usage
    bit        multipage; // '0' = global, '1' = multi-page
    bit [5:0] select;    // register select lines (one per page). For global accesses, only bit 0 is used.
  } command_struct_t;
endpackage


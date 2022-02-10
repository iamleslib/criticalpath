# criticalpath
ECE 474 Assignment 1

Team Members: Sean Farris
              Dario Salinas
              Leslie Ibarra

Vivado Synthesis 2018.2
Vivado Syntesis 2019.1

Target FPGA : xc7a100tcsg324-1
Speed Grade : -1

Description:
We used the Vivado synthesis tool to synthesize each datapath component using varying bit-widths (2, 8, 16, 32, 64), and found the critical path for each component by analyzing the Report Timing Summary. After finding the latency for a each component, we summed the corresponding datapath components with the required bit-width and obtained an estimated critical path for each provided behavioral netlist.

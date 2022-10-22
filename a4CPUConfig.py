import os

import m5
from m5.objects import *

from m5.util import addToPath, fatal
m5.util.addToPath('/home/other/CSE530-FA2022/gem5')

# Add the common scripts to our path
m5.util.addToPath('/home/other/CSE530-FA2022/gem5/configs')
from common import Simulation
from caches import *

import a4O3CPUConfig

def createCPU(options, processes, system):
    CPUClass = DerivO3CPU
    CPUClass.numThreads = 1

    # There is no fast forwarding or switching
    cpu = CPUClass(cpu_id=0)
    system.cpu = cpu
    options.cse530_num_regs= 256

    # CPU configurations - extremes.
    if options.cse530_core_config==1:
        options.cse530_issue_width = 8
        options.branch_predictor = "ltage"
        options.cse530_num_robs= 192
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==2:
        options.cse530_issue_width = 2
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==3:
        options.cse530_issue_width = 4
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==4:
        options.cse530_issue_width = 6
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==5:
        options.cse530_issue_width = 8
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==6:
        options.cse530_issue_width = 2
        options.branch_predictor = "tournament"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==7:
        options.cse530_issue_width = 2
        options.branch_predictor = "bimode"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==8:
        options.cse530_issue_width = 2
        options.branch_predictor = "ltage"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==9:
        options.cse530_issue_width = 2
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 60
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==10:
        options.cse530_issue_width = 2
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 104
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==11:
        options.cse530_issue_width = 2
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 148
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==12:
        options.cse530_issue_width = 2
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 196
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==13:
        options.cse530_issue_width = 2
        options.branch_predictor = "ltage"
        options.cse530_num_robs= 196
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==14:
        options.cse530_issue_width = 8
        options.branch_predictor = "ltage"
        options.cse530_num_robs= 16
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    elif options.cse530_core_config==15:
        options.cse530_issue_width = 8
        options.branch_predictor = "2bit"
        options.cse530_num_robs= 196
        a4O3CPUConfig.initializeO3CPU(options, cpu)
    else:
        raise ValueError("Unsupported cpu class.")

    # create the interrupt controller for the CPU
    system.cpu.createInterruptController()
    
    # For x86 only, make sure the interrupts are connected to the memory
    # Note: these are directly connected to the memory bus and are not cached
    system.cpu.interrupts[0].pio = system.membus.mem_side_ports
    system.cpu.interrupts[0].int_requestor = system.membus.cpu_side_ports
    system.cpu.interrupts[0].int_responder = system.membus.mem_side_ports

    # Set the workload for normal CPUs.
    system.workload = SEWorkload.init_compatible(options.binfile)
    system.cpu.workload = processes
    system.cpu.createThreads()

    # Create an L1 instruction and data cache
    system.cpu.icache = L1ICache(options)
    system.cpu.dcache = L1DCache(options)
    
    # Connect the instruction and data caches to the CPU
    system.cpu.icache.connectCPU(system.cpu)
    system.cpu.dcache.connectCPU(system.cpu)
    
    # Create a memory bus, a coherent crossbar, in this case
    system.l2bus = L2XBar()
    
    # Hook the CPU ports up to the l2bus
    system.cpu.icache.connectBus(system.l2bus)
    system.cpu.dcache.connectBus(system.l2bus)
    
    # Create an L2 cache and connect it to the l2bus
    system.l2cache = L2Cache(options)
    system.l2cache.connectCPUSideBus(system.l2bus)

    # Connect the L2 cache to the membus
    system.l2cache.connectMemSideBus(system.membus)

    # # Set up TLB options.
    # for cpu in cpus:
    #     dtb = cpu.dtb
    #     if isinstance(dtb, X86TLB):
    #         dtb.size = options.l1tlb_size
    #         dtb.assoc = options.l1tlb_assoc
    #         dtb.l2size = options.l2tlb_size
    #         dtb.l2assoc = options.l2tlb_assoc
    #         dtb.l2_lat = options.l2tlb_hit_lat
    #         dtb.walker_se_lat = options.walker_se_lat
    #         dtb.walker_se_port = options.walker_se_port
    #         dtb.timing_se = options.tlb_timing_se

    return system

###########################################################################################################
# @Name 		data_path_toolkit_gui.tcl
#
# @Brief		Setup the GUI, including base tab and config tab for displaying within the system console.
#
# @Functions	setup_all
#
# @Author		Yifeng Wang (yifenwan@phys.ethz.ch)
# @Date			Oct 22, 2024
# @Version		1.0 (file created)
#				
#
###########################################################################################################

package require mu3e::helpers 1.0
package require lvds_rx::bsp 24.0
package require frame_deassembly::bsp 24.0
package require histogram_statistics::bsp 24.0
package require mutrig_injector::bsp 24.0
package require mts_processor::bsp 24.0
package require ring_buffer_cam::bsp 24.0
package require feb_frame_assembly::bsp 24.0
package require tdom

package provide data_path_bts::gui 1.0

namespace eval ::data_path_bts::gui:: {
	namespace export \
	setup_all
    
    
}

proc ::data_path_bts::gui::setup_all {n_asic n_lane} {
    toolkit_add 			Tab0 			tabbedGroup 		self
	###########################################################
	#  ____           _____ _____ _____   _______       ____  #
	# |  _ \   /\    / ____|_   _/ ____| |__   __|/\   |  _ \ #
	# | |_) | /  \  | (___   | || |         | |  /  \  | |_) |#
	# |  _ < / /\ \  \___ \  | || |         | | / /\ \ |  _ < #
	# | |_) / ____ \ ____) |_| || |____     | |/ ____ \| |_) |#
	# |____/_/    \_\_____/|_____\_____|    |_/_/    \_\____/ #
	#                                                         # 
	########################################################### 
	toolkit_add 			"baseGroup" 	group 				Tab0	
	toolkit_set_property 	"baseGroup" 	title 				"Setup Connections"
	toolkit_set_property 	"baseGroup" 	itemsPerRow 		1
	
	::mu3e::helpers::setup_base_group "baseGroup"
    
    #################################################################################################################
	#   _____ _       _           _   __      __        _       _     _         _______       ____  _      ______   #
	#  / ____| |     | |         | |  \ \    / /       (_)     | |   | |       |__   __|/\   |  _ \| |    |  ____|  #
	# | |  __| | ___ | |__   __ _| |   \ \  / /_ _ _ __ _  __ _| |__ | | ___      | |  /  \  | |_) | |    | |__     #
	# | | |_ | |/ _ \| '_ \ / _` | |    \ \/ / _` | '__| |/ _` | '_ \| |/ _ \     | | / /\ \ |  _ <| |    |  __|    #
	# | |__| | | (_) | |_) | (_| | |     \  / (_| | |  | | (_| | |_) | |  __/     | |/ ____ \| |_) | |____| |____   #
	#  \_____|_|\___/|_.__/ \__,_|_|      \/ \__,_|_|  |_|\__,_|_.__/|_|\___|     |_/_/    \_\____/|______|______|  #
	#                                                                                                               #
	#################################################################################################################
	variable fd_global_variable "globalVariableTable"
	::mu3e::helpers::init_global_variable  $fd_global_variable
	::mu3e::helpers::append_global_variable $fd_global_variable "n_asic" $n_asic
	#::mu3e::helpers::append_global_variable $fd_global_variable "doc_xml" "empty..."
	::mu3e::helpers::append_global_variable $fd_global_variable "slaves" [list "lvds_rx_controller_pro.csr" \
    "mutrig_frame_deassembly.csr" "counter_avmm.avmm_counter_value" "histogram_statistics.csr" "histogram_statistics.hist_bin" \
    "mutrig_injector.csr" "mts_preprocessor.csr" "ring_buffer_cam.csr" "feb_frame_assembly.csr"]
	::mu3e::helpers::append_global_variable $fd_global_variable "lvds_rx_controller_pro.csr_base_address" 0x0
	::mu3e::helpers::append_global_variable $fd_global_variable "lvds_rx_controller_pro.csr_encountered" 0
	::mu3e::helpers::append_global_variable $fd_global_variable "mutrig_frame_deassembly.csr_base_address" 0x0
	::mu3e::helpers::append_global_variable $fd_global_variable "mutrig_frame_deassembly.csr_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "mutrig_frame_deassembly.csr_copies" 8
    ::mu3e::helpers::append_global_variable $fd_global_variable "counter_avmm.avmm_counter_value_base_address" 0x0
	::mu3e::helpers::append_global_variable $fd_global_variable "counter_avmm.avmm_counter_value_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "counter_avmm.avmm_counter_value_copies" 8
    ::mu3e::helpers::append_global_variable $fd_global_variable "histogram_statistics.csr_base_address" 0x0
    ::mu3e::helpers::append_global_variable $fd_global_variable "histogram_statistics.csr_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "histogram_statistics.hist_bin_base_address" 0x0
    ::mu3e::helpers::append_global_variable $fd_global_variable "histogram_statistics.hist_bin_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "mutrig_injector.csr_base_address" 0x0
    ::mu3e::helpers::append_global_variable $fd_global_variable "mutrig_injector.csr_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "mts_preprocessor.csr_base_address" 0x0
    ::mu3e::helpers::append_global_variable $fd_global_variable "mts_preprocessor.csr_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "mts_preprocessor.csr_copies" 2
    ::mu3e::helpers::append_global_variable $fd_global_variable "ring_buffer_cam.csr_base_address" 0x0
    ::mu3e::helpers::append_global_variable $fd_global_variable "ring_buffer_cam.csr_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "ring_buffer_cam.csr_copies" 8
    ::mu3e::helpers::append_global_variable $fd_global_variable "feb_frame_assembly.csr_base_address" 0x0
    ::mu3e::helpers::append_global_variable $fd_global_variable "feb_frame_assembly.csr_encountered" 0
    ::mu3e::helpers::append_global_variable $fd_global_variable "feb_frame_assembly.csr_copies" 2
    
    ::mu3e::helpers::append_global_variable $fd_global_variable "lvds_doc_xml" "empty"
    ::mu3e::helpers::append_global_variable $fd_global_variable "frame_deassembly_doc_xml" "empty"
    ::mu3e::helpers::append_global_variable $fd_global_variable "mutrig_injector_doc_xml" "empty"
    ::mu3e::helpers::append_global_variable $fd_global_variable "hist_barChart_name" "hist_barChart"
    ::mu3e::helpers::append_global_variable $fd_global_variable "hist_regpack" 0
    
    #::mu3e::helpers::append_global_variable $fd_global_variable "histogram_statistics_doc_xml" "empty"
	toolkit_set_property	"globalVariableTable" visible 1
    
    
    # ////////////////////////////////// lvds tab ///////////////////////////////////////////
    # - lvds tab 
    toolkit_add 			"lvdsTab" 	group 				Tab0	
	toolkit_set_property 	"lvdsTab" 	title 				"LVDS"
	toolkit_set_property 	"lvdsTab" 	itemsPerRow 		2
    # -- lvds group
    toolkit_add 			"lvdsGroup" 	group 				"lvdsTab"	
	toolkit_set_property 	"lvdsGroup" 	title 				"IP Setting"
	toolkit_set_property 	"lvdsGroup" 	itemsPerRow 		2
    # --- lvds group content
    ::data_path_bts::gui::setup_lvds "lvdsGroup" $n_lane
    # -- control panel group
    toolkit_add 			"lvdsCtrlGroup" 	group 				"lvdsTab"
	toolkit_set_property 	"lvdsCtrlGroup" 	title 				"Control Panel"
	toolkit_set_property 	"lvdsCtrlGroup" 	itemsPerRow 		1
    # --- control panel content
    ::data_path_bts::gui::setup_lvds_controlPanel "lvdsCtrlGroup" $n_lane
    # /////////////////////////////////////////////////////////////////////////////
    
    
    
    # ////////////////////////////////// frame deassembly tab ///////////////////////////////////////////
    variable deassembly_monitor_fd ""
    set n_deassembly [::mu3e::helpers::get_global_variable $fd_global_variable "mutrig_frame_deassembly.csr_copies"]
    # - frame deassembly tab
    toolkit_add 			"deassemblyTab" 	group 				Tab0	
	toolkit_set_property 	"deassemblyTab" 	title 				"Frame Deassembly"
	toolkit_set_property 	"deassemblyTab" 	itemsPerRow 		2
    
    
    
    # -- control panel group
    toolkit_add 			"deassemblyCtrlGroup" 	group 				"deassemblyTab"
	toolkit_set_property 	"deassemblyCtrlGroup" 	title 				"Control Panel"
	toolkit_set_property 	"deassemblyCtrlGroup" 	itemsPerRow 		1
    

    # -- deassembly register values 
    toolkit_add 			"deassemblyGroup" 	group 				"deassemblyTab"
    toolkit_set_property 	"deassemblyGroup" 	itemsPerRow 		2
    set baseGroupNames [list]
    for {set i 0} {$i < $n_deassembly} {incr i} {
        # -- deassembly group
        lappend baseGroupNames "deassemblyGroup$i"
        toolkit_add 			"deassemblyGroup$i" 	group 				"deassemblyGroup"
        toolkit_set_property 	"deassemblyGroup$i" 	title 				"IP index $i"
        toolkit_set_property 	"deassemblyGroup$i" 	itemsPerRow 		1
        ::data_path_bts::gui::bsp2gui_setup  "frame_deassembly" deassemblyGroup${i} 1 [list]
        #::data_path_bts::gui::setup_deassembly "deassemblyGroup$i"
    }
    
    
    # -- control panel content
    toolkit_add             "deassemblyRead_button" button       "deassemblyCtrlGroup"
    toolkit_set_property    "deassemblyRead_button" text         "read"
    toolkit_set_property    "deassemblyRead_button" onClick      {::data_path_bts::gui::device2gui "frame_deassembly" "deassemblyGroup" "mutrig_frame_deassembly.csr" } 
    #::data_path_bts::gui::setup_deassembly_controlPanel "deassemblyCtrlGroup" 
    # /////////////////////////////////////////////////////////////////////////////
    
    
    # //////////////////////////////////// rate tab /////////////////////////////////////////
    # - rate tab
    toolkit_add 			"rateTab" 	group 				Tab0	
	toolkit_set_property 	"rateTab" 	title 				"Rate"
	toolkit_set_property 	"rateTab" 	itemsPerRow 		2
    # -- control panel 
    variable rate_monitor_fd ""
    toolkit_add 			"rateCtrlGroup" 	group 		"rateTab"
	toolkit_set_property	"rateCtrlGroup"	    expandableX	false
	toolkit_set_property	"rateCtrlGroup"	    expandableY	false
	toolkit_set_property	"rateCtrlGroup"	    itemsPerRow 1
	toolkit_set_property	"rateCtrlGroup" 	title		"Control Panel"
    toolkit_add             "rateCtrl_checkBox"     checkBox      "rateCtrlGroup"
    toolkit_set_property    "rateCtrl_checkBox"     label         "monitor rate"   
    toolkit_set_property    "rateCtrl_checkBox"     onClick      {::data_path_bts::gui::rate_monitor_registers_functor}

    toolkit_add             "rateCtrl_loading_bitmap"  bitmap          "rateCtrlGroup"
    toolkit_set_property    "rateCtrl_loading_bitmap"  path            ../../system_console/figures/loading.gif
    toolkit_set_property    "rateCtrl_loading_bitmap"  label           "stopped"
    toolkit_set_property    "rateCtrl_loading_bitmap"  visible         0
    
    toolkit_add             "tmp_button" button "rateCtrlGroup"
    toolkit_set_property    "tmp_button" onClick {::data_path_bts::gui::read_rate}
    
    # -- rate histogram
    toolkit_add 			"rateHistGroup" 	group 		"rateTab"
    toolkit_set_property	"rateHistGroup"		expandableX	true
    toolkit_set_property	"rateHistGroup"		expandableY	true
    toolkit_set_property	"rateHistGroup"		itemsPerRow 1
    toolkit_set_property	"rateHistGroup" 	title		"channel rate plot"
    
    toolkit_add 			"rateAsicTab0" 		tabbedGroup     "rateHistGroup"
    for {set i 0} {[expr $i < $n_asic]} {incr i} {
        set group_name [format "rateHistGroupTab%i" $i]
        toolkit_add 			$group_name 	group 		"rateAsicTab0"
        toolkit_set_property	$group_name		expandableX	false
        toolkit_set_property	$group_name		expandableY	false
        toolkit_set_property	$group_name		itemsPerRow 1
        toolkit_set_property	$group_name 	title		[format "MuTRiG %i" $i]
			
        set chart_name	[format "rateBarChart%i" $i]
        toolkit_add				$chart_name		barChart	$group_name
        toolkit_set_property	$chart_name		title		"Channel Rate"
        toolkit_set_property	$chart_name		labelX		"channel ID"
        toolkit_set_property	$chart_name		labelY		[format "Hit Rate per %i ms" 1000]
        toolkit_set_property	$chart_name		expandableX true
        toolkit_set_property	$chart_name		preferredWidth 800
    }
    # /////////////////////////////////////////////////////////////////////////////
    
    
    # //////////////////////////////////// mutrig_ts processor tab /////////////////////////////////////////
    set n_processor [::mu3e::helpers::get_global_variable $fd_global_variable "mts_preprocessor.csr_copies"]
    # - processor tab 
    toolkit_add 			"mtsTab" 	group 				Tab0	
	toolkit_set_property 	"mtsTab" 	title 				"MTS Processor"
	toolkit_set_property 	"mtsTab" 	itemsPerRow 		2
    # -- control panel group
    toolkit_add 			"mtsCtrlGroup" 	group 				"mtsTab"
	toolkit_set_property 	"mtsCtrlGroup" 	title 				"Control Panel"
	toolkit_set_property 	"mtsCtrlGroup" 	itemsPerRow 		1
    
    # -- register values 
    toolkit_add 			"mtsGroup" 	group 				"mtsTab"
    toolkit_set_property 	"mtsGroup" 	itemsPerRow 		2
    set baseGroupNames [list]
    for {set i 0} {$i < $n_processor} {incr i} {
        # -- deassembly group
        lappend baseGroupNames "mtsGroup$i"
        toolkit_add 			"mtsGroup$i" 	group 				"mtsGroup"
        toolkit_set_property 	"mtsGroup$i" 	title 				"IP index $i"
        toolkit_set_property 	"mtsGroup$i" 	itemsPerRow 		1
        ::data_path_bts::gui::bsp2gui_setup  "mts_processor" mtsGroup${i} 0 [list]
    }
    
    # -- control panel content
    toolkit_add             "mtsRead_button" button       "mtsCtrlGroup"
    toolkit_set_property    "mtsRead_button" text         "read"
    toolkit_set_property    "mtsRead_button" onClick      {::data_path_bts::gui::device2gui "mts_processor" "mtsGroup" "mts_preprocessor.csr"; toolkit_set_property "mtsWrite_button" enabled 1 } 
    
    toolkit_add             "mtsWrite_button"   button      "mtsCtrlGroup"
    toolkit_set_property    "mtsWrite_button"   text        "write"
    toolkit_set_property    "mtsWrite_button"   enabled     0
    toolkit_set_property    "mtsWrite_button"   onClick     {::data_path_bts::gui::gui2device "mts_processor" "mtsGroup" "mts_preprocessor.csr"}
    
    # ///////////////////////////////////////////////////////////////////////////////////////
    
    
    # ////////////////////////////// cache stack tab ///////////////////////////////////////
    set n_stacks [::mu3e::helpers::get_global_variable $fd_global_variable "ring_buffer_cam.csr_copies"]
    # - stack tab
    toolkit_add 			"stackTab" 	group 				Tab0	
	toolkit_set_property 	"stackTab" 	title 				"Resequencing Buffer"
	toolkit_set_property 	"stackTab" 	itemsPerRow 		2
    
    # panel group
    toolkit_add 			"stackGroup" 	    group 		"stackTab"
	toolkit_set_property	"stackGroup"	    expandableX	false
	toolkit_set_property	"stackGroup"	    expandableY	false
    toolkit_set_property	"stackGroup"	    maxWidth	200
	toolkit_set_property	"stackGroup"	    itemsPerRow 1
	toolkit_set_property	"stackGroup" 	    title		"Control Panel"
    
    toolkit_add             "stackRead_button"  button      "stackGroup"
    toolkit_set_property    "stackRead_button"  text        "read"
    toolkit_set_property    "stackRead_button"  onClick     {::data_path_bts::gui::device2gui "ring_buffer_cam" "stackGroup" "ring_buffer_cam.csr"; toolkit_set_property "stackWrite_button" enabled 1 }
    
    toolkit_add             "stackWrite_button"  button      "stackGroup"
    toolkit_set_property    "stackWrite_button"  text        "write"
    toolkit_set_property    "stackWrite_button"  enabled     0
    toolkit_set_property    "stackWrite_button"  onClick     {::data_path_bts::gui::gui2device "ring_buffer_cam" "stackGroup" "ring_buffer_cam.csr"}
    
    # -- register values 
    toolkit_add 			"stackGroup" 	group 				"stackTab"
    toolkit_set_property 	"stackGroup" 	itemsPerRow 		4
    set baseGroupNames [list]
    for {set i 0} {$i < $n_stacks} {incr i} {
        # -- deassembly group
        lappend baseGroupNames "stackGroup$i"
        toolkit_add 			"stackGroup$i" 	group 				"stackGroup"
        toolkit_set_property 	"stackGroup$i" 	title 				"IP index $i"
        toolkit_set_property 	"stackGroup$i" 	itemsPerRow 		1
        ::data_path_bts::gui::bsp2gui_setup  "ring_buffer_cam" stackGroup${i} 0 [list]
    }
    
    # ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    # //////////////////////////////// frame assembly tab ///////////////////////////////////////
    set n_assembly [::mu3e::helpers::get_global_variable $fd_global_variable "feb_frame_assembly.csr_copies"]
    # - assembly tab
    toolkit_add 			"assemblyTab" 	group 				Tab0	
	toolkit_set_property 	"assemblyTab" 	title 				"Frame Assembly"
	toolkit_set_property 	"assemblyTab" 	itemsPerRow 		2
    
    # panel group
    toolkit_add 			"assemblyGroup" 	group 		"assemblyTab"
	toolkit_set_property	"assemblyGroup"	    expandableX	false
	toolkit_set_property	"assemblyGroup"	    expandableY	false
    toolkit_set_property	"assemblyGroup"	    maxWidth	200
	toolkit_set_property	"assemblyGroup"	    itemsPerRow 1
	toolkit_set_property	"assemblyGroup" 	title		"Control Panel"
    
    toolkit_add             "assemblyRead_button"  button      "assemblyGroup"
    toolkit_set_property    "assemblyRead_button"  text        "read"
    toolkit_set_property    "assemblyRead_button"  onClick     {::data_path_bts::gui::device2gui "feb_frame_assembly" "assemblyGroup" "feb_frame_assembly.csr"; toolkit_set_property "assemblyWrite_button" enabled 1 }
    
    toolkit_add             "assemblyWrite_button"  button      "assemblyGroup"
    toolkit_set_property    "assemblyWrite_button"  text        "write"
    toolkit_set_property    "assemblyWrite_button"  enabled     0
    toolkit_set_property    "assemblyWrite_button"  onClick     {::data_path_bts::gui::gui2device "feb_frame_assembly" "assemblyGroup" "feb_frame_assembly.csr"}
    
    # -- register values 
    toolkit_add 			"assemblyGroup" 	group 				"assemblyTab"
    toolkit_set_property 	"assemblyGroup" 	itemsPerRow 		4
    set baseGroupNames [list]
    for {set i 0} {$i < $n_assembly} {incr i} {
        # -- assembly group
        lappend baseGroupNames "assemblyGroup$i"
        toolkit_add 			"assemblyGroup$i" 	group 				"assemblyGroup"
        toolkit_set_property 	"assemblyGroup$i" 	title 				"IP index $i"
        toolkit_set_property 	"assemblyGroup$i" 	itemsPerRow 		1
        ::data_path_bts::gui::bsp2gui_setup  "feb_frame_assembly" assemblyGroup${i} 0 [list]
    }
    
    
    # ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    # ////////////////////////////////// histogram tab ///////////////////////////////////////////
    # histogram tab
    toolkit_add 			"histTab" 	group 				Tab0	
	toolkit_set_property 	"histTab" 	title 				"Histogram Statistics"
	toolkit_set_property 	"histTab" 	itemsPerRow 		2
    
    # panel group
    toolkit_add 			"histCtrlGroup" 	group 		"histTab"
	toolkit_set_property	"histCtrlGroup"	    expandableX	false
	toolkit_set_property	"histCtrlGroup"	    expandableY	false
    toolkit_set_property	"histCtrlGroup"	    maxWidth	200
	toolkit_set_property	"histCtrlGroup"	    itemsPerRow 1
	toolkit_set_property	"histCtrlGroup" 	title		"Control Panel"
    
    # panel group - content
    toolkit_add             "histRead_button"   button      "histCtrlGroup"
    toolkit_set_property    "histRead_button"   text        "read"
    toolkit_set_property    "histRead_button"   onClick     {::data_path_bts::gui::device2gui "histogram_statistics" "histRegGroup" "histogram_statistics.csr"; toolkit_set_property "histWrite_button" enabled 1}
    
    toolkit_add             "histWrite_button"   button      "histCtrlGroup"
    toolkit_set_property    "histWrite_button"   text        "write"
    toolkit_set_property    "histWrite_button"   enabled     0
    toolkit_set_property    "histWrite_button"   onClick     {::data_path_bts::gui::gui2device "histogram_statistics" "histRegGroup" "histogram_statistics.csr"}
    
    toolkit_add             "histPlot_button"   button      "histCtrlGroup"
    toolkit_set_property    "histPlot_button"   text         "plot"
    toolkit_set_property    "histPlot_button"   onClick     {::data_path_bts::gui::read_hist "histRegGroup"}
    
    ::mu3e::helpers::toolkit_setup_combobox "histCtrlGroup" "hist_lo_comboBox" [list 0 255] 0 "low"
    ::mu3e::helpers::toolkit_setup_combobox "histCtrlGroup" "hist_hi_comboBox" [list 0 255] 255 "high"
    
    
    # create a button for save to xml
	toolkit_add				"histSave_button"		fileChooserButton 			"histCtrlGroup"
	toolkit_set_property	"histSave_button"		text 						"save"
	toolkit_set_property	"histSave_button"		paths						"./trash_bin/dummy_hist"; # some default path
	toolkit_set_property	"histSave_button"		chooserButtonText 			"Save"
	toolkit_set_property	"histSave_button"		onChoose 		{::data_path_bts::gui::save_hist "histSave_button" "histRegGroup"} 
    
    # tab group
    toolkit_add 			"histTab0" 	    tabbedGroup "histTab"
    # tab group - registers tab
    toolkit_add 			"histRegGroup" 	group 		"histTab0"
    toolkit_set_property	"histRegGroup"	itemsPerRow 2
    toolkit_set_property	"histRegGroup" 	title		"Register Access"
    # tab group - registers tab - content
    ::data_path_bts::gui::bsp2gui_setup "histogram_statistics" "histRegGroup" 0 [list]
    

    # tab group - display tab
    toolkit_add 			"histDisplayGroup" 	    group 		"histTab0"
    toolkit_set_property	"histDisplayGroup"	    expandableX	false
	toolkit_set_property	"histDisplayGroup"	    expandableY	false
	toolkit_set_property	"histDisplayGroup"	    itemsPerRow 1
	toolkit_set_property	"histDisplayGroup" 	    title		"Display"
    # tab group - display tab - content
    toolkit_add             "hist_barChart"         barChart "histDisplayGroup"
    toolkit_set_property    "hist_barChart"         preferredWidth  1000
    
    # tab group - display tab
    toolkit_add 			"histHelpGroup" 	    group 		"histTab0"
    toolkit_set_property	"histHelpGroup"	        expandableX	false
	toolkit_set_property	"histHelpGroup"	        expandableY	false
	toolkit_set_property	"histHelpGroup"	        itemsPerRow 1
	toolkit_set_property	"histHelpGroup" 	    title		"Manual"
    # tab group - display tab - tabbedGroup
    toolkit_add 			"histHelpTab0" 	        tabbedGroup "histHelpGroup"
    array set histMan [::histogram_statistics::bsp::get_manual]
    #parray histMan
    foreach {histManKey histManContent} [array get histMan] {
        # tab group - display tab - tabbedGroup - group
        toolkit_add             "histHelp_${histManKey}_group" group "histHelpTab0"
        toolkit_set_property    "histHelp_${histManKey}_group" title $histManKey
        # tab group - display tab - tabbedGroup - group - content
        toolkit_add             "histManualText"        text        "histHelp_${histManKey}_group"
        toolkit_set_property    "histManualText"        preferredWidth  600
        toolkit_set_property    "histManualText"        preferredHeight 300
        toolkit_set_property    "histManualText"        editable      false
        toolkit_set_property    "histManualText"        htmlCapable   true
        toolkit_set_property    "histManualText"        text          $histManContent
    }
    
    # tab group - automation tab
    #################################################################
    ## scan of 0 - 65535. in a window of 256. takes 256 cycles.
    #################################################################
    toolkit_add 			"histAutoGroup" 	    group 		"histTab0"
    toolkit_set_property	"histAutoGroup"	        expandableX	false
	toolkit_set_property	"histAutoGroup"	        expandableY	false
	toolkit_set_property	"histAutoGroup"	        itemsPerRow 1
	toolkit_set_property	"histAutoGroup" 	    title		"Automation"
    
    # tab group - automation tab - setting group
    toolkit_add             "hitsAutoSetGroup"      group           "histAutoGroup"
    toolkit_set_property    "hitsAutoSetGroup"      preferredWidth  500
    toolkit_set_property    "hitsAutoSetGroup"      title           "Scan Settings"
    toolkit_set_property	"hitsAutoSetGroup"	    itemsPerRow 2
    # tab group - automation tab - setting group - content
    toolkit_add auto_step_textField textField hitsAutoSetGroup
    toolkit_set_property auto_step_textField label "step size"
    toolkit_set_property auto_step_textField text "256"
    toolkit_set_property auto_step_textField toolTip "enter the step size of the scan"
    toolkit_set_property auto_step_textField expandableX true
    
    toolkit_add auto_min_textField textField hitsAutoSetGroup
    toolkit_set_property auto_min_textField label "start value"
    toolkit_set_property auto_min_textField text "0"
    toolkit_set_property auto_min_textField toolTip "start value of left bin (default = 0)"
    toolkit_set_property auto_min_textField expandableX true
    
    toolkit_add auto_nstep_textField textField hitsAutoSetGroup
    toolkit_set_property auto_nstep_textField label "number of steps"
    toolkit_set_property auto_nstep_textField text "4"
    toolkit_set_property auto_nstep_textField toolTip "enter the number of steps of the scan. (default = 256)"
    toolkit_set_property auto_nstep_textField expandableX true
    
    # tab group - automation tab - control group
    toolkit_add             "hitsAutoCtrlGroup"      group           "histAutoGroup"
    toolkit_set_property    "hitsAutoCtrlGroup"      preferredWidth  200
    toolkit_set_property    "hitsAutoCtrlGroup"      title           "Scan Control"
    
    # tab group - automation tab - control group - content
    toolkit_add				"auto_start_button"		fileChooserButton 			"hitsAutoCtrlGroup"
	toolkit_set_property	"auto_start_button"		text 						"Start Scan"
	toolkit_set_property	"auto_start_button"		paths						"./scan_records/dummy_hist"; # some default path
	toolkit_set_property	"auto_start_button"		chooserButtonText 			"Create file sets"
	toolkit_set_property	"auto_start_button"		onChoose 		{::data_path_bts::gui::scan_hist "auto_start_button" "histRegGroup" "auto_step_textField" "auto_min_textField" "auto_nstep_textField"} 
    



    # ////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    # //////////////////////////////////// injector tab /////////////////////////////////////////
    # - injector tab
    toolkit_add 			"injTab" 	group 				Tab0	
	toolkit_set_property 	"injTab" 	title 				"MuTRiG Injector"
	toolkit_set_property 	"injTab" 	itemsPerRow 		2
    
    # panel group
    toolkit_add 			"injCtrlGroup" 	    group 		"injTab"
	toolkit_set_property	"injCtrlGroup"	    expandableX	false
	toolkit_set_property	"injCtrlGroup"	    expandableY	false
    toolkit_set_property	"injCtrlGroup"	    maxWidth	200
	toolkit_set_property	"injCtrlGroup"	    itemsPerRow 1
	toolkit_set_property	"injCtrlGroup" 	    title		"Control Panel"
    
    # panel group - content 
    toolkit_add             "injRead_button"   button      "injCtrlGroup"
    toolkit_set_property    "injRead_button"   text        "read"
    toolkit_set_property    "injRead_button"   onClick     {::data_path_bts::gui::device2gui "mutrig_injector" "injRegGroup" "mutrig_injector.csr"; toolkit_set_property "injWrite_button" enabled 1}
    
    toolkit_add             "injWrite_button"   button      "injCtrlGroup"
    toolkit_set_property    "injWrite_button"   text        "write"
    toolkit_set_property    "injWrite_button"   enabled     0
    toolkit_set_property    "injWrite_button"   onClick     {::data_path_bts::gui::gui2device "mutrig_injector" "injRegGroup" "mutrig_injector.csr"}
    
    # register group
    toolkit_add 			"injRegGroup" 	group 		"injTab"
    toolkit_set_property	"injRegGroup"	itemsPerRow 2
    toolkit_set_property	"injRegGroup" 	title		"Register Access"
    
    # register group - content 
    ::data_path_bts::gui::bsp2gui_setup "mutrig_injector" "injRegGroup" 0 [list -HEADERINFO_CHANNEL_W 4]
    # ///////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
    
    
    return -code ok 
}



    #########################################################################################################
    # @name             bsp2gui_setup 
    #
    # @berief           setup the gui from bsp
    # @param            <bspPkgName> - BSP package name of this IP core 
    #                   <baseGroupName> - base group name to reference the gui widgets 
    #                   <isMonitor> - whether to create an monitor service (TODO)
    #
    # @return           -code ok : success
    #########################################################################################################

proc ::data_path_bts::gui::bsp2gui_setup  {bspPkgName baseGroupName isMonitor config_options } {
    variable fd_global_variable
    # 1) PREPARATION  
    # config bsp...
    if {[llength $config_options] > 0} {
        for {set i 0} {$i < [llength $config_options]} {incr i 2} {
            ::${bspPkgName}::bsp::configure [lindex $config_options $i] [lindex $config_options [expr $i+1]] 
           
        }
    }
    # bsp -> csr address map
    array set csr_map [::${bspPkgName}::bsp::get_address_map ]
    
    # get opened master service
    set mpath [::mu3e::helpers::cget_opened_master_path]
    
    # complete xml format for reg map, store reg map in tmp file
    set fd [open "${bspPkgName}_bsp_tmp.xml" w]
    puts $fd "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    puts $fd "<registers>"
    for {set i 0} {$i<[array size csr_map]} {incr i} {
        puts $fd $csr_map(${i})
    }
    puts $fd "</registers>"
	close $fd
    
    # read this svd (xml) reg map file 
    set fd [open "${bspPkgName}_bsp_tmp.xml" r]
    
    # build dom object
    set xml_plain_text [read $fd]
    close $fd
    
    # xml -> gvtable 
    if {![::mu3e::helpers::probe_global_variable $fd_global_variable ${bspPkgName}_doc_xml]} {
        # create new
        ::mu3e::helpers::append_global_variable $fd_global_variable ${bspPkgName}_doc_xml "empty"
        ::mu3e::helpers::set_global_variable $fd_global_variable ${bspPkgName}_doc_xml $xml_plain_text
    } else {
        # if already created
        ::mu3e::helpers::set_global_variable $fd_global_variable ${bspPkgName}_doc_xml $xml_plain_text
    }
    set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable ${bspPkgName}_doc_xml]
    
    # 2) BUILD GUI
    # parse xml tree of reg map and create gui 
    dom parse $xml_plain_text doc
    foreach i [$doc selectNodes "/registers/register"] {
        # dom -> register properties
        set regName [[[$i selectNodes "name"] childNodes] nodeValue]
        set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
        set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
        # register properties -> gui
        toolkit_add ${baseGroupName}_${regName}_group group $baseGroupName
        toolkit_set_property ${baseGroupName}_${regName}_group title "${regName}: ${regAddrOfst}"
        toolkit_set_property ${baseGroupName}_${regName}_group itemsPerRow 4
        toolkit_set_property ${baseGroupName}_${regName}_group toolTip $regDespt
        toolkit_set_property ${baseGroupName}_${regName}_group preferredWidth 180
        toolkit_set_property ${baseGroupName}_${regName}_group expandableX true
        # dom -> field properties -> gui
        foreach j [$i selectNodes "fields/field"] {
            # ---------- parse properties --------------
            # dom -> field properties
            set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
            set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
            set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
            if {![catch [ $j selectNodes "description" ]]} {
                # fail: not existed
                set bitDescpt "none"
            } else {
                # success: enter field description 
                set bitDescpt [[[$j selectNodes "description"] childNodes] nodeValue]
            }
            # [msb:lsb] -> $bitMsb and $bitLsb
            set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
            set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
            set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
            set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
            # ------------- build gui -----------------
            # field properties -> gui
            # single bit field: comboBox
            if {$bitLsb == $bitMsb} {
                toolkit_add ${baseGroupName}_${regName}${bitName}_checkBox checkBox ${baseGroupName}_${regName}_group
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_checkBox label $bitName
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_checkBox toolTip $bitDescpt
                if {[string equal $bitAccess "read-only"]} {
                    # make it gray if read-only, cannot make it not editable from gui, instead make the background color gray
                    toolkit_set_property ${baseGroupName}_${regName}${bitName}_checkBox backgroundColor gray
                    # done here
                }
            } else {
            # multiple bit field: textField 
                toolkit_add ${baseGroupName}_${regName}${bitName}_textField textField ${baseGroupName}_${regName}_group
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_textField label $bitName
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_textField text "0x0"
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_textField toolTip $bitDescpt
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_textField expandableX true
                # 10-20 unit for each letter 
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_textField minWidth [expr [string length $bitName]*2 + 10]
                toolkit_set_property ${baseGroupName}_${regName}${bitName}_textField maxWidth [expr [string length $bitName]*2 + 55]
                if {[string equal $bitAccess "read-only"]} {
                    # make it gray if read-only 
                    toolkit_set_property ${baseGroupName}_${regName}${bitName}_textField editable false
                    # done here
                }
            } 
        }
    }
    return -code ok
}

    #########################################################################################################
    # @name             gui2device 
    #
    # @berief           (store) collect current gui values and write to device 
    # @param            <bspPkgName> - BSP package name of this IP core 
    #                   <baseGroupName> - base group name to reference the gui widgets 
    #                   <typeName> - the "typename" you get from the marker service points to the qsys ip
    #
    # @return           -code ok : success
    #########################################################################################################
proc ::data_path_bts::gui::gui2device {bspPkgName baseGroupName typeName} {
    # init...  
    variable fd_global_variable
    set n 0
    
    # request opened master service
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    
    # check if multiple ip(s) are present 
    if {[::mu3e::helpers::probe_global_variable $fd_global_variable ${typeName}_copies]} {
        # exists: multiple instance
        set ipCopies [::mu3e::helpers::get_global_variable $fd_global_variable ${typeName}_copies]
    } else {
        # does not exist: single
        set ipCopies 1
    }
    
    # gvtable -> base address
    set ipBases [::mu3e::helpers::get_global_variable $fd_global_variable ${typeName}_base_address]
    
    # gvtable - > xml
    if {![::mu3e::helpers::probe_global_variable $fd_global_variable ${bspPkgName}_doc_xml]} {
        # fail: does not exist
        toolkit_send_message error "gui2device: no bsp reg map found"
        return -code error 
    } else {
        # success: exists
        set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable ${bspPkgName}_doc_xml]
    }
    
    # xml -> dom 
    dom parse $xml_plain_text doc
    
    
    # ---------------------- get multiple copies -------------------------
    foreach ipBase $ipBases {
        # set the basegroup name
        if {$ipCopies > 1} {
            # multiple instance: set for different groups (pad name)
            set baseGroupNameN "$baseGroupName$n"
            incr n
        } else {
            # single instance: set for default group
            set baseGroupNameN $baseGroupName
        }
        
        # gui -> regValue
        foreach i [$doc selectNodes "/registers/register"] {
            set regValue ""
            # --------------- parse register ---------------
            set regName [[[$i selectNodes "name"] childNodes] nodeValue]
            set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
            set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
            # init as "00000......00000" (32 zeros)
            set regValue [::mu3e::helpers::init_register32_value]
            foreach j [$i selectNodes "fields/field"] {
                # --------------- parse field ---------------
                set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
                set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
                set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
                # [msb:lsb] -> $bitMsb and $bitLsb
                set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
                set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
                set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
                set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
                # gui -> bitValue
                # single bit: read checkBox 
                if {$bitLsb == $bitMsb} {
                    set bitValue [toolkit_get_property ${baseGroupNameN}_${regName}${bitName}_checkBox checked]
                    if {[string equal $bitValue false]} { 
                        set bitValue 0
                    } else {
                        set bitValue 1
                    }
                    #string replace $regValue 0 15 1111
                    set regValue [string replace $regValue $bitLsb $bitMsb $bitValue]
                    #puts "write_lvds: field ${bitName}, value ${bitValue}"
                } else {
                # multiple bit: read textField
                    if {[string equal $bitAccess "read-only"]} {
                        # read-only: do not write
                        continue
                    } else {
                        # writable: textField -> bitValue
                        set bitLen [expr $bitMsb - $bitLsb + 1]
                        set trimH [expr int(ceil(${bitLen}/4.0)*4)-1]
                        set trimL [expr ${bitLen}%4]
                        
                        #puts "trimH/L: $trimH $trimL"
                        set bitsValue [toolkit_get_property ${baseGroupNameN}_${regName}${bitName}_textField text]
    #                    if {[string equal $bitName "filter"]} {
    #                        puts "filter textfield.text: $bitsValue"
    #                    }
                        
                        set bitsValue [::mu3e::helpers::hex2bin $bitsValue]
    #                    if {[string equal $bitName "filter"]} {
    #                        puts "filter textfield.text: $bitsValue"
    #                    }
                        
                        set bitsValue [::mu3e::helpers::binary_trim_little_endien $bitsValue 0 [expr $bitLen-1]]
    #                    if {[string equal $bitName "filter"]} {
    #                        puts "filter textfield.text: $bitsValue"
    #                    }
                        # padding zeros to upper bits 
                        while {[expr [string length $bitsValue] < ${bitLen}]} {
                            set bitsValue "0$bitsValue"
                        }
                        set bitsValue [::mu3e::helpers::string_reverse $bitsValue]
                        set regValue [string replace $regValue $bitLsb $bitMsb $bitsValue]
                        #puts "write_lvds: field ${bitName}, value ${bitsValue}"
                    }
                }
            }
            # bitValue(s) -> regValue
            set regValue [::mu3e::helpers::parse_reverse_bit_stream ${regValue}]
            # h2d 
            master_write_32 $master_fd [expr ${ipBase}+${regAddrOfst}] $regValue
            #puts "write: ${regValue} -> ${regAddrOfst}"
        }
    }
    toolkit_send_message info "gui2device: write to \"${typeName}\" registers successful, byte~"
    return -code ok
}


    #########################################################################################################
    # @name             device2gui 
    #
    # @berief           (load) read the registers value in the device to host gui
    # @param            <bspPkgName> - BSP package name of this IP core 
    #                   <baseGroupName> - base group name to reference the gui widgets 
    #                   <typeName> - the "typename" you get from the marker service points to the qsys ip
    #
    # @return           -code ok : success
    #########################################################################################################
proc ::data_path_bts::gui::device2gui {bspPkgName baseGroupName typeName} {
    # init...  
    variable fd_global_variable
    set n 0
    
    # check if multiple ip(s) are present 
    if {[::mu3e::helpers::probe_global_variable $fd_global_variable ${typeName}_copies]} {
        # exists: multiple instance
        set ipCopies [::mu3e::helpers::get_global_variable $fd_global_variable ${typeName}_copies]
    } else {
        # does not exist: single
        set ipCopies 1
    }
    
    # request opened master service
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    
    # gvtable -> base address
    set ipBases [::mu3e::helpers::get_global_variable $fd_global_variable "${typeName}_base_address"]

    # gvtable - > xml (bsp structure)
    if {![::mu3e::helpers::probe_global_variable $fd_global_variable ${bspPkgName}_doc_xml]} {
        # fail: does not exist
        toolkit_send_message error "gui2device: no bsp reg map found"
        return -code error 
    } else {
        # success: exists
        set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable ${bspPkgName}_doc_xml]
    }
    
    # xml -> dom 
    dom parse $xml_plain_text doc
    
    # ---------------------- set multiple copies -------------------------
    foreach ipBase $ipBases {
        # set the 
        if {$ipCopies > 1} {
            # multiple instance: set for different groups (pad name)
            set baseGroupNameN "$baseGroupName$n"
            incr n
        } else {
            # single instance: set for default group
            set baseGroupNameN $baseGroupName
        
        }
        # regValue -> gui
        foreach i [$doc selectNodes "/registers/register"] {
            set regValue ""
            # ------------------- parse register --------------------
            set regName [[[$i selectNodes "name"] childNodes] nodeValue]
            set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
            set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
            # master -> regValue (d2h read)
            set regValue [master_read_32 $master_fd [expr ${ipBase}+${regAddrOfst}] 1]
            #puts [format "read: %x from %x" $regValue [expr ${ipBase}+${regAddrOfst}]]
            set regValueBits [::mu3e::helpers::hex2bin $regValue]
            foreach j [$i selectNodes "fields/field"] {
                #  ------------------- parse field -------------------
                set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
                set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
                set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
                # [msb:lsb] -> $bitMsb and $bitLsb
                set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
                set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
                set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
                set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
                # bitValue -> bitBinary
                set bitBinary [::mu3e::helpers::binary_trim_little_endien $regValueBits $bitLsb $bitMsb]
                # bitBinary -> gui
                if {$bitLsb == $bitMsb} {
                    # single bit: write checkBox
                    toolkit_set_property ${baseGroupNameN}_${regName}${bitName}_checkBox checked $bitBinary
                } else {
                    # multiple bit: write comboBox
                    set bitHex [::mu3e::helpers::bin2hex $bitBinary]
                    toolkit_set_property ${baseGroupNameN}_${regName}${bitName}_textField text $bitHex
                }
            }
        }
    }
    toolkit_send_message info "device2gui: read from \"${typeName}\" registers successful, byte~"
    # enable the write button 
    
    return -code ok

}
    ############################################
    #                                          #
    #               misc functions             # 
    #                                          #
    ############################################
    
    ###############################
    # histograms 
    ###############################
proc ::data_path_bts::gui::read_hist {baseGroupName} {
    # init...
    set hist_bins 256
    set bin_index 0
    # get time for uid
    set seed_time [clock seconds]
    # request opened master service
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    variable fd_global_variable
    # gvtable -> base address
    set hist_csr_base [::mu3e::helpers::get_global_variable $fd_global_variable "histogram_statistics.csr_base_address"]
    set hist_bin_base [::mu3e::helpers::get_global_variable $fd_global_variable "histogram_statistics.hist_bin_base_address"]
    set hist_barChart_name [::mu3e::helpers::get_global_variable $fd_global_variable "hist_barChart_name"]
    # get plot range 
    set low [toolkit_get_property "hist_lo_comboBox" selectedItem]
    set high [toolkit_get_property "hist_hi_comboBox" selectedItem]
    # get boundary and calc bin size
    set unsigned [toolkit_get_property ${baseGroupName}_csrrepresentation_checkBox checked]
    set left [toolkit_get_property ${baseGroupName}_left_boundleft_bound_textField text]
    set right [toolkit_get_property ${baseGroupName}_right_boundright_bound_textField text]
    #puts [format "left: %i right: %i" $left $right]
    if {!$unsigned} {
        set left [::mu3e::helpers:hex2signed $left]
        set right [::mu3e::helpers:hex2signed $right]
    } 
    #puts [format "left: %i right: %i" $left $right]
    set bin_sz [expr 1.0*($right - $left)/$hist_bins]
    
    # 1) flush (plot and IP)
    # hide old plot
    toolkit_set_property $hist_barChart_name visible 0
    toolkit_set_property $hist_barChart_name enabled 0
    # update gvtable
    ::mu3e::helpers::set_global_variable $fd_global_variable "hist_barChart_name" "hist_barChart$seed_time"
    # create new plot
    toolkit_add "hist_barChart$seed_time" barChart "histDisplayGroup"
    toolkit_set_property "hist_barChart$seed_time" preferredWidth 1000
    toolkit_set_property "hist_barChart$seed_time" title "Histogram Bin Plot"
    toolkit_set_property "hist_barChart$seed_time" labelX [format "\[%d : %d\]" $left $right]
    toolkit_set_property "hist_barChart$seed_time" labelY [format "bin count / %.2f" $bin_sz]
    
    # sclr the IP 
    master_write_32 $master_fd $hist_bin_base 0x0
    # 2) wait 1 s
    after 1000
    # 3) read <hist_bin>
    set csr_pack [master_read_32 $master_fd $hist_bin_base $hist_bins]
    #puts $csr_pack
    # 4) plot 
    foreach regValue $csr_pack {
        # 1) within range: plot
        if {[expr $bin_index <= $high && $bin_index >=$low]} {
            set regValue [format %i $regValue]
            set bin_mid [expr $bin_index*$bin_sz+0.5*$bin_sz+$left]
            toolkit_set_property "hist_barChart$seed_time" itemValue [list $bin_mid $regValue]
        # 2) out of range: do not plot
        } else {
            #toolkit_set_property "hist_barChart" itemValue [list $bin_index 0]
        }
        incr bin_index
    }
    toolkit_send_message info "read_hist: histogram `rate` plotted"
    ::mu3e::helpers::set_global_variable $fd_global_variable "hist_regpack" $csr_pack
    return -code ok
}

proc ::data_path_bts::gui::save_hist {fileChooserButtonName baseGroupName} {
    # init
    variable fd_global_variable
    set hist_bins 256
    set bin_index 0
    set bin_mids [list]
    set regValues [list]
    # get boundary and calc bin size
    set unsigned [toolkit_get_property ${baseGroupName}_csrrepresentation_checkBox checked]
    set left [toolkit_get_property ${baseGroupName}_left_boundleft_bound_textField text]
    set right [toolkit_get_property ${baseGroupName}_right_boundright_bound_textField text]
    if {!$unsigned} {
        set left [::mu3e::helpers:hex2signed $left]
        set right [::mu3e::helpers:hex2signed $right]
    } 
    set bin_sz [expr 1.0*($right - $left)/$hist_bins]
    
    # get hist content
    set csr_pack [::mu3e::helpers::get_global_variable $fd_global_variable "hist_regpack"]
    
    if {![catch [toolkit_get_property $fileChooserButtonName paths]]} {
		toolkit_send_message warning "save_hist: file selection cancelled, byte~"
		return -code error
	} else {
        # open path and file
		set file_path [toolkit_get_property $fileChooserButtonName paths]
		set fd [open "$file_path" w]
        
        # get reg value saved by last session -> two lists for x and y
        foreach regValue $csr_pack {
            set regValue [format %i $regValue]
            set bin_mid [expr $bin_index*$bin_sz+0.5*$bin_sz+$left]
            lappend bin_mids $bin_mid
            lappend regValues $regValue
            incr bin_index
        }
        # save to file 
        #puts $bin_mids
        #puts $regValues
		puts $fd $bin_mids 
        puts $fd $regValues 
		close $fd	
		toolkit_send_message info "save_hist: histogram data saved (${file_path}), thank you!"	
		return -code ok
	}
}

proc ::data_path_bts::gui::scan_hist {fileChooserButtonName baseGroupName stepSizeButtonName minButtonName nstepButtonName} {
    # init
    variable fd_global_variable
    set hist_bins 256
    set bin_mids [list]
    set regValues [list]
    # request opened master service
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    # gvtable -> base address
    set hist_csr_base [::mu3e::helpers::get_global_variable $fd_global_variable "histogram_statistics.csr_base_address"]
    set hist_bin_base [::mu3e::helpers::get_global_variable $fd_global_variable "histogram_statistics.hist_bin_base_address"]
    # scan related 
    set step_sz [toolkit_get_property $stepSizeButtonName text]
    set scan_min [toolkit_get_property $minButtonName text]
    set nstep [toolkit_get_property $nstepButtonName text]
    set unsigned [toolkit_get_property ${baseGroupName}_csrrepresentation_checkBox checked]
    
    # scan iterations
    for {set i 0} {$i < $nstep} {incr i} {
        # allow for abort
        # ...
    
        # 1) load new setting
        master_write_32 $master_fd [expr $hist_csr_base + 0x4] [expr $scan_min + $i*$step_sz]
        master_write_32 $master_fd [expr $hist_csr_base + 0x8] [expr $scan_min + [expr $i+1]*$step_sz]
        # 2) sclr the IP 
        master_write_32 $master_fd $hist_bin_base 0x0
        set bin_mids [list]
        set regValues [list]
        # 3) wait 1 s
        after 1000
        # 4) read <hist_bin>
        set csr_pack [master_read_32 $master_fd $hist_bin_base $hist_bins]
        # 5) get boundary and calc bin size
        set left [expr $scan_min + $i*$step_sz]
        set right [expr $scan_min + [expr $i+1]*$step_sz]
        if {!$unsigned} {
            set left [::mu3e::helpers:hex2signed $left]
            set right [::mu3e::helpers:hex2signed $right]
        } 
        set bin_index 0
        set bin_sz [expr 1.0*($right - $left)/$hist_bins]
            
        if {![catch [toolkit_get_property $fileChooserButtonName paths]]} {
            toolkit_send_message warning "save_hist: file selection cancelled, byte~"
            return -code error
        } else {
            # open path and file
            set file_path [toolkit_get_property $fileChooserButtonName paths]
            set file_path "${file_path}_step-${i}.txt"
            set fd [open "$file_path" w]
            
            # get reg value saved by last session -> two lists for x and y
            foreach regValue $csr_pack {
                set regValue [format %i $regValue]
                set bin_mid [expr $bin_index*$bin_sz+0.5*$bin_sz+$left]
                lappend bin_mids $bin_mid
                lappend regValues $regValue
                incr bin_index
            }
            # save to file 
            #puts $bin_mids
            #puts $regValues
            puts $fd $bin_mids 
            puts $fd $regValues 
            close $fd	
            toolkit_send_message info "scan_hist: process (${i}/${nstep}), histogram data saved as (${file_path})"	
        }
    }
    toolkit_send_message info "scan_hist: process (${nstep}/${nstep}), scan completed successful)"	
    return -code ok
}


    ###############################
    # deassembly 
    ###############################

proc ::data_path_bts::gui::setup_deassembly {baseGroupName} {
    variable fd_global_variable
    # 1) PREPARATION  
    # csr address map <- bsp 
    array set csr_map [::frame_deassembly::bsp::get_address_map ]
    # request opened master service
    #set mpath [::mu3e::helpers::cget_opened_master_path]
    # complete xml format for reg map, store reg map in tmp file
    set fd [open "frame_deassembly_bsp_tmp.xml" w]
    puts $fd "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    puts $fd "<registers>"
    for {set i 0} {$i<[array size csr_map]} {incr i} {
        puts $fd $csr_map(${i})
    }
    puts $fd "</registers>"
	close $fd
    # read this svd (xml) reg map file 
    set fd [open "frame_deassembly_bsp_tmp.xml" r]
    # build dom object
    set xml_plain_text [read $fd]
    # xml -> gvtable
    ::mu3e::helpers::set_global_variable $fd_global_variable "frame_deassembly_doc_xml" $xml_plain_text
    set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable "frame_deassembly_doc_xml"]
    dom parse $xml_plain_text doc
    
    close $fd
    # 2) SETUP 
    # parse xml tree of reg map and create gui 
    foreach i [$doc selectNodes "/registers/register"] {
        # parse register
        set regName [[[$i selectNodes "name"] childNodes] nodeValue]
        set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
        set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
        # gui for register
        toolkit_add ${regName}_group group $baseGroupName
        toolkit_set_property ${regName}_group title "${regName}: ${regAddrOfst}"
        toolkit_set_property ${regName}_group itemsPerRow 4
        toolkit_set_property ${regName}_group toolTip $regDespt
        foreach j [$i selectNodes "fields/field"] {
            # parse field 
            set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
            set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
            set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
            if {![catch [ $j selectNodes "description" ]]} {
                # fail: not existed
                set bitDescpt "none"
            } else {
                # success: 
                set bitDescpt [[[$j selectNodes "description"] childNodes] nodeValue]
            }
            # -- parse the [msb:lsb] format
            set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
            set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
            set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
            set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
            #puts "${bitMsb} : ${bitLsb}"
            # gui for field
            # 1) setup checkBox for single bit
            if {$bitLsb == $bitMsb} {
                toolkit_add ${regName}${bitName}_checkBox checkBox ${regName}_group
                toolkit_set_property ${regName}${bitName}_checkBox label $bitName
                toolkit_set_property ${regName}${bitName}_checkBox toolTip $bitDescpt
            
            } else {
            # 2) setup comboBox for multiple bit
                toolkit_add ${regName}${bitName}_textField textField ${regName}_group
                toolkit_set_property ${regName}${bitName}_textField label $bitName
                toolkit_set_property ${regName}${bitName}_textField text "?"
                toolkit_set_property ${regName}${bitName}_textField toolTip $bitDescpt
                if {[string equal $bitAccess "read-only"]} {
                    # make it gray if read-only 
                    toolkit_set_property ${regName}${bitName}_textField editable false
                } else {
                    # master write
                    
                }
            }
        }
    }
    
    
    
    
    return -code ok 
}

proc ::data_path_bts::gui::setup_deassembly_controlPanel {baseGroupName} {
    variable lvds_monitor_fd ""
    toolkit_add            "deassembly_controlPanel_write_button"     button      $baseGroupName
    toolkit_set_property   "deassembly_controlPanel_write_button"     text        "update registers"
    toolkit_set_property   "deassembly_controlPanel_write_button"     onClick      {::data_path_bts::gui::deassembly_update_registers_functor }
     
    toolkit_add            "deassembly_controlPanel_monitor_checkBox"     checkBox      $baseGroupName
    toolkit_set_property   "deassembly_controlPanel_monitor_checkBox"     label         "monitor registers"   
    toolkit_set_property   "deassembly_controlPanel_monitor_checkBox"     onClick      {::data_path_bts::gui::deassembly_monitor_registers_functor}

    toolkit_add             "deassembly_controlPanel_loading_bitmap"  bitmap          $baseGroupName
    toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  path            ../../system_console/figures/loading.gif
    toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  label           "stopped"
    toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  visible         0
    
    return -code ok
}

proc ::data_path_bts::gui::deassembly_update_registers_functor {} {
    

    return -code ok
}

proc ::data_path_bts::gui::deassembly_monitor_registers_functor {} {
    variable deassembly_monitor_fd
    set checked [toolkit_get_property "deassembly_controlPanel_monitor_checkBox" checked]
    # hide button
    toolkit_set_property "deassembly_controlPanel_write_button" enabled [expr ![expr $checked]]
    # get selected master service path
    set master_path [::mu3e::helpers::get_selected_servicePath "jtagMasterGroup_showmp_comboBox"]
    if {$checked} {
        # open monitor serivce
        if {$deassembly_monitor_fd ne ""} {
            toolkit_send_message info "deassembly_monitor_registers_functor: monitor started..." 
        } else {
            #puts "monitor not created"
            # open monitor service -> fd
            set deassembly_monitor_fd [::mu3e::helpers::open_monitor_service]
            monitor_set_interval $deassembly_monitor_fd 1000
            monitor_set_callback $deassembly_monitor_fd [list ::data_path_bts::gui::read_deassembly]
            monitor_add_range $deassembly_monitor_fd $master_path 0x0 4
            toolkit_send_message info "deassembly_monitor_registers_functor: registered monitor service, monitor started..." 
        }
        monitor_set_enabled $deassembly_monitor_fd 1
        # update loading gif
        toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  label           "monitering..."
        toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  visible         1
        toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  toolTip         "press again to stop"
    } else {
        monitor_set_enabled $deassembly_monitor_fd 0
        # update loading gif
        toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  label           "stopped"
        toolkit_set_property    "deassembly_controlPanel_loading_bitmap"  visible         0
    }
    return -code ok

}

proc ::data_path_bts::gui::read_deassembly {} {
    # init ...
    variable fd_global_variable
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    # gvtable -> base address
    set deassembly_base_list [::mu3e::helpers::get_global_variable $fd_global_variable "mutrig_frame_deassembly.csr_base_address"]
    set span [expr 3*4]
    foreach base $deassembly_base_list {
        set registers [master_read_32 $master_fd $base 3]
        foreach register $registers {
            
        }
    }
    # read 
   
}   

    ###############################
    # lvds 
    ###############################

proc ::data_path_bts::gui::setup_lvds {baseGroupName n_lane} {
    variable fd_global_variable
    # 1) PREPARATION  
    # configure -> bsp
    ::lvds_rx::bsp::configure -n_lane $n_lane
    # csr address map <- bsp 
    array set csr_map [::lvds_rx::bsp::get_address_map ]
    # request opened master service
    #set mpath [::mu3e::helpers::cget_opened_master_path]
    # complete xml format for reg map, store reg map in tmp file
    set fd [open "lvds_bsp_tmp.xml" w]
    puts $fd "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    puts $fd "<registers>"
    for {set i 0} {$i<[array size csr_map]} {incr i} {
        puts $fd $csr_map(${i})
    }
    puts $fd "</registers>"
	close $fd
    # read this svd (xml) reg map file 
    set fd [open "lvds_bsp_tmp.xml" r]
    # build dom object
    set xml_plain_text [read $fd]
    # xml -> gvtable
    ::mu3e::helpers::set_global_variable $fd_global_variable "lvds_doc_xml" $xml_plain_text
    set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable "lvds_doc_xml"]
    dom parse $xml_plain_text doc
    
    close $fd
    
    # 2) SETUP 
    # parse xml tree of reg map and create gui 
    foreach i [$doc selectNodes "/registers/register"] {
        # parse register
        set regName [[[$i selectNodes "name"] childNodes] nodeValue]
        set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
        set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
        # gui for register
        toolkit_add ${regName}_group group $baseGroupName
        toolkit_set_property ${regName}_group title "${regName}: ${regAddrOfst}"
        toolkit_set_property ${regName}_group itemsPerRow 4
        toolkit_set_property ${regName}_group toolTip $regDespt
        foreach j [$i selectNodes "fields/field"] {
            # parse field 
            set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
            set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
            set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
            if {![catch [ $j selectNodes "description" ]]} {
                # fail: not existed
                set bitDescpt "none"
            } else {
                # success: 
                set bitDescpt [[[$j selectNodes "description"] childNodes] nodeValue]
            }
            # -- parse the [msb:lsb] format
            set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
            set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
            set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
            set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
            #puts "${bitMsb} : ${bitLsb}"
            # gui for field
            # 1) setup checkBox for single bit
            if {$bitLsb == $bitMsb} {
                toolkit_add ${regName}${bitName}_checkBox checkBox ${regName}_group
                toolkit_set_property ${regName}${bitName}_checkBox label $bitName
                toolkit_set_property ${regName}${bitName}_checkBox toolTip $bitDescpt
            
            } else {
            # 2) setup comboBox for multiple bit
                toolkit_add ${regName}${bitName}_textField textField ${regName}_group
                toolkit_set_property ${regName}${bitName}_textField label $bitName
                toolkit_set_property ${regName}${bitName}_textField text "?"
                toolkit_set_property ${regName}${bitName}_textField toolTip $bitDescpt
                if {[string equal $bitAccess "read-only"]} {
                    # make it gray if read-only 
                    toolkit_set_property ${regName}${bitName}_textField editable false
                } else {
                    # master write  
                }
            }
        }
    }
    return -code ok 
}



proc ::data_path_bts::gui::setup_lvds_controlPanel {baseGroupName n_lane} {
    variable lvds_monitor_fd ""
    toolkit_add            "lvds_controlPanel_read_button"     button      $baseGroupName
    toolkit_set_property   "lvds_controlPanel_read_button"     text        "update registers"
    toolkit_set_property   "lvds_controlPanel_read_button"     onClick      {::data_path_bts::gui::lvds_update_registers_functor }
     
    toolkit_add            "lvds_controlPanel_monitor_checkBox"     checkBox      $baseGroupName
    toolkit_set_property   "lvds_controlPanel_monitor_checkBox"     label         "monitor registers"   
    toolkit_set_property   "lvds_controlPanel_monitor_checkBox"     onClick      {::data_path_bts::gui::lvds_monitor_registers_functor}

    toolkit_add             "lvds_controlPanel_loading_bitmap"  bitmap          $baseGroupName
    toolkit_set_property    "lvds_controlPanel_loading_bitmap"  path            ../../system_console/figures/loading.gif
    toolkit_set_property    "lvds_controlPanel_loading_bitmap"  label           "stopped"
    toolkit_set_property    "lvds_controlPanel_loading_bitmap"  visible         0
    
    return -code ok
}

proc ::data_path_bts::gui::lvds_update_registers_functor {} {
    ::data_path_bts::gui::write_lvds

    return -code ok
}

proc ::data_path_bts::gui::lvds_monitor_registers_functor {} {
    variable lvds_monitor_fd
    set checked [toolkit_get_property "lvds_controlPanel_monitor_checkBox" checked]
    # hide button
    toolkit_set_property "lvds_controlPanel_read_button" enabled [expr ![expr $checked]]
    # get selected master service path
    set master_path [::mu3e::helpers::get_selected_servicePath "jtagMasterGroup_showmp_comboBox"]
    if {$checked} {
        # open monitor serivce
        if {$lvds_monitor_fd ne ""} {
            toolkit_send_message info "lvds_monitor_registers_functor: monitor started..." 
        } else {
            #puts "monitor not created"
            # open monitor service -> fd
            set lvds_monitor_fd [::mu3e::helpers::open_monitor_service]
            monitor_set_interval $lvds_monitor_fd 1000
            monitor_set_callback $lvds_monitor_fd [list ::data_path_bts::gui::read_lvds]
            monitor_add_range $lvds_monitor_fd $master_path 0x0 4
            toolkit_send_message info "lvds_monitor_registers_functor: registered monitor service, monitor started..." 
        }
        monitor_set_enabled $lvds_monitor_fd 1
        # update loading gif
        toolkit_set_property    "lvds_controlPanel_loading_bitmap"  label           "monitering..."
        toolkit_set_property    "lvds_controlPanel_loading_bitmap"  visible         1
        toolkit_set_property    "lvds_controlPanel_loading_bitmap"  toolTip         "press again to stop"
    } else {
        monitor_set_enabled $lvds_monitor_fd 0
        # update loading gif
        toolkit_set_property    "lvds_controlPanel_loading_bitmap"  label           "stopped"
        toolkit_set_property    "lvds_controlPanel_loading_bitmap"  visible         0
    }
    return -code ok
}


proc ::data_path_bts::gui::read_lvds { } {
    
    # init...  
    variable fd_global_variable
    set n 0
    # init more...
    set typeName "lvds_rx_controller_pro.csr"
    set baseGroupName ""
    set bspPkgName "lvds"
    
    # check if multiple ip(s) are present 
    if {[::mu3e::helpers::probe_global_variable $fd_global_variable ${typeName}_copies]} {
        # exists: multiple instance
        set ipCopies [::mu3e::helpers::get_global_variable $fd_global_variable ${typeName}_copies]
    } else {
        # does not exist: single
        set ipCopies 1
    }
    
    # request opened master service
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    
    # gvtable -> base address
    set ipBases [::mu3e::helpers::get_global_variable $fd_global_variable "${typeName}_base_address"]

    # gvtable - > xml (bsp structure)
    if {![::mu3e::helpers::probe_global_variable $fd_global_variable ${bspPkgName}_doc_xml]} {
        # fail: does not exist
        toolkit_send_message error "read_lvds: no bsp reg map found"
        return -code error 
    } else {
        # success: exists
        set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable ${bspPkgName}_doc_xml]
    }
    
    # xml -> dom 
    dom parse $xml_plain_text doc
    
    # ---------------------- set multiple copies -------------------------
    foreach ipBase $ipBases {
       
        # regValue -> gui
        foreach i [$doc selectNodes "/registers/register"] {
            set regValue ""
            # ------------------- parse register --------------------
            set regName [[[$i selectNodes "name"] childNodes] nodeValue]
            set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
            set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
            # master -> regValue (d2h read)
            set regValue [master_read_32 $master_fd [expr ${ipBase}+${regAddrOfst}] 1]
            #puts [format "read: %x from %x" $regValue [expr ${ipBase}+${regAddrOfst}]]
            set regValueBits [::mu3e::helpers::hex2bin $regValue]
            foreach j [$i selectNodes "fields/field"] {
                #  ------------------- parse field -------------------
                set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
                set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
                set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
                # [msb:lsb] -> $bitMsb and $bitLsb
                set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
                set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
                set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
                set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
                # bitValue -> bitBinary
                set bitBinary [::mu3e::helpers::binary_trim_little_endien $regValueBits $bitLsb $bitMsb]
                # bitBinary -> gui
                if {$bitLsb == $bitMsb} {
                    # single bit: write checkBox
                    toolkit_set_property ${regName}${bitName}_checkBox checked $bitBinary
                } else {
                    # multiple bit: write comboBox
                    set bitHex [::mu3e::helpers::bin2hex $bitBinary]
                    toolkit_set_property ${regName}${bitName}_textField text $bitHex
                }
            }
        }
    }
    toolkit_send_message info "read_lvds: read from \"${typeName}\" registers successful, byte~"
    # enable the write button 
    
    return -code ok

}



proc ::data_path_bts::gui::write_lvds { } {
    # init...  
    variable fd_global_variable
    # init more...
    set typeName "lvds_rx_controller_pro.csr"
    set baseGroupName ""
    set bspPkgName "lvds"
    
    # request opened master service
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    
    # gvtable -> base address
    set ipBase [::mu3e::helpers::get_global_variable $fd_global_variable ${typeName}_base_address]
    
    # gvtable - > xml
    if {![::mu3e::helpers::probe_global_variable $fd_global_variable ${bspPkgName}_doc_xml]} {
        # fail: does not exist
        toolkit_send_message error "write_lvds: no bsp reg map found"
        return -code error 
    } else {
        # success: exists
        set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable ${bspPkgName}_doc_xml]
    }
    
    # xml -> dom 
    dom parse $xml_plain_text doc
    
    # gui -> regValue
    foreach i [$doc selectNodes "/registers/register"] {
        set regValue ""
        # --------------- parse register ---------------
        set regName [[[$i selectNodes "name"] childNodes] nodeValue]
        set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
        set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
        # init as "00000......00000" (32 zeros)
        set regValue [::mu3e::helpers::init_register32_value]
        foreach j [$i selectNodes "fields/field"] {
            # --------------- parse field ---------------
            set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
            set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
            set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
            # [msb:lsb] -> $bitMsb and $bitLsb
            set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
            set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
            set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
            set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
            # gui -> bitValue
            # single bit: read checkBox 
            if {$bitLsb == $bitMsb} {
                set bitValue [toolkit_get_property ${regName}${bitName}_checkBox checked]
                if {[string equal $bitValue false]} { 
                    set bitValue 0
                } else {
                    set bitValue 1
                }
                #string replace $regValue 0 15 1111
                set regValue [string replace $regValue $bitLsb $bitMsb $bitValue]
                #puts "write_lvds: field ${bitName}, value ${bitValue}"
            } else {
            # multiple bit: read textField
                # writable: textField -> bitValue
                set bitLen [expr $bitMsb - $bitLsb + 1]
                set trimH [expr int(ceil(${bitLen}/4.0)*4)-1]
                set trimL [expr ${bitLen}%4]
                
                #puts "trimH/L: $trimH $trimL"
                set bitsValue [toolkit_get_property ${regName}${bitName}_textField text]
#                    if {[string equal $bitName "filter"]} {
#                        puts "filter textfield.text: $bitsValue"
#                    }
                
                set bitsValue [::mu3e::helpers::hex2bin $bitsValue]
#                    if {[string equal $bitName "filter"]} {
#                        puts "filter textfield.text: $bitsValue"
#                    }
                
                set bitsValue [::mu3e::helpers::binary_trim_little_endien $bitsValue 0 [expr $bitLen-1]]
#                    if {[string equal $bitName "filter"]} {
#                        puts "filter textfield.text: $bitsValue"
#                    }
                # padding zeros to upper bits 
                while {[expr [string length $bitsValue] < ${bitLen}]} {
                    set bitsValue "0$bitsValue"
                }
                set bitsValue [::mu3e::helpers::string_reverse $bitsValue]
                set regValue [string replace $regValue $bitLsb $bitMsb $bitsValue]
                #puts "write_lvds: field ${bitName}, value ${bitsValue}"
                
            }
        }
        # bitValue(s) -> regValue
        set regValue [::mu3e::helpers::parse_reverse_bit_stream ${regValue}]
        # h2d 
        master_write_32 $master_fd [expr ${ipBase}+${regAddrOfst}] $regValue
        #puts "write: ${regValue} -> ${regAddrOfst}"
    }
    toolkit_send_message info "write_lvds: write to \"${typeName}\" registers successful, byte~"
    return -code ok
}

    ###############################
    # rate 
    ###############################

proc ::data_path_bts::gui::rate_monitor_registers_functor {} {
    variable rate_monitor_fd
    set checked [toolkit_get_property "rateCtrl_checkBox" checked]
    # get selected master service path
    set master_path [::mu3e::helpers::get_selected_servicePath "jtagMasterGroup_showmp_comboBox"]
    if {$checked} {
        # open monitor serivce
        if {$rate_monitor_fd ne ""} {
            toolkit_send_message info "rate_monitor_registers_functor: monitor started..." 
        } else {
            #puts "monitor not created"
            # open monitor service -> fd
            set rate_monitor_fd [::mu3e::helpers::open_monitor_service]
            monitor_set_interval $rate_monitor_fd 1000
            monitor_set_callback $rate_monitor_fd [list ::data_path_bts::gui::read_rate]
            monitor_add_range $rate_monitor_fd $master_path 0x0 4
            toolkit_send_message info "rate_monitor_registers_functor: registered monitor service, monitor started..." 
        }
        monitor_set_enabled $rate_monitor_fd 1
        # update loading gif
        toolkit_set_property    "rateCtrl_loading_bitmap"  label           "monitering..."
        toolkit_set_property    "rateCtrl_loading_bitmap"  visible         1
        toolkit_set_property    "rateCtrl_loading_bitmap"  toolTip         "press again to stop"
    } else {
        monitor_set_enabled $rate_monitor_fd 0
        # update loading gif
        toolkit_set_property    "rateCtrl_loading_bitmap"  label           "stopped"
        toolkit_set_property    "rateCtrl_loading_bitmap"  visible         0
    }
    return -code ok
}

proc ::data_path_bts::gui::read_rate {} {
    variable fd_global_variable
    set i 0
    set master_fd [::mu3e::helpers::cget_opened_master_path]
    # gvtable -> base address
    set rate_base_list [::mu3e::helpers::get_global_variable $fd_global_variable "counter_avmm.avmm_counter_value_base_address"]
    # span
    set rate_span [format 0x%x [expr 4*32]]
    # master -> value -> hist
    foreach rate_base $rate_base_list {
        # read rate for each asic
        set histName "rateBarChart$i"
        set rate_of_one_asic [master_read_32 $master_fd [expr ${rate_base}] 32]
        # plot for each channel
        set j 0
        foreach rate $rate_of_one_asic {
            set rate [format %i $rate]
            toolkit_set_property $histName itemValue [list $j $rate]
            incr j
        }
        #puts $rate_of_one_asic
        incr i
    }
    
    
}





    ################################################
    # garbage
    ################################################


## master -> hex -> gui
#proc ::data_path_bts::gui::read_lvds2 {} {
#    variable fd_global_variable
#    set master_fd [::mu3e::helpers::cget_opened_master_path]
#    #puts "read_lvds: reading..."
#    # gvtable -> base address
#    set lvds_base [::mu3e::helpers::get_global_variable $fd_global_variable "lvds_rx_controller_pro.csr_base_address"]
#    # gvtable -> doc_xml
#    set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable "lvds_doc_xml"]
#    # build dom object
#	dom parse $xml_plain_text doc
#    # parse xml tree of reg map and create gui 
#    foreach i [$doc selectNodes "/registers/register"] {
#        set regValue ""
#        # parse register
#        set regName [[[$i selectNodes "name"] childNodes] nodeValue]
#        set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
#        set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
#        # master -> reg 
#        set regValue [master_read_32 $master_fd [expr ${lvds_base}+${regAddrOfst}] 1]
#        #puts [format "regName: %s regValue: 0x%x" $regName $regValue]
#        set regValueBits [::mu3e::helpers::hex2bin $regValue]
#        #puts "write_lvds: get reg ${regName}, value *init is:${regValue}"
#        #puts [$i selectNodes "fields/field"]
#        foreach j [$i selectNodes "fields/field"] {
#            # parse field 
#            set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
#            set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
#            set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
#            # -- parse the [msb:lsb] format
#            set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
#            set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
#            set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
#            set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
#            #puts "${bitMsb} : ${bitLsb}"
#            #puts "field: raw is ${regValueBits}"
#            set bitBinary [::mu3e::helpers::binary_trim_little_endien $regValueBits $bitLsb $bitMsb]
#            # gui for field
#            # 1) load checkBox for single bit
#            if {$bitLsb == $bitMsb} {
#                toolkit_set_property ${regName}${bitName}_checkBox checked $bitBinary
#            } else {
#                # 2) load comboBox for multiple bit
#                #puts $bitBinary
#                set bitHex [::mu3e::helpers::bin2hex $bitBinary]
#                #puts "bitHex ${bitHex}"
#                toolkit_set_property ${regName}${bitName}_textField text $bitHex
#            }
#        }
#    }
#    return -code ok
#
#}
#
## master <- hex <- gui
#proc ::data_path_bts::gui::write_lvds2 {} {
#    variable fd_global_variable
#    set master_fd [::mu3e::helpers::cget_opened_master_path]
#    #puts "\n write_lvds: writing..."
#    
#    # gvtable -> base address
#    set lvds_base [::mu3e::helpers::get_global_variable $fd_global_variable "lvds_rx_controller_pro.csr_base_address"]
#    # gvtable -> doc_xml
#    set xml_plain_text [::mu3e::helpers::get_global_variable $fd_global_variable "lvds_doc_xml"]
#    # build dom object
#	dom parse $xml_plain_text doc
#    # parse xml tree of reg map and create gui 
#    foreach i [$doc selectNodes "/registers/register"] {
#        set regValue ""
#        # parse register
#        set regName [[[$i selectNodes "name"] childNodes] nodeValue]
#        set regDespt [[[$i selectNodes "description"] childNodes] nodeValue]
#        set regAddrOfst [[[$i selectNodes "addressOffset"] childNodes] nodeValue]
#        # init as "00000......00000" (32 zeros)
#        set regValue [::mu3e::helpers::init_register32_value]
#        #puts "write_lvds: get reg ${regName}, value *init is:${regValue}"
#        #puts [$i selectNodes "fields/field"]
#        foreach j [$i selectNodes "fields/field"] {
#            # parse field 
#            set bitName [[[$j selectNodes "name"] childNodes] nodeValue]
#            set bitRange [[[$j selectNodes "bitRange"] childNodes] nodeValue]
#            set bitAccess [[[$j selectNodes "access"] childNodes] nodeValue]
#            # -- parse the [msb:lsb] format
#            set bitMsb [lindex [regexp -all -inline {(\d)*:} $bitRange] 0]
#            set bitMsb [lindex [regexp -all -inline {(\d)*} $bitMsb] 0]
#            set bitLsb [lindex [regexp -all -inline {:(\d)*} $bitRange] 0]
#            set bitLsb [lindex [regexp -all -inline {(\w)*} $bitLsb] 2]
#            #puts "${bitMsb} : ${bitLsb}"
#            # gui for field
#            # 1) load checkBox for single bit
#            if {$bitLsb == $bitMsb} {
#                set bitValue [toolkit_get_property ${regName}${bitName}_checkBox checked]
#                if {[string equal $bitValue false]} { 
#                    set bitValue 0
#                } else {
#                    set bitValue 1
#                }
#                #string replace $regValue 0 15 1111
#                set regValue [string replace $regValue $bitLsb $bitMsb $bitValue]
#                #puts "write_lvds: field ${bitName}, value ${bitValue}"
#            } else {
##            # 2) load comboBox for multiple bit
#                if {[string equal $bitAccess "read-only"]} {
#                    # read-only: do not write
#                    #puts "write_lvds: field ${bitName} read-only! continue ->"
#                    continue
#                } else {
#                    # writable: value <- textField
#                    set bitLen [expr $bitMsb - $bitLsb + 1]
#                    set trimH [expr int(ceil(${bitLen}/4.0)*4)-1]
#                    set trimL [expr ${bitLen}%4]
#                    #puts "bitLen: ${bitLen} ${trimH} ${trimL}"
#                    set bitsValue [toolkit_get_property ${regName}${bitName}_textField text]
#                    #puts "bitsValue (raw): ${bitsValue}"
#                    set bitsValue [::mu3e::helpers::hex2bin $bitsValue]
#                    #puts "bitsValue (binary): ${bitsValue}"
#                    set bitsValue [::mu3e::helpers::binary_trim $bitsValue ${trimL} ${trimH}]
#                    #puts "bitsValue (trimmed): ${bitsValue}"
#                    set bitsValue [::mu3e::helpers::string_reverse $bitsValue]
#                    set regValue [string replace $regValue $bitLsb $bitMsb $bitsValue]
#                    #puts "write_lvds: field ${bitName}, value ${bitsValue}"   
#                }             
#            }
#        }
#        set regValue [::mu3e::helpers::parse_reverse_bit_stream ${regValue}]
#        #puts "write_lvds: get reg ${regName}, value *after is:${regValue}"
#        # master <- hex
#        #puts [expr ${lvds_base}+${regAddrOfst}]
#        #puts $regValue
#        master_write_32 $master_fd [expr ${lvds_base}+${regAddrOfst}] $regValue
#        
#        #puts "write_lvds: reg ${regName}, value ${}"
#    }
#    toolkit_send_message info "write_lvds: write registers done, byte~"
#    return -code ok
#
#}











;+++++++++++++++++++++++++++++++++++++++++++++++++++++++
; mx.rarserver
; Version: 2.1.4
; Developed by Bsk (Undernet)
; Release date: 2026-04-28
; Last update: 2026-09-20
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++
; Features: RAR Timeout, Multi-Network Support, Theme and Colors, DCC Transfer Monitor
; Smart Folder Naming, Queue Protection, Startup Cleanup, Worker Cleanup, Window Manager.
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++

;+ mxrarserver v2.1.4
;+ Optimized mxfinder.dll index handling for smoother searches and lower repeated processing.
;+ Fixed duplicate @find and @locator requests by applying the per-nick cooldown before queue insertion.
;+ Routed list-request confirmations through the dedicated buffered search output queue.
;+ Changed the default number of displayed search results to three while preserving the selectable 1–8 range.
;+ Added a branded CTCP VERSION response with the project description and official GitHub address.
;+ Cleaned temporary diagnostic output used during DLL performance testing.

;+ mxrarserver v2.1.3
;+ Improved channel and private-message request handling while preserving per-channel list assignments.
;+ Added buffered file lookup processing to prevent freezes during multiple simultaneous file requests.
;+ Updated Files, @find and @locator searches to require and validate mxfinder.dll v1.12 Win32.
;+ Added a shared @find/@locator queue, a five-second per-nick cooldown and asynchronous FindPack processing.
;+ Added persistent compact search indexing, a 25-query LRU cache and independent one-second result output.
;+ Added separate buffered output processing for @find, @locator, stats and transfer-status responses.
;+ Improved @find and @locator results for assigned Files, Folders and combined list configurations.
;+ Added on-demand Complete list generation with priority queue insertion for Files + Folders assignments.
;+ Added shared build protection to prevent Files, Folders and Complete operations from overlapping.
;+ Blocked list requests, file requests and searches while their assigned lists are being rebuilt.
;+ Added private !list, list requests and direct file requests using the user's assigned channel context.
;+ Added custom mxicons.dll icons for the main navigation tree and DCC transfer directions.
;+ Improved DCX text rendering with ClearType fonts across lists, previews, monitor and progress controls.
;+ Added monitor guard recovery to restart stalled refresh timers and remove completed DCC transfers.
;+ Improved simultaneous DCC send/receive monitoring, total speed reporting and final-state cleanup.
;+ Simplified DCX callbacks and cleaned internal UI, monitor and compression dialog handling.

;+ mxrarserver v2.1.2
;+ Stage 2 - Files, Assignments and shared request backend
;+ Replaced the main tabbed dialog with the DCX Treebar navigation layout.
;+ Connected Files and per-channel Assignments to the stable Folders, Queue, Themes and Statistics backend.
;+ Preserved internal timer units while displaying Ad interval in minutes and Output delay in seconds.
;+ Added Requests per Nick 1-200, Server slots 1-100 and simultaneous sends per Nick 1-5.
;+ Added direct file requests, scoped list access, !list, @find and @locator support.
;+ Converted mx.monitor to DCX listviews while preserving its original dialog size.
;+ Matched the main Queue column layout and added one combined active-transfer view for DCC sends and receives.
;+ Added shell32 direction icons and combined send/receive speed reporting in the monitor only.
;+ Added secure remote update checks through the official mxrarserver GitHub repository.
;+ Added size and SHA-256 verification, versioned backups and safe in-place script reload.

;+ mxrarserver v1.0.7
;+ Fixed trailing .rar path handling to remove only the final extension.
;+ Improved unload cleanup by clearing active runtime state when keeping configuration variables.
;+ Added runtime cleanup for stale DCC send-tracking and idle state on startup/unload.
;+ Fixed MXRARQ loss when mx.squeue exits early by rearming the normal queue delay on temporary blocks.
;+ Improved Attach support to update both RAR and ZIP archives using WinRAR, removing the dependency on 7-Zip.
;+ Added separate WinRAR GUI path variable for Attach operations to avoid using a hardcoded WinRAR.exe path.

;+ mxrarserver v1.0.6
;+ Fixed quoted temp queue writes for safer file handling.
;+ Fixed failed/timeout compression statistics.
;+ Fixed invalid drop attribute in mx.addchan list selector.
;+ Improved compression monitor safety by preventing visual refresh from clearing active job state.
;+ Added locked-file protection during directory purge.
;+ Improved DCC resume tracking to avoid false resume values.
;+ Fixed outgoing debug message timestamps to use 24-hour format.
;+ Fixed stale DCC sendclock variables cleanup when the DCC monitor guard stops the monitor.
;+ Fixed pending queue requests after JOIN to prevent immediate channel sending.
;+ Fixed mx.monitor queue label spacing.
;+ Added independent manual/startup cleanup for stale mxrar.exe and PublicListBuilder.exe workers.
;+ Improved startup protection against interrupted compression and PublicListBuilder jobs after unexpected mIRC shutdown.
;+ Removed obsolete startup compression recovery after adding hard worker cleanup.
;+ Improved cleanup to reset stale compression/build states safely without affecting normal operation.
;+ Improved failed compression cleanup by excluding manual/startup kills from failure statistics.
;+ Improved failed archive cleanup by deferring locked RAR deletion.
;+ Added startup cleanup by purging and recreating rarwork to remove stale compression residues.
;+ Improved size formatting for list totals and advertising messages.
;+ Fixed advertising delivery to send messages to connected networks and joined channels while skipping disconnected networks.
;+ Fixed queue send delay to start the next folder only after the configured interval while keeping recovery starts immediate.
;+ Added manual cancel controls for compression and list building jobs.
;+ Added Rarwork button and workdir selector dialog.
;+ Improved startup cleanup by killing stale workers before rebuilding the working directory.
;+ Increased default queue send delay for safer folder processing.
;+ Added No color mode to strip color/control codes from notice messages.
;+ Added No color mode in Themes to send cleaner notice messages without color/control codes, while channel ads remain unchanged.
;+ Improved RAR deletion handling with automatic retry notice for locked files.

;+ mxrarserver v1.0.5
;+ Added adjustable anti-flood delay for outgoing messages, increase the value to 5000 to improve flood protection.
;+ Improved flood protection by routing outgoing messages through the controlled queue system.
;+ Improved timer status detection for channel advertising and send queue.
;+ Added channel menu option to enable or disable local outgoing message display.
;+ Removed debug message shown every time the channel ad interval was updated.
;+ Improved unload cleanup by stopping all mxrarserver-related timers.
;+ Improved mx.monitor interface appearance.

;+ mxrarserver v1.0.4
;+ Fixed DCC Monitor elapsed time display bug when multiple transfers are active.
;+ Adjusted theme window size to improve theme preview visibility.
;+ Added build-in-progress notice for list and folder requests.

;+ mxrarserver v1.0.3
;+ Added options to keep metrics after hard reset 

;+ mxrarserver v1.0.2
;+ Fixed speed meter in ad message
;+ Added comma separators to improve the appearance of the advertising message.
;+ Fixed publiclist message display and formatting.
;+ Fixed Building dialog button alignment.

;+ mxrarserver v1.0.1
;+ Fixed mxbsk.dll 

dialog mx.rarserver {
  title "mx.rarserver v2.1.4 - Files and Folders Configuration"
  size -1 -1 330 190
  option dbu

  text "General settings", 701, 81 7 243 10
  text "File sharing", 702, 81 7 243 10
  text "Folder sharing", 703, 81 7 243 10
  text "Channel assignments", 704, 81 7 243 10
  text "Transfer queue", 705, 81 7 243 10
  text "Themes and colors", 708, 81 7 243 10
  text "Statistics", 706, 81 7 243 10

  box "Configuration", 199, 81 22 116 101
  check "Enable mx.rarserver", 121, 87 31 103 8
  check "Start queue on join", 122, 87 42 103 8
  check "Enable channel ads", 123, 87 54 103 8
  check "Show DCC events", 151, 87 65 103 8
  check "Send Channels CTCP", 152, 87 77 103 8
  check "Respond to !list", 835, 87 88 103 8
  check "Enable @find / @locator", 831, 87 100 103 8
  check "Prevent DCC overlap", 117, 87 111 103 8

  box "Trigger", 856, 81 126 116 22
  text "Nickname", 181, 88 136 28 8
  edit "", 182, 119 134 42 11, center autohs

  box "Limits / Timing", 130, 201 22 123 126
  text "Requests per Nick", 126, 207 33 73 8
  edit "", 127, 281 30 25 11, center autohs
  scroll "", 555, 307 30 9 11, range 1 201 pos 3 page 1
  text "Server slots", 135, 207 47 73 8
  edit "", 136, 281 44 25 11, center autohs
  scroll "", 444, 307 44 9 11, range 1 101 pos 3 page 1
  text "Simultaneous sends per Nick", 841, 207 62 73 8
  edit "", 843, 281 59 25 11, center autohs
  scroll "", 844, 307 59 9 11, range 1 6 pos 3 page 1
  text "Max @find results", 832, 207 76 73 8
  edit "", 833, 281 73 25 11, center autohs
  scroll "", 834, 307 73 9 11, range 1 9 pos 8 page 1
  text "Queue send delay (s)", 137, 207 90 73 8
  edit "", 138, 281 87 25 11, center autohs
  scroll "", 666, 307 87 9 11, range 3 61 pos 4 page 1
  text "Ad interval (min)", 142, 207 104 73 8
  edit "", 143, 281 101 25 11, center autohs
  scroll "", 888, 307 101 9 11, range 5 61 pos 5 page 1
  text "Output delay (s)", 146, 207 119 73 8
  edit "", 147, 281 116 25 11, center autohs
  scroll "", 1000, 307 116 9 11, range 5 31 pos 5 page 1
  text "Idle sleep (min)", 144, 207 133 73 8
  edit "", 145, 281 130 25 11, center autohs
  scroll "", 999, 307 130 9 11, range 5 31 pos 5 page 1
  box "Events", 176, 81 151 61 19
  text "Select", 174, 86 159 18 8
  combo 173, 108 158 28 42, drop

  box "Actions", 177, 164 151 160 19
  button "Monitor", 116, 169 157 29 10
  button "Windows", 118, 200 157 29 10
  button "Update", 178, 231 157 29 10
  button "Restart", 119, 262 157 29 10
  button "Reset", 120, 293 157 29 10

  box "Folder Lists", 200, 81 22 102 88
  button "Add", 202, 149 32 28 11
  button "Delete", 204, 149 44 28 11
  button "Build", 205, 149 56 28 11
  button "Build all", 206, 149 68 28 11
  button "Header", 207, 149 80 28 11
  button "Masterlist", 208, 149 92 28 11
  box "Assignments", 215, 81 113 102 57

  box "Shared Folder Directories", 210, 187 22 137 72
  button "Add", 212, 290 32 28 11
  button "Delete", 214, 290 49 28 11

  box "RAR Options", 150, 187 97 77 47
  check "Enable folder list", 124, 194 107 68 8
  check "Smart folder naming", 160, 194 118 68 8
  check "Compression monitor", 161, 194 129 68 8
  box "Compression", 857, 268 97 56 47
  text "Timeout", 139, 272 117 20 8
  edit "", 141, 297 114 18 11, center autohs
  scroll "", 777, 315 114 8 11, range 300 1210 pos 300 page 10
  box "Work directory", 854, 187 146 137 24
  button "Browse", 125, 190 155 24 11
  edit "", 855, 219 155 99 11, autohs read

  box "File Lists", 500, 81 22 102 88
  button "Add", 502, 149 32 28 11
  button "Delete", 503, 149 44 28 11
  button "Build", 504, 149 56 28 11
  button "Build all", 505, 149 68 28 11
  button "Header", 506, 149 80 28 11
  button "Masterlist", 507, 149 92 28 11
  box "Assignments", 515, 81 113 102 57

  box "Shared File Directories", 510, 187 22 137 59
  button "Add", 512, 290 32 28 11
  button "Delete", 513, 290 49 28 11

  box "File Options", 520, 187 84 137 86
  check "Enable file list", 521, 194 95 58 8
  check "Include subfolders", 522, 194 106 58 8
  check "Exclude hidden files", 523, 194 117 58 8
  text "Excluded extensions", 533, 260 94 63 8
  button "Add", 531, 194 136 28 11
  button "Delete", 532, 224 136 28 11

  box "Channel Assignments", 400, 81 22 243 88
  button "Add", 402, 284 34 34 11
  button "Edit", 403, 284 50 34 11
  button "Delete", 404, 284 66 34 11
  button "Refresh", 407, 284 82 34 11
  box "Assignment configuration", 420, 81 113 168 57

  text "Network", 421, 87 124 25 8
  edit "", 408, 113 122 50 11, autohs read
  text "Channel", 422, 166 124 27 8
  edit "", 409, 194 122 50 11, autohs read
  text "Files list", 423, 87 137 25 8
  combo 410, 113 135 50 34, drop
  text "Folders list", 424, 166 137 27 8
  combo 411, 194 135 50 34, drop
  text "List type", 426, 87 151 25 8
  edit "", 414, 113 149 50 11, autohs read

  box "Channel mode", 850, 254 113 70 57
  radio "Normal", 851, 261 124 51 8, group
  radio "Silent", 852, 261 138 51 8
  radio "Request only", 853, 261 152 51 8

  box "Queue overview", 860, 81 22 243 23
  text "Status: Running", 861, 88 31 48 8
  text "Active sends: 0 / 3", 862, 143 31 63 8
  text "Waiting: 0", 863, 218 31 39 8
  text "Total: 0", 864, 276 31 35 8

  button "Clear", 305, 84 154 37 11
  button "Delete", 304, 204 154 37 11
  button "Move up", 307, 244 154 37 11
  button "Move down", 308, 284 154 37 11

  box "Theme selection", 800, 81 22 87 22
  text "Theme", 801, 86 32 18 8
  combo 110, 105 31 57 52, drop
  box "No color", 812, 215 22 39 22
  check "Events", 108, 219 31 30 8
  box "No color", 813, 172 22 39 22
  check "Chan ads", 814, 177 31 30 8
  box "Theme", 815, 258 22 66 22
  box "Theme colors", 802, 81 46 243 36
  text "Color 1", 101, 87 54 39 8, center
  text "Color 2", 102, 132 54 39 8, center
  text "Color 3", 103, 177 54 39 8, center
  text "Color 4", 104, 222 54 39 8, center
  text "ASCII", 105, 267 54 51 8, center
  combo 115, 267 63 51 48, drop
  box "Advertisement preview", 803, 81 84 243 20
  box "Info / notice preview", 806, 81 106 243 20
  box "Advertisement text", 807, 81 128 243 39
  text "Start text", 808, 87 139 36 8
  edit "", 809, 125 138 193 10, autohs limit 100
  text "End text", 810, 87 152 36 8
  edit "", 811, 125 151 193 10, autohs limit 100
  button "Apply", 804, 262 30 28 10
  button "Reset", 805, 292 30 28 10

  text "Tracking since", 656, 81 24 43 8
  text "-", 657, 125 24 146 8
  button "Reset statistics", 655, 272 21 52 11

  box "Requests", 600, 81 34 58 22
  text "0", 602, 88 44 44 9, center

  box "Completed", 605, 143 34 58 22
  text "0", 606, 150 44 44 9, center

  box "Data sent", 611, 205 34 58 22
  text "0 B", 612, 212 44 44 9, center

  box "Average speed", 613, 266 34 58 22
  text "0 KB/s", 614, 273 44 44 9, center

  text "", 601, 0 0 1 1, hide
  text "", 603, 0 0 1 1, hide
  text "", 604, 0 0 1 1, hide
  text "", 607, 0 0 1 1, hide
  text "", 608, 0 0 1 1, hide
  text "", 609, 0 0 1 1, hide
  text "", 610, 0 0 1 1, hide

  box "Files", 640, 81 59 79 74
  text "Requests", 641, 86 67 38 8
  text "0", 642, 124 67 31 8, right
  text "Sent", 643, 86 78 38 8
  text "0", 644, 124 78 31 8, right
  text "Completed", 645, 86 89 38 8
  text "0", 646, 124 89 31 8, right
  text "Failed", 647, 86 101 38 8
  text "0", 648, 124 101 31 8, right
  text "Data sent", 651, 86 112 38 8
  text "0 B", 652, 124 112 31 8, right
  text "Success rate", 660, 86 123 38 8
  text "0%", 661, 124 123 31 8, right
  box "Lists", 904, 81 133 79 40
  text "List requested", 905, 86 141 45 8
  text "0", 906, 139 141 16 8, right
  text "List completed", 907, 86 152 45 8
  text "0", 908, 139 152 16 8, right
  text "List failed", 909, 86 163 45 8
  text "0", 910, 139 163 16 8, right
  box "Folders", 620, 165 59 79 114
  text "Requests", 621, 170 68 38 8
  text "0", 622, 208 68 30 8, right
  text "Started", 900, 170 79 38 8
  text "0", 901, 208 79 30 8, right
  text "Cancelled", 629, 170 89 38 8
  text "0", 630, 208 89 30 8, right
  text "Completed", 625, 170 100 38 8
  text "0", 626, 208 100 30 8, right
  text "Compressed", 633, 170 110 38 8
  text "0 B", 634, 208 110 30 8, right
  text "Sent", 623, 170 121 38 8
  text "0", 624, 208 121 30 8, right
  text "Finished", 902, 170 131 38 8
  text "0", 903, 208 131 30 8, right
  text "Failed", 627, 170 142 38 8
  text "0", 628, 208 142 30 8, right
  text "Transferred", 631, 170 152 38 8
  text "0 B", 632, 208 152 30 8, right
  text "Success rate", 658, 170 163 38 8
  text "0%", 659, 208 163 30 8, right
  box "Files", 911, 246 59 78 29
  text "Today", 912, 251 67 29 8
  text "0", 916, 282 67 8 8, right
  text "0 B", 913, 293 67 26 8, right
  text "Yesterday", 914, 251 78 29 8
  text "0", 917, 282 78 8 8, right
  text "0 B", 915, 293 78 26 8, right
  box "Folders", 918, 246 88 78 29
  text "Today", 919, 251 96 29 8
  text "0", 920, 282 96 8 8, right
  text "0 B", 921, 293 96 26 8, right
  text "Yesterday", 922, 251 107 29 8
  text "0", 923, 282 107 8 8, right
  text "0 B", 924, 293 107 26 8, right
  box "Total", 925, 246 117 78 29
  text "Today", 926, 251 125 29 8
  text "0", 927, 282 125 8 8, right
  text "0 B", 928, 293 125 26 8, right
  text "Yesterday", 929, 251 136 29 8
  text "0", 930, 282 136 8 8, right
  text "0 B", 931, 293 136 26 8, right

  text "mx.rarserver v2.1.4 - Stage 2", 707, 8 177 160 8
  text "", 709, 170 177 115 8, right
  button "Close", 109, 289 174 34 12, cancel
}


dialog mx.workdir {
  title "mx.rarserver - Workdir"
  size -1 -1 190 55
  option dbu
  box "Current workdir", 1, 6 5 178 28
  edit "", 2, 10 17 170 10, autohs read
  button "add directory", 3, 38 38 55 12
  button "close", 4, 100 38 40 12, cancel
}

on *:dialog:mx.workdir:init:*:{
  if (%mx.workdir) did -ra mx.workdir 2 %mx.workdir
  else did -ra mx.workdir 2 -
}

on *:dialog:mx.workdir:sclick:3:{
  var %dir = $sdir(%mx.workdir,Select mx.rarserver workdir)
  if (!%dir) return
  if ($right(%dir,1) != \) var %dir = %dir $+ \
  set %mx.workdir %dir
  did -ra mx.workdir 2 %mx.workdir
  if ($dialog(mx.rarserver)) did -ra mx.rarserver 855 %mx.workdir
  mx.dbg %mx.c1 Workdir updated: $+ %mx.c2 %mx.workdir %mx.nc
}

on *:dialog:mx.workdir:sclick:4: dialog -x mx.workdir

alias mx mx.cfg.open
alias mx.cfg.open { 
  if ($dialog(mx.rarserver)) return
  dialog -m mx.rarserver mx.rarserver
}

alias -l mx.main.dcx.path return $scriptdir $+ dll\DCX.dll
alias -l mx.main.pxw return $round($calc($1 * $dbuw),0)
alias -l mx.main.pxh return $round($calc($1 * $dbuh),0)

alias -l mx.main.dcx.call {
  if (!$isfile($mx.main.dcx.path)) return
  if (($1 == xdialog) && ($left($2,1) == -)) {
    dll $qt($mx.main.dcx.path) xdialog $3 $2 $4-
    return
  }
  if (($1 == xdid) && ($left($2,1) == -)) {
    dll $qt($mx.main.dcx.path) xdid $3 $4 $2 $5-
    return
  }
  dll $qt($mx.main.dcx.path) $1 $2-
}

alias -l mx.main.dcx.get {
  if (!$isfile($mx.main.dcx.path)) return
  returnex $dll($mx.main.dcx.path,_xdid,$1 $2 $prop $3-)
}

alias -l mx.main.lv.add {
  var %id = $1, %row = $2-
  if ((!%id) || (!%row)) return
  var %fg = $rgb(32,32,32), %bg = $rgb(255,255,255)
  var %cols = $numtok(%row,9)
  var %args = 0 0 + 0 0 0 0 %fg %bg $chr(160)
  var %i = 1
  while (%i <= %cols) {
    %args = %args $+ $chr(9) $+ + 0 -1 %fg %bg $gettok(%row,%i,9)
    inc %i
  }
  mx.main.dcx.call xdid -a mx.rarserver %id %args
}

alias -l mx.main.tree.create {
  if (!$dialog(mx.rarserver)) return 0
  if (!$isfile($mx.main.dcx.path)) {
    echo -s 04[mx.rarserver] DCX.dll not found: $mx.main.dcx.path
    return 0
  }
  mx.main.dcx.call Mark mx.rarserver mx.main.callback
  mx.main.dcx.call xdialog -c mx.rarserver 700 treeview 0 0 $mx.main.pxw(74) $mx.main.pxh(171) fullrow showsel noident nohscroll notooltips doublebuffer
  mx.main.dcx.call xdid -i mx.rarserver 700 +b $rgb(43,45,48)
  mx.main.dcx.call xdid -i mx.rarserver 700 +t $rgb(238,238,238)
  mx.main.dcx.call xdid -i mx.rarserver 700 +s $rgb(17,101,190)
  mx.main.dcx.call xdid -f mx.rarserver 700 +bc ansi 9 Segoe UI
  mx.main.dcx.call xdid -g mx.rarserver 700 48
  mx.main.dcx.call xdid -l mx.rarserver 700 24
  var %icons = $scriptdir $+ dll\mxicons.dll
  var %i = 2
  while (%i <= 9) {
    mx.main.dcx.call xdid -w mx.rarserver 700 +n %i $qt(%icons)
    inc %i
  }
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(1,$chr(9),+b 1 1 0 0 0 0 0 mx.rarserver,$chr(9),mx.rarserver)
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(2,$chr(9),+s 2 2 0 0 0 0 0 General,$chr(9),General)
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(3,$chr(9),+ 3 3 0 0 0 0 0 Files,$chr(9),Files)
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(4,$chr(9),+ 4 4 0 0 0 0 0 Folders,$chr(9),Folders)
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(5,$chr(9),+ 5 5 0 0 0 0 0 Assignments,$chr(9),Assignments)
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(6,$chr(9),+ 6 6 0 0 0 0 0 Queue,$chr(9),Queue)
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(7,$chr(9),+ 7 7 0 0 0 0 0 Themes,$chr(9),Themes)
  mx.main.dcx.call xdid -a mx.rarserver 700 $+(8,$chr(9),+ 8 8 0 0 0 0 0 Statistics,$chr(9),Statistics)
  mx.main.dcx.call xdialog -c mx.rarserver 201 listview $mx.main.pxw(87) $mx.main.pxh(32) $mx.main.pxw(58) $mx.main.pxh(70) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 201 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 201 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(56) List name
  mx.main.dcx.call xdialog -c mx.rarserver 216 listview $mx.main.pxw(87) $mx.main.pxh(123) $mx.main.pxw(90) $mx.main.pxh(39) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 216 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 216 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(32) Network $chr(9) +l 0 $mx.main.pxw(47) Channel
  mx.main.dcx.call xdialog -c mx.rarserver 211 listview $mx.main.pxw(194) $mx.main.pxh(32) $mx.main.pxw(92) $mx.main.pxh(54) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 211 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 211 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(90) Directory
  mx.main.dcx.call xdialog -c mx.rarserver 501 listview $mx.main.pxw(87) $mx.main.pxh(32) $mx.main.pxw(58) $mx.main.pxh(70) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 501 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 501 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(56) List name
  mx.main.dcx.call xdialog -c mx.rarserver 516 listview $mx.main.pxw(87) $mx.main.pxh(123) $mx.main.pxw(90) $mx.main.pxh(39) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 516 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 516 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(32) Network $chr(9) +l 0 $mx.main.pxw(47) Channel
  mx.main.dcx.call xdialog -c mx.rarserver 511 listview $mx.main.pxw(194) $mx.main.pxh(32) $mx.main.pxw(92) $mx.main.pxh(40) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 511 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 511 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(90) Directory
  mx.main.dcx.call xdialog -c mx.rarserver 535 listview $mx.main.pxw(260) $mx.main.pxh(104) $mx.main.pxw(56) $mx.main.pxh(58) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 535 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 535 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(54) Extension
  mx.main.dcx.call xdialog -c mx.rarserver 401 listview $mx.main.pxw(87) $mx.main.pxh(32) $mx.main.pxw(191) $mx.main.pxh(72) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 401 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 401 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(32) Network $chr(9) +l 0 $mx.main.pxw(48) Channel $chr(9) +l 0 $mx.main.pxw(33) Files $chr(9) +l 0 $mx.main.pxw(33) Folders $chr(9) +c 0 $mx.main.pxw(34) Type
  mx.main.dcx.call xdialog -c mx.rarserver 301 listview $mx.main.pxw(81) $mx.main.pxh(48) $mx.main.pxw(243) $mx.main.pxh(100) report fullrow singlesel grid showsel tooltips noheadersort hidden
  mx.main.dcx.call xdid -f mx.rarserver 301 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.rarserver 301 +l 0 0 $chr(160) $chr(9) +c 0 $mx.main.pxw(13) P $chr(9) +l 0 $mx.main.pxw(38) Nick $chr(9) +l 0 $mx.main.pxw(32) Network $chr(9) +c 0 $mx.main.pxw(24) Type $chr(9) +l 0 $mx.main.pxw(134) File / Folder / List
  mx.main.dcx.call xdialog -c mx.rarserver 111 colorcombo $mx.main.pxw(87) $mx.main.pxh(63) $mx.main.pxw(39) $mx.main.pxh(67) shownumbers hidden
  mx.main.dcx.call xdialog -c mx.rarserver 112 colorcombo $mx.main.pxw(132) $mx.main.pxh(63) $mx.main.pxw(39) $mx.main.pxh(67) shownumbers hidden
  mx.main.dcx.call xdialog -c mx.rarserver 113 colorcombo $mx.main.pxw(177) $mx.main.pxh(63) $mx.main.pxw(39) $mx.main.pxh(67) shownumbers hidden
  mx.main.dcx.call xdialog -c mx.rarserver 114 colorcombo $mx.main.pxw(222) $mx.main.pxh(63) $mx.main.pxw(39) $mx.main.pxh(67) shownumbers hidden
  mx.main.dcx.call xdid -m mx.rarserver 111
  mx.main.dcx.call xdid -m mx.rarserver 112
  mx.main.dcx.call xdid -m mx.rarserver 113
  mx.main.dcx.call xdid -m mx.rarserver 114
  mx.main.dcx.call xdialog -c mx.rarserver 820 text $mx.main.pxw(87) $mx.main.pxh(91) $mx.main.pxw(229) $mx.main.pxh(9) doublebuffer hidden
  mx.main.dcx.call xdid -f mx.rarserver 820 +c default 8 Segoe UI
  mx.main.dcx.call xdid -C mx.rarserver 820 +bk $rgb(255,255,255)
  mx.main.dcx.call xdialog -c mx.rarserver 821 text $mx.main.pxw(87) $mx.main.pxh(113) $mx.main.pxw(229) $mx.main.pxh(9) doublebuffer hidden
  mx.main.dcx.call xdid -f mx.rarserver 821 +c default 8 Segoe UI
  mx.main.dcx.call xdid -C mx.rarserver 821 +bk $rgb(255,255,255)
  return 1
}

alias -l mx.main.controls {
  var %mode = $1, %i = 2
  while ($gettok($1-,%i,32)) {
    var %id = $v1
    if ($istok(111 112 113 114 201 211 216 301 401 501 511 516 535 820 821,%id,32)) {
      if (%mode == hide) mx.main.dcx.call xdid -h mx.rarserver %id
      elseif (%mode == show) mx.main.dcx.call xdid -s mx.rarserver %id
    }
    else {
      if (%mode == hide) did -h mx.rarserver %id
      elseif (%mode == show) did -v mx.rarserver %id
    }
    inc %i
  }
}

alias -l mx.main.select {
  set %mx.main.navlock 1
  mx.main.dcx.call xdid -c mx.rarserver 700 $1
  unset %mx.main.navlock
}

alias mx.main.section {
  if (!$dialog(mx.rarserver)) return
  var %general = 701 199 121 122 123 151 152 173 174 181 182 831 832 833 834 835 841 843 844 856 117 130 135 136 444 126 127 555 137 138 666 142 143 888 144 145 999 146 147 1000 176 177 116 118 178 119 120
  var %folders = 703 200 201 202 204 205 206 207 208 215 216 210 211 212 214 150 124 160 161 857 139 141 777 854 855 125
  var %files = 702 500 501 502 503 504 505 506 507 515 516 510 511 512 513 520 521 522 523 531 532 533 535
  var %assign = 704 400 401 402 403 404 407 408 409 410 411 414 420 421 422 423 424 426 850 851 852 853
  var %queue = 705 301 304 305 307 308 860 861 862 863 864
  var %themes = 708 800 801 110 108 812 813 814 802 101 102 103 104 105 111 112 113 114 115 803 806 807 808 809 810 811 804 805 820 821 815
  var %stats = 706 656 657 655 600 602 605 606 611 612 613 614 640 641 642 643 644 645 646 647 648 651 652 660 661 620 621 622 623 624 902 903 900 901 625 626 627 628 629 630 633 634 631 632 658 659 904 905 906 907 908 909 910 911 912 913 914 915 916 917 918 919 920 921 922 923 924 925 926 927 928 929 930 931
  mx.main.controls hide %general
  mx.main.controls hide %folders
  mx.main.controls hide %files
  mx.main.controls hide %assign
  mx.main.controls hide %queue
  mx.main.controls hide %themes
  mx.main.controls hide %stats
  if ($1 == general) { mx.main.controls show %general | mx.main.select 2 | return }
  if ($1 == files) { mx.main.controls show %files | mx.main.select 3 | return }
  if ($1 == folders) { mx.main.controls show %folders | mx.main.select 4 | return }
  if ($1 == assignments) { mx.main.controls show %assign | mx.main.select 5 | return }
  if ($1 == queue) { mx.main.controls show %queue | mx.main.select 6 | mx.main.queue.summary | return }
  if ($1 == themes) { mx.main.controls show %themes | mx.main.select 7 | mx.main.theme.preview | return }
  if ($1 == statistics) { mx.main.controls show %stats | mx.main.select 8 | mx.main.stats.refresh }
}

alias mx.main.callback {
  if (($2 == sclick) && ($3 isnum 111-114)) {
    mx.main.theme.color.select $3 $4
    return
  }
  if (($2 == sclick) && ($3 == 201)) {
    mx.cfg.plb2.selchanged
    return
  }
  if (($2 == dclick) && ($3 == 201)) {
    mx.list.open
    return
  }
  if (($2 == sclick) && ($3 == 501)) {
    mx.files.selchanged
    return
  }
  if (($2 == dclick) && ($3 == 501)) {
    mx.files.list.open
    return
  }
  if (($2 == sclick) && ($3 == 401)) {
    mx.assignment.ui.loadsel
    return
  }
  if (%mx.main.navlock) return
  if ($2 != selchange) return
  if ($3 != 700) return
  if ($4 == 2) mx.main.section general
  elseif ($4 == 3) mx.main.section files
  elseif ($4 == 4) mx.main.section folders
  elseif ($4 == 5) mx.main.section assignments
  elseif ($4 == 6) mx.main.section queue
  elseif ($4 == 7) mx.main.section themes
  elseif ($4 == 8) mx.main.section statistics
}

alias mx.main.queue.summary {
  if (!$dialog(mx.rarserver)) return
  var %waiting = $iif($isfile(%mx.queue),$lines(%mx.queue),0)
  var %active = $send(0)
  if (%active !isnum) %active = 0
  var %max = $iif(%mx.maxsend isnum,%mx.maxsend,0)
  var %state = $iif(%mx.enabled != 1,Disabled,$iif(%mx.sleeping == 1,Sleeping,$iif($timer(MXRARQ).state == on,Running,Stopped)))
  did -ra mx.rarserver 861 Status: %state
  did -ra mx.rarserver 862 Active sends: %active / %max
  did -ra mx.rarserver 863 Waiting: %waiting
  did -ra mx.rarserver 864 Total: $calc(%active + %waiting)
}

alias mx.main.theme.init {
  if (!$dialog(mx.rarserver)) return
  if (!$did(mx.rarserver,110).lines) {
    didtok mx.rarserver 110 44 MX Classic,MX Dark,MX Neon,MX Ocean,MX Fire,MX Toxic,MX Cyberpunk,MX Matrix,MX Sunset,MX Ice,MX Plasma,MX Acid,Custom
  }
  if (!$did(mx.rarserver,115).lines) {
    didtok mx.rarserver 115 44 ■,~,»,«,•,-,*,+,=,·,_,:,!,?,/,\,#,@,&,^,<,>
  }
  did -u mx.rarserver 108,814
  if (%mx.nocolor == 1) did -c mx.rarserver 108
  if (%mx.ad.nocolor == 1) did -c mx.rarserver 814
  did -r mx.rarserver 809
  did -r mx.rarserver 811
  if (%mx.ad.start != $null) did -a mx.rarserver 809 %mx.ad.start
  if (%mx.ad.end != $null) did -a mx.rarserver 811 %mx.ad.end
  mx.main.theme.load
}

alias mx.main.theme.load {
  if (!$dialog(mx.rarserver)) return
  var %c1 = $mx.colors.num(%mx.c1)
  var %c2 = $mx.colors.num(%mx.c2)
  var %c3 = $mx.colors.num(%mx.c3)
  var %c4 = $int(%mx.c4)
  var %s
  set %mx.theme.sync 1
  %s = $didwm(mx.rarserver,110,%mx.theme,1) | if (%s isnum 1-) did -c mx.rarserver 110 %s
  mx.main.dcx.call xdid -c mx.rarserver 111 $calc(%c1 + 1)
  mx.main.dcx.call xdid -c mx.rarserver 112 $calc(%c2 + 1)
  mx.main.dcx.call xdid -c mx.rarserver 113 $calc(%c3 + 1)
  mx.main.dcx.call xdid -c mx.rarserver 114 $calc(%c4 + 1)
  %s = $didwm(mx.rarserver,115,%mx.cr,1) | if (%s isnum 1-) did -c mx.rarserver 115 %s
  unset %mx.theme.sync
  mx.main.theme.preview
}

alias mx.main.theme.apply {
  var %theme = $1-
  if ((!%theme) || (%theme == Custom)) return
  mx.colors.theme.apply %theme
  mx.main.theme.load
}

alias mx.main.theme.manual {
  if (!$dialog(mx.rarserver)) return
  var %fg1 = $calc($mx.main.dcx.get(mx.rarserver,111).sel - 1)
  var %fg2 = $calc($mx.main.dcx.get(mx.rarserver,112).sel - 1)
  var %fg3 = $calc($mx.main.dcx.get(mx.rarserver,113).sel - 1)
  var %bg = $calc($mx.main.dcx.get(mx.rarserver,114).sel - 1)
  var %asc = $did(mx.rarserver,115).seltext
  if ((%fg1 !isnum 0-99) || (%fg2 !isnum 0-99) || (%fg3 !isnum 0-99) || (%bg !isnum 0-99) || (!%asc)) return
  var %c1 = $right(00 $+ %fg1,2), %c2 = $right(00 $+ %fg2,2), %c3 = $right(00 $+ %fg3,2), %c4 = $right(00 $+ %bg,2)
  set %mx.c4 %c4
  set %mx.c1 $+($chr(3),%c1,$chr(44),%c4)
  set %mx.c2 $+($chr(3),%c2,$chr(44),%c4)
  set %mx.c3 $+($chr(3),%c3,$chr(44),%c4)
  set %mx.cr %asc
  set %mx.theme Custom
  var %custom = $didwm(mx.rarserver,110,Custom,1)
  if (%custom isnum 1-) did -c mx.rarserver 110 %custom
  mx.main.theme.preview
}

alias mx.main.theme.commit {
  if (!$dialog(mx.rarserver)) return
  var %theme = $did(mx.rarserver,110).seltext
  var %start = $did(mx.rarserver,809).text
  var %end = $did(mx.rarserver,811).text
  if (!%theme) return
  if (%start != $null) set %mx.ad.start %start
  else unset %mx.ad.start
  if (%end != $null) set %mx.ad.end %end
  else unset %mx.ad.end
  did -r mx.rarserver 809
  did -r mx.rarserver 811
  if (%start != $null) did -a mx.rarserver 809 %start
  if (%end != $null) did -a mx.rarserver 811 %end
  if ($lower(%theme) == custom) {
    mx.main.theme.manual
  }
  else {
    mx.main.theme.apply %theme
  }
  did -ra mx.rarserver 709 Theme applied: %mx.theme
}

alias -l mx.main.theme.color.select {
  if (%mx.theme.sync) return
  var %id = $1, %item = $2
  if ((%id !isnum 111-114) || (%item !isnum 1-100)) return
  var %color = $calc(%item - 1), %code = $right(00 $+ %color,2)
  if (%id == 111) set %mx.c1 $+($chr(3),%code,$chr(44),%mx.c4)
  elseif (%id == 112) set %mx.c2 $+($chr(3),%code,$chr(44),%mx.c4)
  elseif (%id == 113) set %mx.c3 $+($chr(3),%code,$chr(44),%mx.c4)
  elseif (%id == 114) {
    set %mx.c4 %code
    var %c1 = $right(00 $+ $mx.colors.num(%mx.c1),2), %c2 = $right(00 $+ $mx.colors.num(%mx.c2),2), %c3 = $right(00 $+ $mx.colors.num(%mx.c3),2)
    set %mx.c1 $+($chr(3),%c1,$chr(44),%code)
    set %mx.c2 $+($chr(3),%c2,$chr(44),%code)
    set %mx.c3 $+($chr(3),%c3,$chr(44),%code)
  }
  set %mx.theme Custom
  var %custom = $didwm(mx.rarserver,110,Custom,1)
  if (%custom isnum 1-) did -c mx.rarserver 110 %custom
  mx.main.theme.preview
}

alias mx.main.theme.preview {
  if (!$dialog(mx.rarserver)) return
  mx.main.dcx.call xdid -r mx.rarserver 820
  mx.main.dcx.call xdid -r mx.rarserver 821
  var %code1 = $right(00 $+ $mx.colors.num(%mx.c1),2), %code2 = $right(00 $+ $mx.colors.num(%mx.c2),2), %code3 = $right(00 $+ $mx.colors.num(%mx.c3),2), %code4 = $right(00 $+ $int(%mx.c4),2)
  var %c1 = $+($chr(3),%code1,$chr(44),%code4), %c2 = $+($chr(3),%code2,$chr(44),%code4), %c3 = $+($chr(3),%code3,$chr(44),%code4)
  var %start = $did(mx.rarserver,809).text
  var %end = $did(mx.rarserver,811).text
  var %admsg = %mx.c3 $+ %mx.cr $+ %mx.c1 Primary Text: $+ %mx.c2 Secondary Text %mx.c3 $+ %mx.cr
  if (%start != $null) {
    %admsg = %c1 $+ %start $+ $chr(32) $+ %admsg
  }
  if (%end != $null) {
    %admsg = %admsg $+ $chr(32) $+ %c1 $+ %end
  }
  var %infomsg = %c1 $+ Request accepted: $+ %c2 Example.mp3 %c3 $+ %mx.cr $+ %c1 Queue position: $+ %c2 1
  var %background = $color($int(%code4))
  if (%background !isnum) %background = $rgb(255,255,255)
  if (%mx.ad.nocolor == 1) {
    %admsg = $strip(%admsg,burc)
    mx.main.dcx.call xdid -C mx.rarserver 820 +bk $rgb(255,255,255)
  }
  else {
    mx.main.dcx.call xdid -C mx.rarserver 820 +bk %background
  }
  if (%mx.nocolor == 1) {
    %infomsg = $strip(%infomsg,burc)
    mx.main.dcx.call xdid -C mx.rarserver 821 +bk $rgb(255,255,255)
  }
  else {
    mx.main.dcx.call xdid -C mx.rarserver 821 +bk %background
  }
  %admsg = $+($chr(160),$chr(160),%admsg)
  %infomsg = $+($chr(160),$chr(160),%infomsg)
  mx.main.dcx.call xdid -t mx.rarserver 820 %admsg
  mx.main.dcx.call xdid -t mx.rarserver 821 %infomsg
}

alias mx.stats.transfer.add {
  var %b = $iif($1 isnum,$1,0)
  var %tick = $iif($2 isnum,$2,0)
  var %sec = $iif($3 isnum,$3,0)
  var %cps = $iif($4 isnum,$4,0)
  var %elapsed = 0
  var %source = none
  if (%sec > 0) {
    var %elapsed = %sec
    var %source = dcc-seconds
  }
  elseif ((%b > 0) && (%cps > 0)) {
    var %elapsed = $calc(%b / %cps)
    var %source = cps
  }
  elseif (%tick > 0) {
    var %elapsed = %tick
    var %source = tick
  }
  if ((%b <= 0) || (%elapsed <= 0)) {
    return
  }
  var %before = $iif(%mx.stats.transfer.seconds isnum,%mx.stats.transfer.seconds,0)
  var %after = $calc(%before + %elapsed)
  set %mx.stats.transfer.seconds %after
}

alias mx.main.stats.refresh {
  if (!$dialog(mx.rarserver)) return
  mx.stats.rollover
  var %folderReq = $iif(%mx.rarrequested isnum,%mx.rarrequested,0)
  var %folderStart = $iif(%mx.rarstart isnum,%mx.rarstart,0)
  var %folderDone = $iif(%mx.rarcompleted isnum,%mx.rarcompleted,0)
  var %folderSent = $iif(%mx.stats.folder.sent isnum,%mx.stats.folder.sent,0)
  var %folderDccDone = $iif(%mx.rarsent isnum,%mx.rarsent,0)
  var %folderFail = $iif(%mx.rarfail isnum,%mx.rarfail,0)
  var %folderCancel = $iif(%mx.stats.folder.cancelled isnum,%mx.stats.folder.cancelled,0)
  var %folderBytes = $iif(%mx.rartsent isnum,%mx.rartsent,0)
  var %compressedBytes = $iif(%mx.rarcobytes isnum,%mx.rarcobytes,0)
  var %fileReq = $iif(%mx.stats.file.requested isnum,%mx.stats.file.requested,0)
  var %fileSent = $iif(%mx.stats.file.sent isnum,%mx.stats.file.sent,0)
  var %fileDone = $iif(%mx.stats.file.completed isnum,%mx.stats.file.completed,0)
  var %fileFail = $iif(%mx.stats.file.failed isnum,%mx.stats.file.failed,0)
  var %fileBytes = $iif(%mx.stats.file.bytes isnum,%mx.stats.file.bytes,0)
  var %transferSecs = $iif(%mx.stats.transfer.seconds isnum,%mx.stats.transfer.seconds,0)
  var %generalAvg = 0
  if (%transferSecs > 0) {
    %generalAvg = $round($calc((%folderBytes + %fileBytes) / %transferSecs),0)
  }
  var %listReq = $iif(%mx.rlists isnum,%mx.rlists,0)
  var %listDone = $iif(%mx.clists isnum,%mx.clists,0)
  var %listFail = $iif(%mx.flists isnum,%mx.flists,0)
  var %fileTodayCount = $iif(%mx.stats.file.daycount isnum,%mx.stats.file.daycount,0)
  var %fileTodayBytes = $iif(%mx.stats.file.daybytes isnum,%mx.stats.file.daybytes,0)
  var %fileYesterdayCount = $iif(%mx.stats.file.yesterdaycount isnum,%mx.stats.file.yesterdaycount,0)
  var %fileYesterdayBytes = $iif(%mx.stats.file.yesterdaybytes isnum,%mx.stats.file.yesterdaybytes,0)
  var %folderTodayCount = $iif(%mx.stats.folder.daycount isnum,%mx.stats.folder.daycount,0)
  var %folderTodayBytes = $iif(%mx.rardsent isnum,%mx.rardsent,0)
  var %folderYesterdayCount = $iif(%mx.stats.folder.yesterdaycount isnum,%mx.stats.folder.yesterdaycount,0)
  var %folderYesterdayBytes = $iif(%mx.rarysent isnum,%mx.rarysent,0)
  var %totalTodayCount = $calc(%fileTodayCount + %folderTodayCount)
  var %totalTodayBytes = $calc(%fileTodayBytes + %folderTodayBytes)
  var %totalYesterdayCount = $calc(%fileYesterdayCount + %folderYesterdayCount)
  var %totalYesterdayBytes = $calc(%fileYesterdayBytes + %folderYesterdayBytes)
  var %folderRate = $iif(%folderReq > 0,$round($calc((%folderDccDone / %folderReq) * 100),1),0)
  var %fileRate = $iif(%fileReq > 0,$round($calc((%fileDone / %fileReq) * 100),1),0)
  if (%mx.loaded.time == $null) { set %mx.loaded.time $asctime(yyyy-mm-dd HH:nn:ss) }
  did -ra mx.rarserver 657 %mx.loaded.time
  did -ra mx.rarserver 602 $calc(%folderReq + %fileReq)
  did -ra mx.rarserver 606 $calc(%folderDccDone + %fileDone)
  did -ra mx.rarserver 612 $mx.bytes($calc(%folderBytes + %fileBytes))
  did -ra mx.rarserver 614 $mx.speed(%generalAvg)
  did -ra mx.rarserver 642 %fileReq
  did -ra mx.rarserver 644 %fileSent
  did -ra mx.rarserver 646 %fileDone
  did -ra mx.rarserver 648 %fileFail
  did -ra mx.rarserver 652 $mx.bytes(%fileBytes)
  did -ra mx.rarserver 661 $+(%fileRate,$chr(37))
  did -ra mx.rarserver 622 %folderReq
  did -ra mx.rarserver 901 %folderStart
  did -ra mx.rarserver 626 %folderDone
  did -ra mx.rarserver 624 %folderSent
  did -ra mx.rarserver 903 %folderDccDone
  did -ra mx.rarserver 628 %folderFail
  did -ra mx.rarserver 630 %folderCancel
  did -ra mx.rarserver 634 $mx.bytes(%compressedBytes)
  did -ra mx.rarserver 632 $mx.bytes(%folderBytes)
  did -ra mx.rarserver 659 $+(%folderRate,$chr(37))
  did -ra mx.rarserver 906 %listReq
  did -ra mx.rarserver 908 %listDone
  did -ra mx.rarserver 910 %listFail
  did -ra mx.rarserver 916 %fileTodayCount
  did -ra mx.rarserver 913 $mx.bytes(%fileTodayBytes)
  did -ra mx.rarserver 917 %fileYesterdayCount
  did -ra mx.rarserver 915 $mx.bytes(%fileYesterdayBytes)
  did -ra mx.rarserver 920 %folderTodayCount
  did -ra mx.rarserver 921 $mx.bytes(%folderTodayBytes)
  did -ra mx.rarserver 923 %folderYesterdayCount
  did -ra mx.rarserver 924 $mx.bytes(%folderYesterdayBytes)
  did -ra mx.rarserver 927 %totalTodayCount
  did -ra mx.rarserver 928 $mx.bytes(%totalTodayBytes)
  did -ra mx.rarserver 930 %totalYesterdayCount
  did -ra mx.rarserver 931 $mx.bytes(%totalYesterdayBytes)
}

alias -l mx.sent.isfolderrar {
  var %file = $lower($mx.path.norm($1-)), %work = $lower($mx.path.norm(%mx.workdir))
  if ((!%file) || (!%work)) return 0
  return $mx.path.under(%file,%work)
}

alias mx.stats.file.sentok {
  var %file = $1-
  mx.stats.rollover
  inc %mx.stats.file.completed
  inc %mx.stats.file.daycount
  if ($isfile(%file)) {
    var %bytes = $file(%file).size
    inc %mx.stats.file.bytes %bytes
    inc %mx.stats.file.daybytes %bytes
  }
}

alias mx.stats.file.fail {
  mx.stats.rollover
  inc %mx.stats.file.failed
  mx.main.stats.refresh
}

alias mx.stats.folder.fail {
  mx.stats.rollover
  inc %mx.rarfail
  mx.main.stats.refresh
}

alias mx.main.stats.reset {
  if ($input(Reset all mx.rarserver statistics?,yn,MXRAR Statistics) != $true) return
  unset %mx.rarrequested
  unset %mx.rarstart
  unset %mx.rarcompleted
  unset %mx.rarsent
  unset %mx.rarfail
  unset %mx.rarcobytes
  unset %mx.rartsent
  unset %mx.rardsent
  unset %mx.rarysent
  unset %mx.rarbmsent
  unset %mx.rarbysent
  unset %mx.rlists
  unset %mx.clists
  unset %mx.flists
  unset %mx.stats.*
  mx.stats.init
  mx.main.stats.refresh
}

alias -l dmx.core {
  if (!$dialog(mx.rarserver)) return
  var %tr = $strip($did(mx.rarserver,182).text)
  if (%tr) set %mx.trigger %tr
  set %mx.enabled $did(mx.rarserver,121).state
  set %mx.join $did(mx.rarserver,122).state
  set %mx.ads $did(mx.rarserver,123).state
  set %mx.list $did(mx.rarserver,124).state
  set %mx.adcc $did(mx.rarserver,151).state
  set %mx.ctcp.channels $did(mx.rarserver,152).state
  set %mx.waitdcc $did(mx.rarserver,117).state
  set %mx.smart $did(mx.rarserver,160).state
  set %mx.compress $did(mx.rarserver,161).state  
  set %mx.respond.list $did(mx.rarserver,835).state
  set %mx.find.enabled $did(mx.rarserver,831).state
  var %mode = $did(mx.rarserver,173).sel
  if ((%mode !isnum 1-3)) %mode = 1
  set %mx.wdebug $calc(%mode - 1)
  set %mx.debug $iif(%mx.wdebug == 0,0,1)
}

alias -l mx.dcc.waiting {
  var %i = 1
  var %total = $send(0)
  while (%i <= %total) {
    if ($send(%i).status == waiting) return 1
    inc %i
  }
  return 0
}

alias dmx.queue.count return $iif($isfile(%mx.queue),$lines(%mx.queue),0)

alias -l mx.queue.make {
  var %nick = $1
  var %net = $2
  var %mode = $lower($3)
  var %payload = $4-
  if (!$istok(normal silent ctcp,%mode,32)) {
    %mode = normal
    %payload = $3-
  }
  if ((!%nick) || (!%net) || (!%payload)) return
  return %nick $+ $chr(9) $+ %net $+ $chr(9) $+ %mode $+ $chr(9) $+ %payload
}

alias -l mx.queue.nick return $gettok($1-,1,9)
alias -l mx.queue.net return $gettok($1-,2,9)
alias -l mx.queue.mode {
  var %mode = $lower($gettok($1-,3,9))
  return $iif($istok(normal silent ctcp,%mode,32),%mode,normal)
}

alias -l mx.queue.payload {
  var %line = $1-
  var %mode = $lower($gettok(%line,3,9))
  if ($istok(normal silent ctcp,%mode,32)) return $gettok(%line,4-,9)
  return $gettok(%line,3-,9)
}

alias -l mx.queue.ui {
  var %line = $1-
  if (!%line) return
  var %nick = $mx.queue.nick(%line)
  var %net = $mx.queue.net(%line)
  var %payload = $mx.queue.payload(%line)
  if ((!%nick) && (!%net) && (!%payload)) return %line
  if ($mx.complete.job.is(%payload)) {
    var %display = $mx.complete.job.display(%payload)
    return %nick $+  @  $+ %net $+  -> [Complete]  $+ %display
  }
  return %nick $+  @  $+ %net $+  ->  $+ %payload
}

alias -l mx.queue.lock.acquire {
  var %owner = $1-
  if (!%owner) var %owner = unknown
  if (%mx.queue.lock) {
    if ((%mx.queue.lockts isnum) && ($calc($ctime - %mx.queue.lockts) > 15)) {
      mx.dbg %mx.c1 Queue lock expired, forcing release. Previous owner: %mx.c2 %mx.queue.lock %mx.nc
      unset %mx.queue.lock
      unset %mx.queue.lockts
    }
  }
  if (%mx.queue.lock) return 0
  set %mx.queue.lock %owner
  set %mx.queue.lockts $ctime
  return 1
}

alias -l mx.queue.lock.release {
  var %owner = $1-
  if (!%mx.queue.lock) return 1
  if (%owner) {
    if ($lower(%mx.queue.lock) != $lower(%owner)) {
      mx.dbg %mx.c1 Queue lock release ignored. Current owner: %mx.c2 %mx.queue.lock %mx.c1 Requested by: %mx.c2 %owner %mx.nc
      return 0
    }
  }
  unset %mx.queue.lock
  unset %mx.queue.lockts
  return 1
}

alias -l mx.queue.lock.touch { if (%mx.queue.lock) set %mx.queue.lockts $ctime }
alias -l mx.queue.locked return $iif(%mx.queue.lock,1,0)
alias mx.queue.unlock {
  if (%mx.queue.lock) mx.dbg %mx.c1 Manual queue unlock. Previous owner: %mx.c2 %mx.queue.lock %mx.nc
  unset %mx.queue.lock
  unset %mx.queue.lockts
}

alias -l dmx.ads {
  if (%mx.ads == 1) mx.start.adx
  else .timermxads off
}

alias -l dmx.debug mx.debug.win.set %mx.wdebug

alias -l dmx.route {
  if (($1 == 117) || ($1 == 121) || ($1 == 122) || ($1 == 123) || ($1 == 124) || ($1 == 151) || ($1 == 152) || ($1 == 160) || ($1 == 161) || ($1 == 173) || ($1 == 182) || ($1 == 831) || ($1 == 835)) {
    dmx.core
    dmx.debug
    mx.apply.runtime
    if ($1 == 151) {
      if (%mx.adcc == 1) {
        mx.dcc.win.open
      }
      else {
        if ($window(@mx.dcc.win)) window -c @mx.dcc.win
      }
    }
    return
  }
}

on *:dialog:mx.rarserver:edit:182:{
  if (%mx.ui.init) return
  dmx.core
}

alias -l mx.list.open {
  if (!$dialog(mx.rarserver)) return
  mx.cfg.vars.defaults
  var %pl = $mx.cfg.pl.name.sanitize($mx.main.dcx.get(mx.rarserver,201,2).seltext)
  if (!%pl) return
  var %txt = %mx.plbase $+ \ $+ %pl $+ \ $+ %pl $+ -MX.txt
  if ($isfile(%txt)) {
    run $qt(%txt)
    return
  }
  var %f1 = $findfile(%mx.plbase,%pl $+ -MX.txt,1)
  if ($isfile(%f1)) {
    run $qt(%f1)
    return
  }
  var %f2 = $findfile(%mx.plbase,%pl $+ (*)-MX.txt,1)
  if ($isfile(%f2)) {
    run $qt(%f2)
    return
  }
  var %f3 = $findfile(%mx.plbase,* $+ %pl $+ *-MX.txt,1)
  if ($isfile(%f3)) {
    run $qt(%f3)
    return
  }
  mx.dbg %mx.c2 Error: $+ %mx.c1 File txt not found for list: $+ %mx.c2 %pl %mx.nc
}

on *:dialog:mx.rarserver:sclick:*:{
  if (%mx.ui.pending.edit) mx.ui.commit %mx.ui.pending.edit
  if (%mx.ui.lock == 1) return
  if (%mx.ui.init == 1) return
  mx.ui.commit.active $did
  if (($did == 136) || ($did == 127) || ($did == 843) || ($did == 833) || ($did == 138) || ($did == 141) || ($did == 143) || ($did == 145) || ($did == 147)) {
    set %mx.ui.active $did
    return
  }
  if (($did == 117) || ($did == 121) || ($did == 122) || ($did == 123) || ($did == 124) || ($did == 151) || ($did == 152) || ($did == 160) || ($did == 161) || ($did == 173) || ($did == 831) || ($did == 835)) {
    dmx.route $did
    return
  }
  if ($did == 109) { dialog -x mx.rarserver | return }
  if ($did == 116) { mx.monitor.open | return }
  if ($did == 118) { mx.windows.open | return }
  if ($did == 119) { mx.restart | return }
  if ($did == 120) { mx.hardreset | return }
  if ($did == 125) { mx.workdir.open | return }
  if ($did == 178) { mx.update.button | return }
  if ($did == 202) { mx.cfg.pl.add | return }
  if ($did == 204) { mx.cfg.pl.del | return }
  if ($did == 205) { mx.build.busy selected | return }
  if ($did == 206) { mx.build.busy all | return }
  if ($did == 207) { if (%mx.publicroot) run notepad $qt(%mx.publicroot $+ \header.txt) | return }
  if ($did == 208) { if (%mx.masterlist) run notepad $qt(%mx.masterlist) | return }
  if ($did == 212) { mx.cfg.dir.add | return }
  if ($did == 214) { mx.cfg.dir.del | return }
  if ($did == 502) { mx.files.pl.add | return }
  if ($did == 503) { mx.files.pl.del | return }
  if ($did == 504) { mx.files.build selected | return }
  if ($did == 505) { mx.files.build all | return }
  if ($did == 506) { if (%mx.publicroot) run notepad $qt(%mx.publicroot $+ \header.txt) | return }
  if ($did == 507) { if (%mx.files.masterlist) run notepad $qt(%mx.files.masterlist) | return }
  if ($did == 512) { mx.files.dir.add | return }
  if ($did == 513) { mx.files.dir.del | return }
  if ($did == 521) { set %mx.files.list $did($dname,521).state | mx.assignment.sync | return }
  if ($did == 522) { set %mx.files.subfolders $did($dname,522).state | return }
  if ($did == 523) { set %mx.files.excludehidden $did($dname,523).state | return }
  if ($did == 531) { mx.files.ext.add | return }
  if ($did == 532) { mx.files.ext.del | return }
  if ($did == 402) { mx.cfg.chan.add | return }
  if ($did == 403) { mx.cfg.chan.edit | return }
  if ($did == 404) { mx.assignment.delete | return }
  if ($did == 407) { mx.assignment.refresh | return }
  if (($did == 410) || ($did == 411) || ($did isnum 851-853)) { mx.assignment.ui.changed | return }
  if ($did == 304) { mx.queue.remove mx.rarserver | mx.main.queue.summary | return }
  if ($did == 305) { dmx.queue.clear | return }
  if ($did == 307) { mx.queue.move up mx.rarserver | mx.main.queue.summary | return }
  if ($did == 308) { mx.queue.move down mx.rarserver | mx.main.queue.summary | return }
  if ($did == 110) { mx.main.theme.apply $did($dname,110).seltext | return }
  if ($did == 115) { mx.main.theme.manual | return }
  if ($did == 108) { set %mx.nocolor $did($dname,108).state | mx.main.theme.preview | return }
  if ($did == 814) { set %mx.ad.nocolor $did($dname,814).state | mx.main.theme.preview | return }
  if ($did == 804) { mx.main.theme.commit | return }
  if ($did == 805) { mx.main.theme.apply MX Classic | return }
  if ($did == 655) { mx.main.stats.reset | return }
}

on *:dialog:mx.rarserver:edit:809:{
  if (%mx.ui.init) return
  mx.main.theme.preview
}

on *:dialog:mx.rarserver:edit:811:{
  if (%mx.ui.init) return
  mx.main.theme.preview
}

alias -l mx.cfg.dbfile return %mx.database

alias mx.cfg.ui.load {
  if (!$dialog(mx.rarserver)) return
  mx.cfg.vars.defaults
  set %mx.ad.minutes $round($calc(%mx.adstime / 60),0)
  set %mx.out.seconds $round($calc(%mx.out.delay / 1000),0)
  did -u mx.rarserver 117
  did -u mx.rarserver 121
  did -u mx.rarserver 122
  did -u mx.rarserver 123
  did -u mx.rarserver 124
  did -u mx.rarserver 151
  did -u mx.rarserver 152
  did -u mx.rarserver 160
  did -u mx.rarserver 161
  did -u mx.rarserver 831
  did -u mx.rarserver 835
  did -u mx.rarserver 521
  did -u mx.rarserver 522
  did -u mx.rarserver 523
  did -ra mx.rarserver 127 %mx.maxrequest
  did -ra mx.rarserver 136 %mx.maxsend
  did -ra mx.rarserver 843 %mx.maxpernick
  did -ra mx.rarserver 833 %mx.maxfind
  did -ra mx.rarserver 138 %mx.sendinterval
  did -ra mx.rarserver 141 %mx.rartimeout
  did -ra mx.rarserver 143 %mx.ad.minutes
  did -ra mx.rarserver 145 %mx.idle.sleep
  did -ra mx.rarserver 147 %mx.out.seconds
  did -ra mx.rarserver 182 %mx.trigger
  did -ra mx.rarserver 855 %mx.workdir
  if (%mx.waitdcc == 1) did -c mx.rarserver 117
  if (%mx.enabled == 1) did -c mx.rarserver 121
  if (%mx.join == 1) did -c mx.rarserver 122
  if (%mx.ads == 1) did -c mx.rarserver 123
  if (%mx.list == 1) did -c mx.rarserver 124
  if (%mx.adcc == 1) did -c mx.rarserver 151
  if (%mx.ctcp.channels == 1) did -c mx.rarserver 152
  if (%mx.smart == 1) did -c mx.rarserver 160
  if (%mx.compress == 1) did -c mx.rarserver 161
  if (%mx.find.enabled == 1) did -c mx.rarserver 831
  if (%mx.respond.list == 1) did -c mx.rarserver 835
  if (%mx.files.list == 1) did -c mx.rarserver 521
  if (%mx.files.subfolders == 1) did -c mx.rarserver 522
  if (%mx.files.excludehidden == 1) did -c mx.rarserver 523
  did -r mx.rarserver 173
  did -a mx.rarserver 173 none
  did -a mx.rarserver 173 echo
  did -a mx.rarserver 173 win
  if ((%mx.wdebug !isnum 0-2)) set %mx.wdebug 0
  set %mx.debug $iif(%mx.wdebug == 0,0,1)
  did -c mx.rarserver 173 $calc(%mx.wdebug + 1)
  mx.cfg.plb2.refresh
  mx.files.refresh
  mx.assignment.ui.init
  mx.assignment.refresh
  if ($mx.main.dcx.get(mx.rarserver,401).num > 0) { mx.main.dcx.call xdid -c mx.rarserver 401 1 | mx.assignment.ui.loadsel }
  else mx.assignment.ui.new
  mx.cfg.queue.refresh
  mx.main.theme.init
  mx.main.stats.refresh
  mx.main.queue.summary
  mx.ui.scroll.initall
  mx.update.ui
}

alias mx.cfg.plb2.refresh {
  if (!$dialog(mx.rarserver)) return
  mx.main.dcx.call xdid -r mx.rarserver 211
  mx.main.dcx.call xdid -r mx.rarserver 216
  mx.assignment.repeat.refresh folders
  mx.ui.publiclists.load mx.rarserver 201
  if ($mx.main.dcx.get(mx.rarserver,201).num > 0) {
    if (!$mx.main.dcx.get(mx.rarserver,201).sel) mx.main.dcx.call xdid -c mx.rarserver 201 1
    mx.cfg.plb2.selchanged
  }
}

alias mx.cfg.plb2.selchanged {
  if (!$dialog(mx.rarserver)) return
  mx.main.dcx.call xdid -r mx.rarserver 211
  var %pl = $lower($strip($mx.main.dcx.get(mx.rarserver,201,2).seltext))
  mx.assignment.repeat.refresh folders %pl
  if (!%pl) return
  var %db = $mx.cfg.dbfile
  if ($isfile(%db)) {
    var %i = 1
    while ($read(%db,n,%i)) {
      var %l = $ifmatch
      var %name = $lower($strip($gettok(%l,1,124)))
      if (%name == %pl) {
        var %p = $strip($gettok(%l,2-,124))
        if (%p) mx.main.lv.add 211 %p
      }
      inc %i
    }
  }
}

;==============================================================================
; FILE LISTS
;==============================================================================

alias -l mx.files.selected {
  if (!$dialog(mx.rarserver)) return
  return $strip($mx.main.dcx.get(mx.rarserver,501,2).seltext)
}

alias -l mx.files.ext.selected {
  if (!$dialog(mx.rarserver)) return
  return $lower($strip($mx.main.dcx.get(mx.rarserver,535,2).seltext))
}

alias mx.files.db.init {
  mx.cfg.vars.defaults
  if (!$isdir(%mx.files.base)) mkdir %mx.files.base
  if (!$isdir(%mx.files.public)) mkdir %mx.files.public
  if (!$isfile(%mx.files.database)) write -c $qt(%mx.files.database)
  if (!$isfile(%mx.files.conf)) write -c $qt(%mx.files.conf)
  if (!$isfile(%mx.files.plnames)) write -c $qt(%mx.files.plnames)
}

alias mx.files.refresh {
  if (!$dialog(mx.rarserver)) return
  mx.files.db.init
  mx.main.dcx.call xdid -r mx.rarserver 501
  mx.main.dcx.call xdid -r mx.rarserver 511
  mx.main.dcx.call xdid -r mx.rarserver 516
  var %i = 1
  while ($read(%mx.files.plnames,n,%i)) {
    var %name = $strip($ifmatch)
    if (%name) mx.main.lv.add 501 %name
    inc %i
  }
  if ($mx.main.dcx.get(mx.rarserver,501).num > 0) {
    mx.main.dcx.call xdid -c mx.rarserver 501 1
    mx.files.selchanged
  }
  mx.files.ext.refresh
}

alias mx.files.selchanged {
  if (!$dialog(mx.rarserver)) return
  mx.main.dcx.call xdid -r mx.rarserver 511
  var %pl = $lower($mx.files.selected)
  mx.assignment.repeat.refresh files %pl
  if (!%pl) return
  var %i = 1
  while ($read(%mx.files.database,n,%i)) {
    var %row = $ifmatch
    if ($lower($strip($gettok(%row,1,124))) == %pl) {
      var %dir = $strip($gettok(%row,2-,124))
      if (%dir) mx.main.lv.add 511 %dir
    }
    inc %i
  }
}

alias mx.files.pl.add {
  mx.files.db.init
  var %name = $mx.cfg.pl.name.sanitize($input(File list name,eg,Add File List))
  if (!%name) return
  if ($read(%mx.files.plnames,nw,%name)) { mx.dbg %mx.c1 File list already exists: %mx.c2 %name %mx.nc | return }
  write $qt(%mx.files.plnames) %name
  mx.files.refresh
  mx.main.dcx.call xdid -c mx.rarserver 501 $mx.main.dcx.get(mx.rarserver,501).num
  mx.files.selchanged
  mx.assignment.ui.init
}

alias mx.files.pl.del {
  if (!$dialog(mx.rarserver)) return
  var %pl = $mx.main.dcx.get(mx.rarserver,501,2).seltext
  if (!%pl) return
  var %pl2 = $mx.cfg.pl.name.sanitize(%pl)
  if (!%pl2) return
  if ($input(Delete %pl2 $+ ?,yn,Delete File List) != $true) return
  mx.assignment.list.purge files %pl2
  if ($isfile(%mx.files.plnames) && $read(%mx.files.plnames,w,%pl2)) {
    write -dl $readn %mx.files.plnames
  }
  mx.files.pl.del.dbfile %pl2
  var %dir = %mx.files.public $+ \ $+ %pl2
  if ($isdir(%dir)) {
    mx.cfg.dir.purge %dir
  }
  mx.dbg %mx.c1 File list removed successfully: $+ %mx.c2 %pl2 %mx.nc
  mx.files.refresh
}

alias -l mx.files.pl.del.dbfile {
  var %db = %mx.files.database
  if (!$isfile(%db)) return
  var %name = $mx.cfg.pl.name.sanitize($1-)
  if (!%name) return
  var %tmp = $scriptdir $+ files_dirs.del.tmp
  write -c $qt(%tmp)
  var %i = 1
  while ($read(%db,n,%i)) {
    var %l = $ifmatch
    if ($lower($gettok(%l,1,124)) != $lower(%name)) {
      write $qt(%tmp) %l
    }
    inc %i
  }
  if (!$isfile(%tmp)) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Database delete aborted, temp file missing. %mx.nc
    return
  }
  var %bak = %db $+ .bak.del
  if ($isfile(%bak)) .remove $qt(%bak)
  .rename $qt(%db) $qt(%bak)
  if (!$isfile(%bak)) {
    .remove $qt(%tmp)
    mx.dbg %mx.c2 Error: %mx.c1 $+ Database delete aborted, backup failed: $+ %mx.c2 %db %mx.nc
    return
  }
  .rename $qt(%tmp) $qt(%db)
  if (!$isfile(%db)) {
    .rename $qt(%bak) $qt(%db)
    mx.dbg %mx.c2 Error: %mx.c1 $+ Database restore executed after rename failure. %mx.nc
    return
  }
  if ($isfile(%bak)) .remove $qt(%bak)
}

alias mx.files.dir.add {
  var %pl = $mx.files.selected
  if ((!%pl) && ($mx.main.dcx.get(mx.rarserver,501).num > 0)) {
    mx.main.dcx.call xdid -c mx.rarserver 501 1
    %pl = $mx.files.selected
  }
  if (!%pl) {
    mx.dbg %mx.c2 Error: $+ %mx.c1 Select a File list before adding a directory. %mx.nc
    return
  }
  var %start = %mx.last.filesdir
  if ((!%start) || (!$isdir(%start))) %start = %mx.workdir
  if ((!%start) || (!$isdir(%start))) %start = $mircdir
  var %dir = $sdir(%start,Select shared file directory)
  if (!%dir) return
  %dir = $mx.path.norm(%dir)
  if (!$isdir(%dir)) return
  var %i = 1
  while ($read(%mx.files.database,n,%i)) {
    var %row = $ifmatch
    if (($lower($gettok(%row,1,124)) == $lower(%pl)) && ($lower($mx.path.norm($gettok(%row,2-,124))) == $lower(%dir))) return
    inc %i
  }
  set %mx.last.filesdir %dir
  write $qt(%mx.files.database) $+(%pl,$chr(124),%dir)
  mx.files.selchanged
}

alias mx.files.dir.del {
  if (!$dialog(mx.rarserver)) return
  var %pl = $mx.cfg.pl.name.sanitize($mx.main.dcx.get(mx.rarserver,501,2).seltext)
  if (!%pl) return
  var %path = $mx.main.dcx.get(mx.rarserver,511,2).seltext
  if (!%path) return
  var %ok = $input(Remove this directory? $+ $crlf $+ %path,yn,Remove Dir)
  if (%ok != $true) return
  var %db = %mx.files.database
  if (!$isfile(%db)) return
  var %tmp = $scriptdir $+ files_dirs.delone.tmp
  write -c $qt(%tmp)
  var %i = 1, %found = 0
  while ($read(%db,n,%i)) {
    var %l = $ifmatch
    if (($gettok(%l,1,124) == %pl) && ($gettok(%l,2-,124) == %path)) {
      %found = 1
    }
    else {
      write $qt(%tmp) %l
    }
    inc %i
  }
  if (!%found) {
    .remove $qt(%tmp)
    mx.dbg %mx.c1 No match, nothing removed %mx.nc
    return
  }
  .remove $qt(%db)
  .rename $qt(%tmp) $qt(%db)
  mx.dbg %mx.c1 Directory $+ %mx.c2 %path %mx.c1 $+ has been removed from file list: $+ %mx.c2 %pl %mx.nc
  mx.files.selchanged
}

alias -l mx.files.ext.norm {
  var %ext = $lower($strip($remove($1-,$chr(32),$chr(44),$chr(59),*)))
  if (!%ext) return
  if ($left(%ext,1) != .) %ext = . $+ %ext
  if ($len(%ext) > 17) return
  if (!$regex(%ext,/^\.[a-z0-9][a-z0-9._+-]*$/i)) return
  return %ext
}

alias mx.files.ext.refresh {
  if (!$dialog(mx.rarserver)) return
  mx.main.dcx.call xdid -r mx.rarserver 535
  var %i = 1
  while ($gettok(%mx.files.excluded,%i,44)) {
    var %ext = $mx.files.ext.norm($v1)
    if (%ext) mx.main.lv.add 535 %ext
    inc %i
  }
}

alias mx.files.ext.add {
  var %raw = $input(Extension to exclude,eg,Excluded Extension)
  if (!%raw) return
  var %ext = $mx.files.ext.norm(%raw)
  if (!%ext) return
  if ($istok(%mx.files.excluded,%ext,44)) return
  set %mx.files.excluded $addtok(%mx.files.excluded,%ext,44)
  mx.files.ext.refresh
}

alias mx.files.ext.del {
  var %ext = $mx.files.ext.selected
  if (!%ext) return
  set %mx.files.excluded $remtok(%mx.files.excluded,%ext,1,44)
  mx.files.ext.refresh
}

alias mx.files.config.write {
  var %selected = $lower($strip($1-))
  var %i = 1
  var %count = 0
  var %selectedCount = 0
  write -c $qt(%mx.files.conf)
  while ($read(%mx.files.database,n,%i)) {
    var %row = $ifmatch
    var %name = $strip($gettok(%row,1,124))
    var %path = $mx.path.norm($gettok(%row,2-,124))
    if (($isdir(%path)) && (%name)) {
      write $qt(%mx.files.conf) $+(%name,$chr(124),%path)
      inc %count
      if ((%selected) && ($lower(%name) == %selected)) {
        inc %selectedCount
      }
    }
    inc %i
  }
  if ((%selected) && (%selectedCount <= 0)) return 0
  return %count
}

alias mx.files.build {
  if ($mx.build.isrunning) {
    if ($mx.build.folders.running) mx.dlist %mx.c2 Files build blocked: $+ %mx.c1 Folders list build is still in progress. %mx.nc
    else mx.dlist %mx.c1 Build already in progress %mx.nc
    return
  }
  if ($hget(mx.files.build.reported)) {
    hfree -w mx.files.build.reported
  }
  var %mode = $lower($1), %job
  if (!$istok(selected all,%mode,32)) return
  if (%mode == selected) {
    if ($2-) %job = $mx.cfg.pl.name.sanitize($noqt($2-))
    else %job = $mx.files.selected
  }
  if ((%mode == selected) && (!%job)) return

  if (!$isfile(%mx.plexe)) {
    mx.dlist %mx.c2 Error: $+ %mx.c1 PublicListBuilder.exe not found: $+ %mx.c2 %mx.plexe %mx.nc
    return
  }
  var %count = $mx.files.config.write(%job)
  if (%count <= 0) {
    mx.dbg %mx.c2 Error: %mx.c1 No valid file directories configured %mx.nc
    return
  }
  var %trg = %mx.trigger
  if (!%trg) {
    mx.dlist %mx.c2 Error: $+ %mx.c1 Nick trigger empty %mx.nc
    return
  }
  var %marker = %mx.files.base $+ \running.tmp
  var %progress = $mx.build.progress.file(files)
  var %masterini = %mx.files.public $+ \masterlist.ini
  if ($isfile(%marker)) .remove $qt(%marker)
  if ($isfile(%progress)) .remove $qt(%progress)
  if ($isfile(%mx.files.masterlist)) .remove $qt(%mx.files.masterlist)
  if ($isfile(%masterini)) .remove $qt(%masterini)
  if ($isfile(%mx.files.errors)) .remove $qt(%mx.files.errors)
  if (%job) {
    var %oldini = %mx.files.public $+ \ $+ %job $+ \ $+ %job $+ .ini
    if ($isfile(%oldini)) .remove $qt(%oldini)
  }
  var %args = /config= $+ $qt(%mx.files.conf) $chr(32) /publicdir= $+ $qt(%mx.files.public) $chr(32) /folderspublicdir= $+ $qt(%mx.plbase) $chr(32) /master= $+ $qt(%mx.files.masterlist) $chr(32) /err= $+ $qt(%mx.files.errors) $chr(32) /marker= $+ $qt(%marker) $chr(32) /progress= $+ $qt(%progress) $chr(32) /trigger= $+ $qt(%trg) $chr(32) /mode=files $chr(32) /subfolders= $+ %mx.files.subfolders $chr(32) /excludehidden= $+ %mx.files.excludehidden $chr(32) /excluded= $+ $qt(%mx.files.excluded)
  if (%job) %args = %args $+ $chr(32) /job= $+ $qt(%job)
  set %mx.files.build.run 1
  set %mx.files.build.start $ctime
  set %mx.files.build.marker %marker
  set %mx.files.build.progress %progress
  set %mx.files.build.list $iif(%job,%job,all)
  set %mx.files.build.mode $iif(%job,selected,all)
  mx.buildmini.open files %progress
  .run -h $qt(%mx.plexe) %args
  .timerMXFILESBUILD 0 1 mx.files.build.watch
  if (%job) {
    mx.dlist %mx.c1 Selected list building mode selected %mx.nc
    mx.dlist %mx.c1 Selected list: $+ %mx.c2 %job %mx.nc
  }
  else mx.dlist %mx.c1 Build-all list(s) building mode selected %mx.nc
  mx.dlist %mx.c1 Selected trigger: $+ %mx.c2 %trg %mx.nc
  mx.dlist %mx.c1 File list build started: $+ %mx.c2 %mx.files.build.list %mx.nc
}

alias -l mx.files.ini.fresh {
  var %ini = $1
  var %date = $2
  var %time = $3
  if (!$isfile(%ini)) return 0
  if (%mx.files.build.start !isnum) return 1
  var %mtime = $file(%ini).mtime
  if ((%mtime isnum) && (%mtime >= %mx.files.build.start)) return 1
  if ((!%date) || (!%time) || (%date == -) || (%time == -)) return 0
  var %stamp = $ctime(%date %time)
  if (%stamp !isnum) return 0
  return $iif(%stamp >= %mx.files.build.start,1,0)
}

alias -l mx.files.report.master {
  if ($hget(mx.files.build.reported,masterlist)) return 0
  var %ini = %mx.files.public $+ \masterlist.ini
  if (!$isfile(%ini)) return 0
  var %routes = $readini(%ini,Masterlist,routes)
  var %files = $readini(%ini,Masterlist,files)
  var %errors = $readini(%ini,Masterlist,errors)
  var %duration = $readini(%ini,Masterlist,duration)
  var %size = $readini(%ini,Masterlist,size)
  var %speed = $readini(%ini,Masterlist,speed)
  var %date = $readini(%ini,Masterlist,date)
  var %time = $readini(%ini,Masterlist,time)
  if (!$mx.files.ini.fresh(%ini,%date,%time)) return 0
  mx.dlist %mx.c1 Masterlist created with $+ %mx.c2 $bmx(%routes) %mx.c1 $+ routes containing $+ %mx.c2 $bmx(%files) %mx.c1 $+ files with $+ %mx.c2 %errors %mx.c1 $+ errors completed in $+ %mx.c2 $mx.fmt.time(%duration) %mx.c1 $+ total size $+ %mx.c2 $mx.bytes(%size) %mx.c1 $+ average speed $+ %mx.c2 $bmx(%speed) routes/s %mx.c1 $+ generated on $+ %mx.c2 %date %mx.c1 $+ at $+ %mx.c2 %time %mx.nc
  hadd mx.files.build.reported masterlist 1
  return 1
}

alias mx.files.build.watch {
  if (%mx.files.build.run != 1) {
    .timerMXFILESBUILD off
    return
  }
  if (!$hget(mx.files.build.reported)) {
    hmake mx.files.build.reported 100
  }
  var %reported = 0
  var %expected = 0
  var %masterReady = 0
  if (%mx.files.build.mode == selected) {
    %expected = 1
    mx.files.report.list %mx.files.build.list
    if ($hget(mx.files.build.reported,%mx.files.build.list)) {
      %reported = 1
    }
  }
  elseif ((%mx.files.build.mode == all) && ($isfile(%mx.files.plnames))) {
    %expected = $lines(%mx.files.plnames)
    var %i = 1
    while (%i <= %expected) {
      var %pl = $strip($read(%mx.files.plnames,n,%i),burc)
      if (%pl) {
        mx.files.report.list %pl
        if ($hget(mx.files.build.reported,%pl)) inc %reported
      }
      inc %i
    }
  }
  mx.files.report.master
  if ($hget(mx.files.build.reported,masterlist)) {
    %masterReady = 1
  }
  if ((%reported < %expected) || (%masterReady != 1)) {
    if (($isfile(%mx.files.build.marker)) || ($calc($ctime - %mx.files.build.start) < 5)) {
      mx.buildmini.update
      return
    }
    .timerMXFILESBUILD off
    mx.dbg %mx.c2 Error: $+ %mx.c1 PublicListBuilder.exe ended without valid Files completion data. %mx.nc
    mx.buildmini.fail
    unset %mx.files.build.*
    mx.files.refresh
    mx.assignment.ui.init
    return
  }
  if ($isfile(%mx.files.build.marker)) {
    .remove $qt(%mx.files.build.marker)
  }
  .timerMXFILESBUILD off
  mx.buildmini.done
  unset %mx.files.build.*
  mx.files.refresh
  mx.assignment.ui.init
  .timermx_finder_preload -m 1 500 mx.files.index.preload
}

alias mx.files.list.open {
  var %name = $mx.files.selected
  if (!%name) return
  var %file = $findfile(%mx.files.public,* $+ %name $+ *-Files(*)-MX.txt,1)
  if (!%file) %file = $findfile(%mx.files.public,* $+ %name $+ *-MX.txt,1)
  if ($isfile(%file)) run $qt(%file)
  else mx.dbg %mx.c2 Error: $+ %mx.c1 File list TXT not found: %mx.c2 %name %mx.nc
}

alias -l mx.files.report.list {
  var %pl = $strip($1-)
  if (!%pl) return 0
  if ($hget(mx.files.build.reported,%pl)) return 0
  var %ini = %mx.files.public $+ \ $+ %pl $+ \ $+ %pl $+ .ini
  if (!$isfile(%ini)) return 0
  var %status = $lower($readini(%ini,%pl,status))
  if ((%status != ok) && (%status != error)) return 0
  var %files = $readini(%ini,%pl,files)
  var %errors = $readini(%ini,%pl,errors)
  var %duration = $readini(%ini,%pl,duration)
  var %size = $readini(%ini,%pl,size)
  var %speed = $readini(%ini,%pl,speed)
  var %date = $readini(%ini,%pl,date)
  var %time = $readini(%ini,%pl,time)
  if (!$mx.files.ini.fresh(%ini,%date,%time)) return 0
  mx.dlist %mx.c1 List $+ %mx.c2 %pl %mx.c1 $+ created with files: $+ %mx.c2 $bmx(%files) %mx.c1 $+ files with $+ %mx.c2 $bmx(%errors) %mx.c1 $+ errors completed in $+ %mx.c2 $mx.fmt.time(%duration) %mx.c1 $+ total size $+ %mx.c2 $mx.bytes(%size) %mx.c1 $+ average speed $+ %mx.c2 $bmx(%speed) files/s %mx.c1 $+ generated on $+ %mx.c2 %date %mx.c1 $+ at $+ %mx.c2 %time %mx.nc
  hadd mx.files.build.reported %pl 1
  return 1
}

alias -l mx.list.guard {
  var %cid = $1
  var %nick = $lower($strip($2))
  if ((!%cid) || (!%nick)) return 0
  var %key = $+(%cid,.,%nick)
  if ($hget(mx.list.guard,%key)) return 0
  hadd -mu7 mx.list.guard %key 1
  return 1
}

;==============================================================================
; CHANNEL ASSIGNMENTS
; row: network|channel|files|folders|public|mode
;==============================================================================

alias -l mx.assignment.line.find {
  var %chan = $lower($strip($1)), %net = $lower($strip($2)), %i = 1
  if ((!%chan) || (!%net) || (!$isfile(%mx.assignments))) return 0
  while ($read(%mx.assignments,n,%i)) {
    var %row = $ifmatch
    if (($lower($gettok(%row,1,124)) == %net) && ($lower($gettok(%row,2,124)) == %chan)) return %i
    inc %i
  }
  return 0
}

alias -l mx.assignment.find {
  var %line = $mx.assignment.line.find($1,$2)
  if (%line isnum 1-) return $read(%mx.assignments,n,%line)
}

alias -l mx.assignment.files { var %row = $mx.assignment.find($1,$2) | if ($gettok(%row,3,124) != -) return $gettok(%row,3,124) }
alias -l mx.assignment.folders { var %row = $mx.assignment.find($1,$2) | if ($gettok(%row,4,124) != -) return $gettok(%row,4,124) }
alias -l mx.assignment.public { var %row = $mx.assignment.find($1,$2) | if (($gettok(%row,3,124) != -) || ($gettok(%row,4,124) != -)) return $gettok(%row,5,124) }
alias -l mx.assignment.mode { var %row = $mx.assignment.find($1,$2) | if (($gettok(%row,3,124) != -) || ($gettok(%row,4,124) != -)) return $lower($gettok(%row,6,124)) }

alias mx.assignment.repeat.refresh {
  if (!$dialog(mx.rarserver)) return
  var %type = $lower($strip($1))
  var %name = $lower($strip($2-))
  var %id = 0, %field = 0
  if (%type == files) {
    %id = 516
    %field = 3
  }
  elseif (%type == folders) {
    %id = 216
    %field = 4
  }
  else return
  mx.main.dcx.call xdid -r mx.rarserver %id
  if ((!%name) || (!$isfile(%mx.assignments))) return
  var %i = 1, %total = $lines(%mx.assignments)
  while (%i <= %total) {
    var %row = $read(%mx.assignments,n,%i)
    if ($lower($strip($gettok(%row,%field,124))) == %name) {
      var %network = $strip($gettok(%row,1,124))
      var %channel = $strip($gettok(%row,2,124))
      if ((%network) && (%channel)) {
        mx.main.lv.add %id $+(%network,$chr(9),%channel)
      }
    }
    inc %i
  }
}

alias mx.assignment.ui.init {
  if (!$dialog(mx.rarserver)) return
  set %mx.assignment.loading 1
  var %oldfiles = $did(mx.rarserver,410).seltext
  var %oldfolders = $did(mx.rarserver,411).seltext
  did -r mx.rarserver 410,411
  did -a mx.rarserver 410 -
  var %i = 1
  while ($read(%mx.files.plnames,n,%i)) {
    var %filelist = $strip($ifmatch)
    if (%filelist) did -a mx.rarserver 410 %filelist
    inc %i
  }
  did -a mx.rarserver 411 -
  %i = 1
  while ($read(%mx.plnames,n,%i)) {
    var %folderlist = $strip($ifmatch)
    if (%folderlist) did -a mx.rarserver 411 %folderlist
    inc %i
  }
  var %sel = $didwm(mx.rarserver,410,%oldfiles,1)
  if (%sel isnum 1-) did -c mx.rarserver 410 %sel
  else did -c mx.rarserver 410 1
  %sel = $didwm(mx.rarserver,411,%oldfolders,1)
  if (%sel isnum 1-) did -c mx.rarserver 411 %sel
  else did -c mx.rarserver 411 1
  unset %mx.assignment.loading
}

alias mx.assignment.refresh {
  if (!$dialog(mx.rarserver)) return
  if (!$isfile(%mx.assignments)) write -c $qt(%mx.assignments)
  mx.main.dcx.call xdid -r mx.rarserver 401
  var %i = 1
  while ($read(%mx.assignments,n,%i)) {
    var %row = $ifmatch, %net = $gettok(%row,1,124), %chan = $gettok(%row,2,124), %files = $gettok(%row,3,124), %folders = $gettok(%row,4,124)
    var %type = $iif((%files != -) && (%folders != -),Complete,$iif(%files != -,Files,Folders))
    mx.main.lv.add 401 $+(%net,$chr(9),%chan,$chr(9),%files,$chr(9),%folders,$chr(9),%type)
    inc %i
  }
  mx.assignment.repeat.refresh files $mx.files.selected
  mx.assignment.repeat.refresh folders $strip($mx.main.dcx.get(mx.rarserver,201,2).seltext)
  mx.assignment.sync
}

alias mx.assignment.ui.new {
  if (!$dialog(mx.rarserver)) return
  set %mx.assignment.loading 1
  set %mx.assignment.editline 0
  did -r mx.rarserver 408,409
  did -ra mx.rarserver 414 -
  did -u mx.rarserver 851,852,853
  did -c mx.rarserver 851
  did -c mx.rarserver 410,411 1
  unset %mx.assignment.loading
}

alias -l mx.assignment.network.select {
  var %net = $strip($1-)
  if ((!$dialog(mx.rarserver)) || (!%net)) return
  did -ra mx.rarserver 408 %net
}

alias mx.assignment.ui.loadsel {
  if (!$dialog(mx.rarserver)) return
  var %sel = $mx.main.dcx.get(mx.rarserver,401).sel
  if (%sel !isnum 1-) return
  var %row = $read(%mx.assignments,n,%sel)
  if (!%row) return
  set %mx.assignment.loading 1
  set %mx.assignment.editline %sel
  mx.assignment.network.select $gettok(%row,1,124)
  did -ra mx.rarserver 409 $gettok(%row,2,124)
  var %n = $didwm(mx.rarserver,410,$gettok(%row,3,124),1)
  did -c mx.rarserver 410 $iif(%n isnum 1-,%n,1)
  %n = $didwm(mx.rarserver,411,$gettok(%row,4,124),1)
  did -c mx.rarserver 411 $iif(%n isnum 1-,%n,1)
  did -u mx.rarserver 851,852,853
  var %mode = $lower($gettok(%row,6,124))
  if (%mode == silent) did -c mx.rarserver 852
  elseif (%mode == ctcp) did -c mx.rarserver 853
  else did -c mx.rarserver 851
  unset %mx.assignment.loading
  mx.assignment.ui.preview
}

alias mx.assignment.ui.changed {
  if ((%mx.assignment.loading == 1) || (%mx.ui.init == 1)) return
  mx.assignment.ui.preview
  mx.assignment.ui.save
}

alias -l mx.assignment.public.make {
  var %files = $strip($1), %folders = $strip($2)
  if ((%files != -) && (%folders != -)) return $iif($lower(%files) == $lower(%folders),%files,%files $+ - $+ %folders)
  if (%files != -) return %files
  if (%folders != -) return %folders
}

alias mx.assignment.ui.preview {
  if (!$dialog(mx.rarserver)) return
  var %files = $did(mx.rarserver,410).seltext, %folders = $did(mx.rarserver,411).seltext
  var %output = $iif((%files != -) && (%folders != -),Complete,$iif(%files != -,Files,$iif(%folders != -,Folders,None)))
  did -ra mx.rarserver 414 %output
}

alias mx.assignment.ui.save {
  if ((!$dialog(mx.rarserver)) || (%mx.assignment.loading == 1)) return
  var %net = $strip($did(mx.rarserver,408).text), %chan = $lower($strip($did(mx.rarserver,409).text)), %files = $strip($did(mx.rarserver,410).seltext), %folders = $strip($did(mx.rarserver,411).seltext) 
  if ($left(%chan,1) != $chr(35)) %chan = $chr(35) $+ %chan
  if ((!%net) || (%chan == $chr(35))) return
  if (!%files) %files = -
  if (!%folders) %folders = -
  if ((%files == -) && (%folders == -)) return
  var %public = $mx.assignment.public.make(%files,%folders)
  var %mode = $iif($did(mx.rarserver,852).state == 1,silent,$iif($did(mx.rarserver,853).state == 1,ctcp,normal))
  var %row = $+(%net,$chr(124),%chan,$chr(124),%files,$chr(124),%folders,$chr(124),%public,$chr(124),%mode)
  var %line = $mx.assignment.line.find(%chan,%net)
  if (%line isnum 1-) write $+(-l,%line) $qt(%mx.assignments) %row
  else { write $qt(%mx.assignments) %row | %line = $lines(%mx.assignments) }
  set %mx.assignment.editline %line
  mx.assignment.refresh
  mx.main.dcx.call xdid -c mx.rarserver 401 %line
  mx.assignment.ui.preview
}

alias mx.assignment.delete {
  var %sel = $mx.main.dcx.get(mx.rarserver,401).sel
  if (%sel !isnum 1-) return
  if ($input(Delete selected assignment?,yn,Assignments) != $true) return
  write $+(-dl,%sel) $qt(%mx.assignments)
  set %mx.assignment.editline 0
  mx.assignment.refresh
  mx.assignment.ui.new
}

alias mx.assignment.sync {
  set %mx.chans
  set %mx.chansadv
  if (!$isfile(%mx.assignments)) return
  var %i = 1
  while ($read(%mx.assignments,n,%i)) {
    var %row = $ifmatch
    var %files = $gettok(%row,3,124), %folders = $gettok(%row,4,124)
    if ((%files != -) || (%folders != -)) {
      var %net = $gettok(%row,1,124), %chan = $gettok(%row,2,124), %public = $gettok(%row,5,124), %mode = $lower($gettok(%row,6,124))
      set %mx.chans $addtok(%mx.chans,$+(%chan,:,%net,:,%public),44)
      if (!$istok(normal silent ctcp,%mode,32)) %mode = normal
      if (%mode != ctcp) set %mx.chansadv $addtok(%mx.chansadv,$+(%chan,:,%net),44)
    }
    inc %i
  }
  mx.apply.runtime
}

alias mx.assignment.migrate {
  if (!$isfile(%mx.assignments)) write -c $qt(%mx.assignments)
  if ($lines(%mx.assignments) > 0) return
  if (!%mx.chans) return
  var %legacy = %mx.chans, %i = 1
  while ($gettok(%legacy,%i,44)) {
    var %tok = $mx.chans.tok.norm($v1), %chan = $gettok(%tok,1,58), %net = $gettok(%tok,2,58), %pl = $gettok(%tok,3-,58)
    if ((%chan) && (%net) && (%pl)) write $qt(%mx.assignments) $+(%net,$chr(124),%chan,$chr(124),-,$chr(124),%pl,$chr(124),%pl,$chr(124),normal)
    inc %i
  }
}

alias mx.assignment.list.purge {
  var %type = $lower($1), %name = $lower($strip($2-)), %i = 1
  if ((!$istok(files folders,%type,32)) || (!%name) || (!$isfile(%mx.assignments))) return
  while ($read(%mx.assignments,n,%i)) {
    var %row = $ifmatch, %net = $gettok(%row,1,124), %chan = $gettok(%row,2,124), %files = $gettok(%row,3,124), %folders = $gettok(%row,4,124), %mode = $gettok(%row,6,124)
    if ((%type == files) && ($lower(%files) == %name)) %files = -
    if ((%type == folders) && ($lower(%folders) == %name)) %folders = -
    if ((%files == -) && (%folders == -)) { write $+(-dl,%i) $qt(%mx.assignments) | continue }
    var %public = $mx.assignment.public.make(%files,%folders)
    write $+(-l,%i) $qt(%mx.assignments) $+(%net,$chr(124),%chan,$chr(124),%files,$chr(124),%folders,$chr(124),%public,$chr(124),%mode)
    inc %i
  }
  if ($dialog(mx.rarserver)) { mx.assignment.ui.init | mx.assignment.refresh }
  else mx.assignment.sync
}

alias -l mx.path.under {
  var %path = $lower($mx.path.norm($1)), %root = $lower($mx.path.norm($2-))
  if ((!%path) || (!%root)) return 0
  if (%path == %root) return 1
  return $iif($left(%path,$calc($len(%root) + 1)) == %root $+ \,1,0)
}

alias -l mx.payload.islist {
  var %path = $mx.path.norm($1-)
  var %name = $lower($nopath(%path))
  if (!%path) return 0
  if ($mx.complete.job.is(%path)) return 1
  if ((*-mx.rar !iswm %name) && (*-mx.txt !iswm %name)) return 0
  if ($mx.path.under(%path,%mx.plbase)) return 1
  if ($mx.path.under(%path,%mx.files.public)) return 1
  if ($mx.path.under(%path,%mx.complete.dir)) return 1
  return 0
}

alias -l mx.list.path.allowed {
  var %type = $lower($1), %list = $lower($strip($2)), %path = $mx.path.norm($3-), %db = $iif(%type == files,%mx.files.database,%mx.database), %i = 1
  if ((!%list) || (!%path) || (!$isfile(%db))) return 0
  while ($read(%db,n,%i)) {
    var %row = $ifmatch
    if (($lower($strip($gettok(%row,1,124))) == %list) && ($mx.path.under(%path,$gettok(%row,2-,124)))) return 1
    inc %i
  }
  return 0
}

alias -l mx.lookup.allowed {
  unset %mx.lookup.laststatus
  unset %mx.lookup.lasterror
  var %master = $1
  var %key = $strip($2)
  var %type = $lower($3)
  var %list = $strip($4-)
  if ((!$isfile(%master)) || (!%key) || (!%list)) {
    set %mx.lookup.laststatus ERR
    set %mx.lookup.lasterror invalid_input
    return
  }
  var %dll = $iif(%type == folders,%mx.dll,%mx.finder.dll)
  if (!$isfile(%dll)) {
    set %mx.lookup.laststatus ERR
    set %mx.lookup.lasterror dll_not_found
    mx.dlist %mx.c2 Error: $+ %mx.c1 Lookup DLL not found: %mx.c2 %dll %mx.nc
    return
  }
  var %params = $+(%key,$chr(124),%master)
  var %ticks = $ticks
  var %res = $dll($qt(%dll),LookupExact,%params)
  var %time = $calc($ticks - %ticks)
  var %status = $gettok(%res,1,124)
  set %mx.lookup.laststatus %status
  set %mx.lookup.lasterror $gettok(%res,2-,124)
  if (%status != OK) return
  var %path = $mx.path.norm($gettok(%res,2-,124))
  if (!%path) {
    set %mx.lookup.laststatus ERR
    set %mx.lookup.lasterror empty_path
    return
  }
  if ((%type == files) && (!$isfile(%path))) {
    set %mx.lookup.laststatus ERR
    set %mx.lookup.lasterror file_missing
    return
  }
  if ((%type == folders) && (!$isdir(%path))) {
    set %mx.lookup.laststatus ERR
    set %mx.lookup.lasterror folder_missing
    return
  }
  if (!$mx.list.path.allowed(%type,%list,%path)) {
    set %mx.lookup.laststatus NO
    set %mx.lookup.lasterror path_not_allowed
    return
  }
  return %path
}

alias mx.files.index.preload {
  if (!$isfile(%mx.finder.dll)) {
    return
  }
  if (!$isfile(%mx.files.masterlist)) {
    return
  }
  var %version = $dll($qt(%mx.finder.dll),Version,0)
  if (*1.12* !iswm %version) {
    mx.dlist %mx.c2 Error: $+ %mx.c1 This script requires mxfinder.dll 1.12 Win32. Replace the loaded DLL and restart mIRC. %mx.nc
    return
  }
  var %params = $+(__mx_preload__,$chr(124),%mx.files.masterlist)
  var %ticks = $ticks
  var %res = $dll($qt(%mx.finder.dll),LookupExact,%params)
  .timermx_findpack_preload -m 1 1000 mx.find.index.preload
}

alias mx.find.index.preload {
  if ((!$isfile(%mx.finder.dll)) || (!$isfile(%mx.files.masterlist))) return
  var %params = $+(files,$chr(124),%mx.files.masterlist)
  var %res = $dll($qt(%mx.finder.dll),PreloadFind,%params)
  var %status = $gettok(%res,1,124)
  if (%status == WAIT) {
    .timermx_findpack_preload -m 1 1000 mx.find.index.preload
    return
  }
  if (%status == ERR) {
    mx.dlist %mx.c2 Error: $+ %mx.c1 Find index preload failed: %mx.c2 $gettok(%res,2-,124) %mx.nc
  }
}

alias mx.files.lookup.status {
  var %dllstate = $iif($isfile(%mx.finder.dll),present,missing)
  var %masterstate = $iif($isfile(%mx.files.masterlist),present,missing)
  var %pending = $iif($isfile(%mx.files.lookup.queue),$lines(%mx.files.lookup.queue),0)
  var %timerstate = $iif($timer(mxfileslookup),on,off)
  var %version = unavailable
  if ($isfile(%mx.finder.dll)) %version = $dll($qt(%mx.finder.dll),Version,0)
}

alias mx.cfg.queue.refresh {
  if (!$dialog(mx.rarserver)) return
  mx.queue.listbox.load mx.rarserver 301
  mx.main.queue.summary
}

alias mx.cfg.pl.chans.purge {
  var %pl = $lower($strip($1-))
  if (!%pl) return
  var %i = 1
  while ($gettok(%mx.chans,%i,44)) {
    var %t = $strip($gettok(%mx.chans,%i,44))
    var %chan = $strip($gettok(%t,1,58))
    var %net  = $strip($gettok(%t,2,58))
    var %tpl  = $lower($strip($gettok(%t,3-,58)))
    if (%tpl == %pl) {
      set %mx.chans $remtok(%mx.chans,%t,1,44)
      if ((%chan) && (%net)) {
        var %tokad = %chan $+ : $+ %net
        set %mx.chansadv $remtok(%mx.chansadv,%tokad,1,44)
      }
      continue
    }
    inc %i
  }
}

alias -l mx.build.files.running {
  if (%mx.files.build.run == 1) return 1
  if ((%mx.files.build.marker) && ($isfile(%mx.files.build.marker))) return 1
  if ((%mx.files.base) && ($isfile($+(%mx.files.base,\running.tmp)))) return 1
  return 0
}

alias -l mx.build.folders.running {
  if (%mx.build.run == 1) return 1
  if (%mx.build.watch == 1) return 1
  if ((%mx.plbase) && ($isfile($+(%mx.plbase,\publiclistbuilder.running)))) return 1
  return 0
}

alias mx.build.isrunning {
  if (%mx.complete.active == 1) return 1
  if ($mx.build.files.running) return 1
  if ($mx.build.folders.running) return 1
  return 0
}

alias -l mx.build.request.blocked {
  var %type = $lower($1)
  if (%mx.complete.active == 1) return 1
  if (%type == files) return $mx.build.files.running
  if (%type == folders) return $mx.build.folders.running
  if (%type == complete) {
    if ($mx.build.files.running) return 1
    if ($mx.build.folders.running) return 1
  }
  return 0
}

alias mx.build.busy {
  if ($mx.build.isrunning) {
    if ($1 == selected) {
      mx.dlist %mx.c1 Selected list already in progress %mx.nc
      return
    }
    if ($1 == all) {
      mx.dlist %mx.c1 Build already in progress, build-all blocked %mx.nc
      return
    }
    return
  }
  if ($1 == selected) {
    mx.dlist %mx.c2 Selected $+ %mx.c1 list building mode selected %mx.nc
    mx.cfg.pl.build.selected
    return
  }
  if ($1 == all) {
    mx.cfg.pl.build.all
    return
  }
}

alias -l mx.queue.remove {
  var %dlg, %id, %ln
  if (($1 == mx.monitor) && $dialog(mx.monitor) && $mx.main.dcx.get(mx.monitor,1).sel) {
    %dlg = mx.monitor
    %id = 1
  }
  elseif (($1 == mx.rarserver) && $dialog(mx.rarserver) && $mx.main.dcx.get(mx.rarserver,301).sel) {
    %dlg = mx.rarserver
    %id = 301
  }
  elseif ($dialog(mx.monitor) && $mx.main.dcx.get(mx.monitor,1).sel) {
    %dlg = mx.monitor
    %id = 1
  }
  elseif ($dialog(mx.rarserver) && $mx.main.dcx.get(mx.rarserver,301).sel) {
    %dlg = mx.rarserver
    %id = 301
  }
  else return
  if (!$isfile(%mx.queue)) return
  if (!$mx.queue.lock.acquire(mx.queue.remove)) return
  %ln = $mx.main.dcx.get(%dlg,%id).sel
  var %max = $lines(%mx.queue)
  if (%ln !isnum 1-) { mx.queue.lock.release mx.queue.remove | return }
  if (%max < 1) { mx.queue.lock.release mx.queue.remove | return }
  var %removedPayload = $mx.queue.payload($read(%mx.queue,n,%ln))
  write -dl %ln $qt(%mx.queue)
  dmx.queue.refresh
  var %newmax = $lines(%mx.queue)
  if (%newmax > 0) {
    var %pick = $iif(%ln > %newmax,%newmax,%ln)
    if ($dialog(mx.rarserver)) mx.main.dcx.call xdid -c mx.rarserver 301 %pick
    if ($dialog(mx.monitor)) mx.main.dcx.call xdid -c mx.monitor 1 %pick
    mx.main.dcx.call xdid -F %dlg %id
  }
  mx.dbg %mx.c1 Removed queue line: %mx.c2 %ln %mx.nc
  mx.queue.lock.release mx.queue.remove

  if ($mx.complete.job.is(%removedPayload)) {
    mx.complete.job.remove %removedPayload
  }
  elseif (($mx.path.under(%removedPayload,%mx.complete.dir)) && ($isfile(%removedPayload))) {
    mx.del.try %removedPayload
  }
}

alias -l mx.queue.move {
  var %dlg, %id, %ln
  if (($2 == mx.monitor) && $dialog(mx.monitor) && $mx.main.dcx.get(mx.monitor,1).sel) {
    %dlg = mx.monitor
    %id = 1
  }
  elseif (($2 == mx.rarserver) && $dialog(mx.rarserver) && $mx.main.dcx.get(mx.rarserver,301).sel) {
    %dlg = mx.rarserver
    %id = 301
  }
  elseif ($dialog(mx.monitor) && $mx.main.dcx.get(mx.monitor,1).sel) {
    %dlg = mx.monitor
    %id = 1
  }
  elseif ($dialog(mx.rarserver) && $mx.main.dcx.get(mx.rarserver,301).sel) {
    %dlg = mx.rarserver
    %id = 301
  }
  else return
  if (!$isfile(%mx.queue)) return
  if (!$mx.queue.lock.acquire(mx.queue.move)) return
  %ln = $mx.main.dcx.get(%dlg,%id).sel
  var %max = $lines(%mx.queue)
  if (%ln !isnum 1-) { mx.queue.lock.release mx.queue.move | return }
  if (%max < 2) { mx.queue.lock.release mx.queue.move | return }
  var %a = $read(%mx.queue,n,%ln)
  if (!%a) { mx.queue.lock.release mx.queue.move | return }
  var %newsel = %ln
  var %tmp = %mx.queue $+ .tmp
  var %bak = %mx.queue $+ .bak
  if ($1 == up) {
    if (%ln <= 1) { mx.queue.lock.release mx.queue.move | return }
    var %b = $read(%mx.queue,n,$calc(%ln - 1))
    if (!%b) { mx.queue.lock.release mx.queue.move | return }
    write -c $qt(%tmp)
    var %i = 1
    while (%i <= %max) {
      if (%i == $calc(%ln - 1)) write $qt(%tmp) %a
      elseif (%i == %ln) write $qt(%tmp) %b
      else write $qt(%tmp) $read(%mx.queue,n,%i)
      inc %i
      mx.queue.lock.touch
    }
    %newsel = $calc(%ln - 1)
    mx.dbg %mx.c1 Queue moved up, line: %mx.c2 %ln %mx.nc
  }
  elseif ($1 == down) {
    if (%ln >= %max) { mx.queue.lock.release mx.queue.move | return }
    var %b = $read(%mx.queue,n,$calc(%ln + 1))
    if (!%b) { mx.queue.lock.release mx.queue.move | return }
    write -c $qt(%tmp)
    var %i = 1
    while (%i <= %max) {
      if (%i == %ln) write $qt(%tmp) %b
      elseif (%i == $calc(%ln + 1)) write $qt(%tmp) %a
      else write $qt(%tmp) $read(%mx.queue,n,%i)
      inc %i
      mx.queue.lock.touch
    }
    %newsel = $calc(%ln + 1)
    mx.dbg %mx.c1 Queue moved down, line: %mx.c2 %ln %mx.nc
  }
  else {
    mx.queue.lock.release mx.queue.move
    return
  }
  if ($isfile(%bak)) .remove $qt(%bak)
  .rename $qt(%mx.queue) $qt(%bak)
  if (!$isfile(%bak)) {
    if ($isfile(%tmp)) .remove $qt(%tmp)
    mx.dbg %mx.c2 Error: $+ %mx.c1 Queue move aborted, could not create backup for: $+ %mx.c2 %mx.queue %mx.nc
    mx.queue.lock.release mx.queue.move
    return
  }
  .rename $qt(%tmp) $qt(%mx.queue)
  if (!$isfile(%mx.queue)) {
    .rename $qt(%bak) $qt(%mx.queue)
    mx.dbg %mx.c2 Error: $+ %mx.c1 Queue move restore executed after rename failure. %mx.nc
    mx.queue.lock.release mx.queue.move
    return
  }
  if ($isfile(%bak)) .remove $qt(%bak)
  dmx.queue.refresh
  if ($dialog(mx.rarserver)) mx.main.dcx.call xdid -c mx.rarserver 301 %newsel
  if ($dialog(mx.monitor)) mx.main.dcx.call xdid -c mx.monitor 1 %newsel
  mx.main.dcx.call xdid -F %dlg %id
  mx.queue.lock.release mx.queue.move
}

on *:dialog:mx.monitor:sclick:2: mx.queue.move up mx.monitor
on *:dialog:mx.monitor:sclick:3: mx.queue.move down mx.monitor
on *:dialog:mx.monitor:sclick:4: mx.queue.remove mx.monitor

alias mx.stats {
  if (!$dialog(mx.rarserver)) dialog -m mx.rarserver mx.rarserver
  if ($dialog(mx.rarserver)) mx.main.section statistics
}

dialog mx.addchan {
  title "Add channel assignment"
  size -1 -1 100 137
  option dbu, sysmenu
  box "Available joined channels", 10, 4 4 92 66
  text "Files list", 14, 8 79 34 8
  combo 15, 42 76 50 42, drop
  text "Folders list", 16, 8 94 34 8
  combo 17, 42 91 50 42, drop
  text "Select Files, Folders, or both", 18, 4 109 92 8, center
  button "Assign", 23, 18 120 30 12
  button "Close", 13, 52 120 30 12, cancel
}

on *:dialog:mx.addchan:init:0: {
  mx.addchan.dcx.init
  mx.addchan.ui.load
}

on *:dialog:mx.addchan:sclick:13: dialog -x mx.addchan
on *:dialog:mx.addchan:sclick:15,17: mx.addchan.type.refresh
on *:dialog:mx.addchan:sclick:23: mx.addchan.assign
on *:dialog:mx.addchan:close:*: unset %mx.addchan.*

alias -l mx.addchan.dcx.init {
  if ((!$dialog(mx.addchan)) || (!$isfile($mx.main.dcx.path))) return 0
  mx.main.dcx.call Mark mx.addchan mx.addchan.callback
  mx.main.dcx.call xdialog -c mx.addchan 11 listview $mx.main.pxw(8) $mx.main.pxh(14) $mx.main.pxw(84) $mx.main.pxh(51) report fullrow singlesel grid showsel tooltips noheadersort
  mx.main.dcx.call xdid -f mx.addchan 11 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.addchan 11 +l 0 0 $chr(160) $chr(9) +l 0 $mx.main.pxw(40) Channel $chr(9) +l 0 $mx.main.pxw(42) Network
  return 1
}

alias mx.addchan.callback {
  if (($2 == dclick) && ($3 == 11)) did -f mx.addchan 15
}

alias -l mx.addchan.lv.add {
  var %chan = $1, %net = $2-
  if ((!$dialog(mx.addchan)) || (!%chan) || (!%net)) return
  var %fg = $rgb(32,32,32), %bg = $rgb(255,255,255)
  var %args = 0 0 + 0 0 0 0 %fg %bg $chr(160) $+ $chr(9) $+ + 0 -1 %fg %bg %chan $+ $chr(9) $+ + 0 -1 %fg %bg %net
  mx.main.dcx.call xdid -a mx.addchan 11 %args
}

alias -l mx.chans.tok.norm {
  var %t = $strip($1-)
  if (!%t) return
  while ($pos(%t,$chr(32) $+ $chr(32))) %t = $replace(%t,$chr(32) $+ $chr(32),$chr(32))
  while ($pos(%t,$chr(32) $+ :)) %t = $replace(%t,$chr(32) $+ :,:)
  while ($pos(%t,: $+ $chr(32))) %t = $replace(%t,: $+ $chr(32),:)
  return %t
}

alias -l mx.chans.isassigned {
  var %chan = $lower($strip($1))
  var %net  = $lower($strip($2))
  if ((!%chan) || (!%net)) return 0
  var %i = 1
  while ($gettok(%mx.chans,%i,44)) {
    var %t = $mx.chans.tok.norm($gettok(%mx.chans,%i,44))
    if (%t) {
      if (($lower($gettok(%t,1,58)) == %chan) && ($lower($gettok(%t,2,58)) == %net)) return 1
    }
    inc %i
  }
  return 0
}

alias -l mx.addchan.collect {
  if (!$dialog(mx.addchan)) return
  var %oldcid = $cid
  var %seen, %i = 1
  while ($scon(%i)) {
    if ($scon(%i).status == connected) {
      var %cid = $scon(%i).cid
      var %net = $scon(%i).network
      scid %cid
      var %c = 1
      while ($chan(%c)) {
        var %ch = $chan(%c)
        if (%ch) {
          if (!$mx.chans.isassigned(%ch,%net)) {
            var %entry = %ch $+ @ $+ %net
            if (!$istok(%seen,%entry,44)) {
              %seen = $addtok(%seen,%entry,44)
              mx.addchan.lv.add %ch %net
            }
          }
        }
        inc %c
      }
    }
    inc %i
  }
  scid %oldcid
}

alias -l mx.addchan.ui.load {
  if (!$dialog(mx.addchan)) return
  mx.main.dcx.call xdid -r mx.addchan 11
  did -r mx.addchan 15,17
  did -a mx.addchan 15 -
  var %i = 1
  while ($read(%mx.files.plnames,n,%i)) {
    var %files = $strip($ifmatch)
    if (%files) did -a mx.addchan 15 %files
    inc %i
  }
  did -a mx.addchan 17 -
  %i = 1
  while ($read(%mx.plnames,n,%i)) {
    var %folders = $strip($ifmatch)
    if (%folders) did -a mx.addchan 17 %folders
    inc %i
  }
  did -c mx.addchan 15,17 1
  if (%mx.addchan.mode == edit) {
    var %line = %mx.addchan.editline, %row = $read(%mx.assignments,n,%line)
    if (!%row) { did -b mx.addchan 23 | did -ra mx.addchan 18 Assignment not found | return }
    dialog -t mx.addchan Edit channel assignment
    did -ra mx.addchan 10 Assigned channel
    did -ra mx.addchan 23 Save
    mx.addchan.lv.add $gettok(%row,2,124) $gettok(%row,1,124)
    mx.main.dcx.call xdid -c mx.addchan 11 1
    var %sel = $didwm(mx.addchan,15,$gettok(%row,3,124),1)
    did -c mx.addchan 15 $iif(%sel isnum 1-,%sel,1)
    %sel = $didwm(mx.addchan,17,$gettok(%row,4,124),1)
    did -c mx.addchan 17 $iif(%sel isnum 1-,%sel,1)
    did -e mx.addchan 23
    mx.addchan.type.refresh
    return
  }
  set %mx.addchan.mode add
  dialog -t mx.addchan Add channel assignment
  did -ra mx.addchan 10 Available joined channels
  did -ra mx.addchan 23 Assign
  mx.addchan.collect
  if ($mx.main.dcx.get(mx.addchan,11).num > 0) { mx.main.dcx.call xdid -c mx.addchan 11 1 | did -e mx.addchan 23 }
  else { did -b mx.addchan 23 | did -ra mx.addchan 18 No unassigned joined channels available }
}

alias -l mx.addchan.type.refresh {
  if (!$dialog(mx.addchan)) return
  var %files = $did(mx.addchan,15).seltext, %folders = $did(mx.addchan,17).seltext
  var %type = $iif((%files != -) && (%folders != -),Complete,$iif(%files != -,Files,$iif(%folders != -,Folders,None)))
  if (%type == None) did -ra mx.addchan 18 Select Files, Folders, or both
  else did -ra mx.addchan 18 Assignment type: %type
}

alias -l mx.addchan.assign {
  if (!$dialog(mx.addchan)) return
  var %sel = $mx.main.dcx.get(mx.addchan,11).sel
  if (%sel !isnum 1-) { did -ra mx.addchan 18 Select a joined channel | return }
  var %chan = $strip($mx.main.dcx.get(mx.addchan,11,%sel,2).text)
  var %net = $strip($mx.main.dcx.get(mx.addchan,11,%sel,3).text)
  if ((!%chan) || (!%net)) return
  var %files = $strip($did(mx.addchan,15).seltext), %folders = $strip($did(mx.addchan,17).seltext)
  if (!%files) %files = -
  if (!%folders) %folders = -
  if ((%files == -) && (%folders == -)) { did -ra mx.addchan 18 Select a Files list, a Folders list, or both | return }
  var %line = $mx.assignment.line.find(%chan,%net), %public = $mx.assignment.public.make(%files,%folders)
  if (%mx.addchan.mode == edit) {
    %line = %mx.addchan.editline
    var %oldrow = $read(%mx.assignments,n,%line), %mode = $lower($gettok(%oldrow,6,124))
    if (!%oldrow) { did -ra mx.addchan 18 Assignment not found | return }
    if (!$istok(normal silent ctcp,%mode,32)) %mode = normal
    write $+(-l,%line) $qt(%mx.assignments) $+(%net,$chr(124),%chan,$chr(124),%files,$chr(124),%folders,$chr(124),%public,$chr(124),%mode)
    if ($dialog(mx.rarserver)) {
      mx.assignment.refresh
      mx.main.dcx.call xdid -c mx.rarserver 401 %line
      mx.assignment.ui.loadsel
      did -ra mx.rarserver 709 Channel assignment updated
    }
    else mx.assignment.sync
    return
  }
  if (%line isnum 1-) {
    dialog -x mx.addchan
    if ($dialog(mx.rarserver)) {
      mx.assignment.refresh
      mx.main.dcx.call xdid -c mx.rarserver 401 %line
      mx.assignment.ui.loadsel
      did -ra mx.rarserver 709 Channel already assigned
    }
    return
  }
  write $qt(%mx.assignments) $+(%net,$chr(124),%chan,$chr(124),%files,$chr(124),%folders,$chr(124),%public,$chr(124),normal)
  %line = $lines(%mx.assignments)
  if ($dialog(mx.rarserver)) {

    mx.assignment.refresh
    mx.main.dcx.call xdid -c mx.rarserver 401 %line
    mx.assignment.ui.loadsel
    did -ra mx.rarserver 709 Channel assignment added
  }
  else mx.assignment.sync
  mx.main.dcx.call xdid -r mx.addchan 11
  mx.addchan.collect

  if ($mx.main.dcx.get(mx.addchan,11).num > 0) {
    mx.main.dcx.call xdid -c mx.addchan 11 1
    did -e mx.addchan 23
    did -ra mx.addchan 18 Channel assignment added
  }
  else {
    did -b mx.addchan 23
    did -ra mx.addchan 18 No unassigned joined channels available
  }
}

alias mx.cfg.chan.add {
  if ($dialog(mx.addchan)) return
  set %mx.addchan.mode add
  unset %mx.addchan.editline
  dialog -m mx.addchan mx.addchan
}

alias mx.cfg.chan.edit {
  if ((!$dialog(mx.rarserver)) || ($dialog(mx.addchan))) return
  var %sel = $mx.main.dcx.get(mx.rarserver,401).sel
  if (%sel !isnum 1-) { did -ra mx.rarserver 709 Select a channel assignment to edit | return }
  set %mx.addchan.mode edit
  set %mx.addchan.editline %sel
  dialog -m mx.addchan mx.addchan
}

alias -l mx.cfg.pl.name.sanitize {
  var %n = $strip($remove($1-,$chr(13),$chr(10)))
  while ($pos(%n,$str($chr(32),2))) %n = $replace(%n,$str($chr(32),2),$chr(32))
  while ($left(%n,1) == $chr(32)) %n = $mid(%n,2)
  while ($right(%n,1) == $chr(32)) %n = $left(%n,-1)
  if (!%n) return
  var %base = $upper($gettok(%n,1,46))
  var %bad = 0
  if (%n != $remove(%n,$chr(92),$chr(47),$chr(58),$chr(42),$chr(63),$chr(34),$chr(60),$chr(62),$chr(124))) %bad = 1
  if ((%n == .) || (%n == ..) || ($right(%n,1) == .)) %bad = 1
  if (($istok(CON PRN AUX NUL,%base,32)) || (($len(%base) == 4) && ($istok(COM LPT,$left(%base,3),32)) && ($right(%base,1) isnum 1-9))) %bad = 1
  if (%bad == 1) {
    var %symbols = \ / : * ? $chr(34) < > $chr(124)
    noop $input(Invalid list name. $+ $crlf $+ Invalid symbols: %symbols $+ $crlf $+ Reserved: CON PRN AUX NUL COM1-COM9 LPT1-LPT9,oh,Invalid list name)
    return
  }
  return %n
}

on *:JOIN:#:{
  if ($nick != $me) return
  mx.start.adx
  if (%mx.join != 1) return
  if (%mx.enabled != 1) return
  if (!$isfile(%mx.queue)) return
  if ($lines(%mx.queue) <= 0) return
  if ($timer(MXRARQ).state == on) return
  if ($timer(MXQSTART)) return
  set %mx.queue.joinwait 1
  .timerMXQSTART 1 60 mx.queue.joinwait.end
}

alias -l mx.queue.joinwait.end {
  unset %mx.queue.joinwait
  if (%mx.join != 1) return
  if (%mx.enabled != 1) return
  if (!$isfile(%mx.queue)) return
  if ($lines(%mx.queue) <= 0) return
  dmx.queue.start.now
}

alias -l mx.path.norm {
  var %p = $strip($remove($1-,$chr(34)))
  if (!%p) return
  %p = $replace(%p,/,\)
  while ($pos(%p,\\)) %p = $replace(%p,\\,\)
  while ($left(%p,1) == $chr(32)) %p = $mid(%p,2)
  while ($right(%p,1) == $chr(32)) %p = $left(%p,-1)
  while (($right(%p,1) == \) && ($len(%p) > 3)) %p = $left(%p,-1)
  return %p
}

alias -l mx.path.resolve {
  var %p = $mx.path.norm($1-)
  if (!%p) return
  if ($isdir(%p)) return %p
  if ($isfile(%p)) return %p
  if ($right($lower(%p),4) == .rar) {
    var %q = $left(%p,-4)
    if ($isdir(%q)) return %q
    if ($isfile(%q)) return %q
  }
  return $null
}

alias -l mx.del.add {
  var %f = $mx.path.norm($1-)
  if (!%f) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Empty entry, no action taken %mx.nc
    return
  }
  if (!$istok(%mx.delist,%f,124)) {
    set %mx.delist $addtok(%mx.delist,%f,124)
    return
  }
  mx.dbg %mx.c1 Already registered, skipping file: $+ %mx.c2 %f %mx.nc
}

alias -l mx.del.clean {
  unset %mx.del.size.*
  unset %mx.del.stable.*
  var %before = $numtok(%mx.delist,124)
  var %rearmed = 0
  var %i = %before
  while (%i >= 1) {
    var %f = $gettok(%mx.delist,%i,124)
    if ((!%f) || (!$isfile(%f))) {
      set %mx.delist $deltok(%mx.delist,%i,124)
    }
    else {
      var %id = $hash(%f,32)
      var %retryTimer = $+(MXDEL.,%id)
      if ($timer(%retryTimer)) {
        .timer $+ %retryTimer off
      }
      .timer $+ %retryTimer 1 5 mx.del.try $qt(%f)
      inc %rearmed
    }
    dec %i
  }
  if (!$numtok(%mx.delist,124)) {
    unset %mx.delist
  }
}

alias -l mx.complete.startup.clean {
  var %root = $mx.path.norm(%mx.complete.dir)
  var %jobs = $mx.path.norm(%mx.complete.jobs)
  if ((!%root) || (!$isdir(%root))) {
    return
  }
  var %queueRemoved = 0
  var %dirsRemoved = 0
  var %rarsRemoved = 0
  var %failed = 0
  if ($isfile(%mx.queue)) {
    var %q = $lines(%mx.queue)
    while (%q >= 1) {
      var %line = $read(%mx.queue,n,%q)
      var %payload = $mx.path.norm($mx.queue.payload(%line))
      if ((%payload) && ($mx.path.under(%payload,%root))) {
        if ($mx.complete.job.is(%payload)) {
        }
        else {
          write $+(-dl,%q) $qt(%mx.queue)
          inc %queueRemoved
        }
      }
      dec %q
    }
  }
  var %dirCount = $finddir(%root,*,0,1)
  var %i = %dirCount
  while (%i >= 1) {
    var %dir = $mx.path.norm($finddir(%root,*,%i,1))
    if (%dir) {
      if ($lower(%dir) == $lower(%jobs)) {
      }
      else {
        mx.cfg.dir.purge %dir
        if (!$isdir(%dir)) {
          inc %dirsRemoved
        }
        else {
          inc %failed
        }
      }
    }
    dec %i
  }
  var %rarCount = $findfile(%root,*.rar,0,1)
  var %r = %rarCount
  while (%r >= 1) {
    var %rar = $mx.path.norm($findfile(%root,*.rar,%r,1))
    if (%rar) {
      .remove $qt(%rar)
      if (!$isfile(%rar)) {
        inc %rarsRemoved
      }
      else {
        inc %failed
      }
    }
    dec %r
  }
}

alias -l mx.rar.jobdir.clean {
  var %file = $mx.path.norm($1-)
  if (!%file) return
  var %dir = $mx.path.norm($nofile(%file))
  var %root = $mx.path.norm(%mx.workdir)
  if ((!%dir) || (!%root)) return
  var %parent = $mx.path.norm($nofile(%dir))
  var %dirname = $lower($nopath(%dir))
  if (($lower(%parent) != $lower(%root)) || (mxjob_* !iswm %dirname)) {
    return
  }
  if (!$isdir(%dir)) return
  if (%mx.wdebug == 2) {
    mx.dbg %mx.c1 Removing isolated RAR directory: $+ %mx.c2 %dir %mx.nc
  }
  .rmdir $qt(%dir)
  if (!$isdir(%dir)) {
    if (%mx.wdebug == 2) {
      mx.dbg %mx.c1 Isolated RAR directory removed: $+ %mx.c2 %dir %mx.nc
    }
    return
  }
  if (%mx.wdebug == 2) {
    mx.dbg %mx.c2 [warn] %mx.c1 Isolated RAR directory could not be removed: $+ %mx.c2 %dir %mx.nc
  }
}

alias -l mx.del.try {
  var %f = $mx.path.norm($1-)
  var %completeWork
  if (!%f) {
    return
  }
  var %id = $hash(%f,32)
  var %retryTimer = $+(MXDEL.,%id)
  var %sizeVar = $+($chr(37),mx.del.size.,%id)
  var %stableVar = $+($chr(37),mx.del.stable.,%id)
  if ($mx.path.under(%f,%mx.complete.dir)) {
    var %parent = $mx.path.norm($nofile(%f))
    if (($lower(%parent) != $lower($mx.path.norm(%mx.complete.dir))) && ($mx.path.under(%parent,%mx.complete.dir))) {
      var %completeWork = %parent
    }
  }
  if (!$istok(%mx.delist,%f,124)) {
    if ($timer(%retryTimer)) .timer $+ %retryTimer off
    unset %mx.del.size. [ $+ [ %id ] ]
    unset %mx.del.stable. [ $+ [ %id ] ]
    .timerUSLOTS 1 2 mx.slots.update
    return
  }
  if (!$isfile(%f)) {
    if ($timer(%retryTimer)) .timer $+ %retryTimer off
    unset %mx.del.size. [ $+ [ %id ] ]
    unset %mx.del.stable. [ $+ [ %id ] ]
    set %mx.delist $remtok(%mx.delist,%f,1,124)
    if (!$numtok(%mx.delist,124)) unset %mx.delist
    mx.rar.jobdir.clean %f
    if ((%completeWork) && ($isdir(%completeWork))) {
      mx.cfg.dir.purge %completeWork
    }
    .timerUSLOTS 1 2 mx.slots.update
    return
  }
  var %size = $file(%f).size
  var %lastSize = $(%sizeVar,2)
  var %stable = $(%stableVar,2)
  if (%stable !isnum) var %stable = 0
  .timer $+ %retryTimer 1 5 mx.del.try $qt(%f)
  if ((%lastSize !isnum) || (%size != %lastSize)) {
    set $+($chr(37),mx.del.size.,%id) %size
    set $+($chr(37),mx.del.stable.,%id) 0
    return
  }
  var %stable = $calc(%stable + 1)
  set $+($chr(37),mx.del.stable.,%id) %stable
  if (%stable < 2) return
  .remove $qt(%f)
  if ($isfile(%f)) return
  if ($timer(%retryTimer)) .timer $+ %retryTimer off
  unset %mx.del.size. [ $+ [ %id ] ]
  unset %mx.del.stable. [ $+ [ %id ] ]
  set %mx.delist $remtok(%mx.delist,%f,1,124)
  if (!$numtok(%mx.delist,124)) unset %mx.delist
  mx.dbg %mx.c1 RAR file removed: $+ %mx.c2 %f %mx.nc
  mx.rar.jobdir.clean %f
  if ((%completeWork) && ($isdir(%completeWork))) {
    mx.cfg.dir.purge %completeWork
  }
  .timerUSLOTS 1 2 mx.slots.update
}

alias -l mx.net2cid {
  var %raw = $1
  var %net = $lower($remove($strip(%raw),$chr(13),$chr(10)))
  if (!%net) return 0
  var %i = 1
  while ($scon(%i)) {
    if ($scon(%i).status == connected) {
      if ($lower($scon(%i).network) == %net) {
        return $scon(%i).cid
      }
    }
    inc %i
  }
  return 0
}

alias -l mx.fmt.time {
  if (!$isnum($1)) return 00:00:00
  var %s = $int($1)
  if (%s < 0) %s = 0
  var %h = $int($calc(%s / 3600))
  var %m = $int($calc((%s % 3600) / 60))
  var %r = $int($calc(%s % 60))
  var %hh = $iif(%h < 10,0 $+ %h,%h)
  return $+(%hh,:,$right(00 $+ %m,2),:,$right(00 $+ %r,2))
}

alias mx.bytes {
  if (!$isnum($1)) return 0 B
  var %b = $abs($1), %join = $iif($2 == 1,1,0)
  if (%b < 1024) return $iif(%join,%b $+ B,%b B)
  if (%b < 1048576) return $iif(%join,$round($calc(%b / 1024),2) $+ KB,$round($calc(%b / 1024),2) KB)
  if (%b < 1073741824) return $iif(%join,$round($calc(%b / 1048576),2) $+ MB,$round($calc(%b / 1048576),2) MB)
  if (%b < 1099511627776) return $iif(%join,$round($calc(%b / 1073741824),2) $+ GB,$round($calc(%b / 1073741824),2) GB)
  return $iif(%join,$round($calc(%b / 1099511627776),2) $+ TB,$round($calc(%b / 1099511627776),2) TB)
}

alias mx.cfg.vars.defaults {
  set %mx.version 2.1.4
  if (%mx.update.enabled == $null) set %mx.update.enabled 1
  if (%mx.update.interval == $null) set %mx.update.interval 86400
  if (%mx.update.manifest == $null) set %mx.update.manifest https://raw.githubusercontent.com/mxbiteck/mxrarserver/main/mxrarserver.version
  if (%mx.out.delay == $null) set %mx.out.delay 7000
  if (%mx.find.out.delay == $null) set %mx.find.out.delay 3000
  if (%mx.trigger == $null) set %mx.trigger $me
  if (%mx.enabled == $null) set %mx.enabled 0
  if (%mx.join == $null) set %mx.join 1
  if (%mx.ads == $null) set %mx.ads 1
  if (%mx.ad.echo == $null) set %mx.ad.echo 0
  if (%mx.list == $null) set %mx.list 1
  if (%mx.slots == $null) set %mx.slots 0
  if (%mx.maxsend == $null) set %mx.maxsend 3
  if (%mx.maxrequest == $null) set %mx.maxrequest 10
  if (%mx.maxpernick == $null) set %mx.maxpernick 1
  if (%mx.maxfind == $null) set %mx.maxfind 3
  if (%mx.sendinterval == $null) set %mx.sendinterval 3
  if (%mx.adstime == $null) set %mx.adstime 300
  if (%mx.chans == $null) set %mx.chans
  if (%mx.chansadv == $null) set %mx.chansadv
  if (%mx.delist == $null) set %mx.delist
  if (%mx.waitdcc == $null) set %mx.waitdcc 0
  if (%mx.scriptdir == $null) set %mx.scriptdir $scriptdir
  if (%mx.paths.layout != 2) {
    var %oldroot = %mx.scriptdir $+ publiclist
    var %newfolders = %oldroot $+ \folders
    var %newfiles = %oldroot $+ \files
    var %oldfilesbase = %mx.scriptdir $+ lists\files
    if (!$isdir(%oldroot)) mkdir %oldroot
    if (!$isdir(%newfolders)) mkdir %newfolders
    if (!$isdir(%newfiles)) mkdir %newfiles
    if (($isfile(%oldroot $+ \lists.txt)) && (!$isfile(%newfolders $+ \lists.txt))) copy -o $qt(%oldroot $+ \lists.txt) $qt(%newfolders $+ \lists.txt)
    if (($isfile(%oldroot $+ \plists.txt)) && (!$isfile(%newfolders $+ \plists.txt))) copy -o $qt(%oldroot $+ \plists.txt) $qt(%newfolders $+ \plists.txt)
    if (($isfile(%oldroot $+ \plistnames.txt)) && (!$isfile(%newfolders $+ \plistnames.txt))) copy -o $qt(%oldroot $+ \plistnames.txt) $qt(%newfolders $+ \plistnames.txt)
    if (($isfile(%oldroot $+ \masterlist.txt)) && (!$isfile(%newfolders $+ \masterlist.txt))) copy -o $qt(%oldroot $+ \masterlist.txt) $qt(%newfolders $+ \masterlist.txt)
    if (($isfile(%oldroot $+ \masterlist.ini)) && (!$isfile(%newfolders $+ \masterlist.ini))) copy -o $qt(%oldroot $+ \masterlist.ini) $qt(%newfolders $+ \masterlist.ini)
    if (($isfile(%oldfilesbase $+ \masterlist.txt)) && (!$isfile(%newfiles $+ \masterlist.txt))) copy -o $qt(%oldfilesbase $+ \masterlist.txt) $qt(%newfiles $+ \masterlist.txt)
    if (($isfile(%oldfilesbase $+ \masterlist.ini)) && (!$isfile(%newfiles $+ \masterlist.ini))) copy -o $qt(%oldfilesbase $+ \masterlist.ini) $qt(%newfiles $+ \masterlist.ini)
    set %mx.publicroot %oldroot
    set %mx.plbase %newfolders
    set %mx.plexe %oldroot $+ \PublicListBuilder.exe
    set %mx.conf %newfolders $+ \lists.txt
    set %mx.database %newfolders $+ \plists.txt
    set %mx.masterlist %newfolders $+ \masterlist.txt
    set %mx.plnames %newfolders $+ \plistnames.txt
    set %mx.files.public %newfiles
    set %mx.files.masterlist %newfiles $+ \masterlist.txt
    set %mx.paths.layout 2
  }
  if (%mx.publicroot == $null) set %mx.publicroot %mx.scriptdir $+ publiclist
  if (%mx.plbase == $null) set %mx.plbase %mx.publicroot $+ \folders
  if (%mx.plexe == $null) set %mx.plexe %mx.publicroot $+ \PublicListBuilder.exe
  if (%mx.conf == $null) set %mx.conf %mx.plbase $+ \lists.txt
  if (%mx.database == $null) set %mx.database %mx.plbase $+ \plists.txt
  if (%mx.ext == $null) set %mx.ext rar
  if (%mx.masterlist == $null) set %mx.masterlist %mx.plbase $+ \masterlist.txt
  if (%mx.plnames == $null) set %mx.plnames %mx.plbase $+ \plistnames.txt
  if (%mx.files.base == $null) set %mx.files.base %mx.publicroot $+ \files
  if (%mx.files.public == $null) set %mx.files.public %mx.files.base
  if (%mx.files.database == $null) set %mx.files.database %mx.files.base $+ \plists.txt
  if (%mx.files.conf == $null) set %mx.files.conf %mx.files.base $+ \lists.txt
  if (%mx.files.plnames == $null) set %mx.files.plnames %mx.files.base $+ \plistnames.txt
  if (%mx.files.masterlist == $null) set %mx.files.masterlist %mx.files.base $+ \masterlist.txt
  if (%mx.files.errors == $null) set %mx.files.errors %mx.files.base $+ \errors.txt
  if (%mx.complete.dir == $null) set %mx.complete.dir %mx.publicroot $+ \complete
  if (%mx.complete.jobs == $null) set %mx.complete.jobs %mx.complete.dir $+ \jobs
  if (%mx.complete.timeout == $null) set %mx.complete.timeout 300
  if (%mx.assignments == $null) set %mx.assignments %mx.scriptdir $+ assignments.txt
  if (%mx.files.list == $null) set %mx.files.list 1
  if (%mx.files.subfolders == $null) set %mx.files.subfolders 1
  if (%mx.files.excludehidden == $null) set %mx.files.excludehidden 1
  if (%mx.files.excluded == $null) set %mx.files.excluded .ini,.db,.tmp,.part
  if (%mx.queue == $null) set %mx.queue %mx.scriptdir $+ mxqueue.txt
  if (%mx.inqueue == $null) set %mx.inqueue %mx.scriptdir $+ mxqueuein.txt
  if (%mx.files.lookup.queue == $null) set %mx.files.lookup.queue %mx.scriptdir $+ mxfileslookup.txt
  if (%mx.find.request.queue == $null) set %mx.find.request.queue %mx.scriptdir $+ mxfindrequests.txt
  if (%mx.out.queue == $null) set %mx.out.queue %mx.scriptdir $+ mxqueueout.txt
  if (%mx.find.queue == $null) set %mx.find.queue %mx.scriptdir $+ mxfindqueueout.txt
  if (%mx.find.cooldown == $null) set %mx.find.cooldown 5
  if (%mx.find.interval == $null) set %mx.find.interval 250
  if (%mx.dll == $null) set %mx.dll %mx.scriptdir $+ mxbsk.dll
  if (%mx.finder.dll == $null) set %mx.finder.dll %mx.scriptdir $+ dll\mxfinder.dll
  if (%mx.rarworker == $null) set %mx.rarworker %mx.scriptdir $+ mxrar.exe
  if (%mx.winrar == $null) set %mx.winrar C:\Program Files\WinRAR\Rar.exe
  if (%mx.winrarui == $null) set %mx.winrarui C:\Program Files\WinRAR\WinRAR.exe
  if (%mx.workdir == $null) set %mx.workdir %mx.scriptdir $+ rarwork\
  if (%mx.busy == $null) set %mx.busy 0
  if (%mx.idle.sleep == $null) set %mx.idle.sleep 5
  if (%mx.idle.sleep < 0) set %mx.idle.sleep 0
  if (%mx.idle.sleep > 60) set %mx.idle.sleep 60
  set %mx.idle $iif(%mx.idle.sleep > 0,1,0)
  if (%mx.last.activity == $null) set %mx.last.activity $ctime
  if (%mx.sleeping == $null) set %mx.sleeping 0
  if (%mx.rartimeout == $null) set %mx.rartimeout 300
  if (%mx.wd == $null) set %mx.wd 30
  if (%mx.smart == $null) set %mx.smart 1
  if (%mx.compress == $null) set %mx.compress 0
  if (%mx.debug == $null) set %mx.debug 0
  if (%mx.wdebug == $null) set %mx.wdebug $iif(%mx.debug == 1,1,0)
  if (%mx.debug != 1) set %mx.wdebug 0
  if ((%mx.wdebug !isnum 0-2)) set %mx.wdebug 0
  set %mx.debug $iif(%mx.wdebug == 0,0,1)
  if (%mx.adcc == $null) set %mx.adcc 0
  if (%mx.ctcp.channels == $null) set %mx.ctcp.channels 1
  if (%mx.respond.list == $null) set %mx.respond.list 1
  if (%mx.find.enabled == $null) set %mx.find.enabled 1
  if (%mx.loaded.time == $null) set %mx.loaded.time $asctime(yyyy-mm-dd HH:nn:ss)
  if (%mx.c1 == $null) set %mx.c1 15,02
  if (%mx.c2 == $null) set %mx.c2 09,02
  if (%mx.c3 == $null) set %mx.c3 04,02
  if (%mx.c4 == $null) set %mx.c4 02
  if (%mx.nc == $null) set %mx.nc 
  if (%mx.cr == $null) set %mx.cr ■
  if (%mx.theme == $null) set %mx.theme MX Classic
  if (%mx.nocolor == $null) set %mx.nocolor 0
  if (%mx.ad.nocolor == $null) set %mx.ad.nocolor 0
}

on *:CONNECT:{
  if (%mx.enabled != 1) return
  if (%mx.sleeping == 1) {
    set %mx.sleeping 0
    mx.idle.touch
    mx.title.refresh
  }
  mx.dcconf
  mx.out.start
  if ((%mx.ads == 1) && (%mx.chansadv)) mx.start.adx
}

alias mx.dcconf {
  .ctcps on
  .events on
  .raw on
  .fsend on
  .dcc packetsize 65536
  .pdcc on
}

on *:LOAD:{
  if ($version < 7.0) {
    echo -a 04Error: mx.rarserver requires mIRC 7.0 or higher.
    .unload -rs $script
    halt
  }
  if (%mx.started) return
  set %mx.started 1
  mx.start
}

on *:UNLOAD:{
  if (%mx.update.reload == 1) return
  .run -n taskkill /IM mxrar.exe /T /F
  .run -n taskkill /IM PublicListBuilder.exe /T /F
  .timermx* off
  .timerPLB2 off
  .timerbuildmini_close off
  .timerTDBG off
  .timerTDCC off
  .timerUSLOTS off
  unset %mx.find.cooldown.nick.*
  if ($dialog(mx.rarserver)) dialog -x mx.rarserver
  if ($dialog(mx.workdir)) dialog -x mx.workdir
  if ($dialog(mx.addchan)) dialog -x mx.addchan
  if ($dialog(mx.monitor)) dialog -x mx.monitor
  if ($dialog(mx.buildmini)) dialog -x mx.buildmini
  if ($dialog(mx.compress)) dialog -x mx.compress
  if ($dialog(mx.windows)) dialog -x mx.windows
  if ($window(@mx.debug.win)) window -c @mx.debug.win
  if ($window(@mx.dcc.win)) window -c @mx.dcc.win
  var %a = $input(Do you want to keep MXRAR variables?,yn,MXRAR Unload)
  if (%a == $true) {
    unset %mx.busy
    unset %mx.current.*
    unset %mx.compress.lock
    unset %mx.queue.lock
    unset %mx.queue.lockts
    unset %mx.sent.list
    unset %mx.sent.tick.*
    unset %mx.sleeping
    unset %mx.started
  }
  else {
    unset %mx.*
  }
}

on *:START:{
  set %mx.started 1
  mx.start
}

on *:EXIT:{
  .run -n taskkill /IM mxrar.exe /T /F
  .run -n taskkill /IM PublicListBuilder.exe /T /F
}

alias mx.kill.rar.clean {
  .run -n taskkill /IM mxrar.exe /T /F
  .timerMXRAR off
  .timerMXWATCH off
  if ((%mx.current.running != $null) && ($isfile(%mx.current.running))) {
    mx.dbg %mx.c2 [warn] %mx.c1 Attempted to terminate mxrar.exe and clean compression state. Removing .running marker. %mx.nc
    .remove $qt(%mx.current.running)
    if ($dialog(mx.compress)) dialog -x mx.compress
  }
  if ($1 == resume) {
    .timerMXCANCELRESUME off
    .timerMXCANCELRESUME 1 2 mx.compress.cancel.resume
  }
  if (%mx.busy == 1) {
    set %mx.current.error manual_kill
    mx.cleanup.fail
    mx.cleanup
  }
  else {
    unset %mx.current.*
    set %mx.busy 0
  }
  unset %mx.queue.lock
  unset %mx.queue.lockts
  unset %mx.sleeping
  mx.compress.close
  mx.title.refresh
}

alias mx.stats.folder.cancel {
  inc %mx.stats.folder.cancelled
  if ($dialog(mx.rarserver)) {
    mx.main.stats.refresh
  }
}

alias mx.compress.cancel.resume {
  .timerMXRAR off
  .timerMXWATCH off
  unset %mx.queue.lock
  unset %mx.queue.lockts
  set %mx.busy 0
  unset %mx.current.*
  mx.compress.close
  mx.title.refresh
  .timerMXRMXSEND off
  .timerMXRMXSEND 1 3 dmx.queue.start
}

alias mx.kill.builder.clean {
  var %completeJob = %mx.complete.job.file
  .run -n taskkill /IM PublicListBuilder.exe /T /F
  .timerPLB2 off
  .timerMXBUILDMINI off
  .timerMXFILESBUILD off
  .timerMXCOMPLETE off
  if ($isfile($+(%mx.plbase,\publiclistbuilder.running))) {
    mx.dbg %mx.c2 [warn] %mx.c1 Attempted to terminate PublicListBuilder.exe and clean build state. Removing publiclistbuilder.running marker. %mx.nc
    .remove $qt($+(%mx.plbase,\publiclistbuilder.running))
  }
  if ((%mx.files.build.marker) && ($isfile(%mx.files.build.marker))) .remove $qt(%mx.files.build.marker)
  if (($isfile($+(%mx.files.base,\running.tmp)))) .remove $qt($+(%mx.files.base,\running.tmp))
  if ((%mx.complete.job.marker) && ($isfile(%mx.complete.job.marker))) .remove $qt(%mx.complete.job.marker)
  if ((%mx.complete.job.workdir) && ($isdir(%mx.complete.job.workdir))) mx.cfg.dir.purge %mx.complete.job.workdir
  if (%completeJob) mx.complete.job.remove %completeJob
  unset %mx.complete.active
  unset %mx.complete.job.*
  unset %mx.files.build.*
  unset %mx.build.run
  unset %mx.build.watch
  unset %mx.build.count
  unset %mx.build.name
  unset %mx.build.start
  unset %mx.build.mode
  unset %mx.plphase
  if ($dialog(mx.buildmini)) dialog -x mx.buildmini
  mx.title.refresh
}

alias -l mx.compress.active {
  if (%mx.busy != 1) return 0
  if ((%mx.current.running == $null) || (!$isfile(%mx.current.running))) return 0
  if ($timer(MXRAR).state == on) return 1
  return 0
}

alias mx.restart {
  if ($mx.compress.active) {
    mx.dbg %mx.c1 Restart blocked, compression in progress %mx.nc
    return
  }
  unset %mx.queue.lock
  unset %mx.queue.lockts
  if (%mx.busy == 1) {
    set %mx.current.error admin_restart
    mx.cleanup.fail
    mx.cleanup
  }
  else {
    if ((%mx.current.running != $null) && ($isfile(%mx.current.running))) {
      mx.dbg %mx.c2 [warn] %mx.c1 Stale .running found during restart. Cleaning up. %mx.nc
      mx.cleanup
    }
    else {
      unset %mx.current.*
      set %mx.busy 0
      mx.compress.close
    }
  }
  mx.kill.builder.clean
  .timermx* off
  .timerPLB2 off
  .timerbuildmini_close off
  .timerTDBG off
  .timerTDCC off
  .timerUSLOTS off
  unset %mx.trigger.cooldown.*
  unset %mx.find.cooldown.nick.*
  unset %mx.queue.lock
  unset %mx.queue.lockts
  mx.bootstrap
  mx.apply.runtime
  .timermx_finder_preload -m 1 500 mx.files.index.preload
  if ((%mx.enabled == 1) && (%mx.sleeping != 1) && ($isfile(%mx.inqueue)) && ($read(%mx.inqueue,n,1))) {
    .timermxinproc -m 1 1 mx.in.process
  }
  if ((%mx.enabled == 1) && ($isfile(%mx.files.lookup.queue)) && ($read(%mx.files.lookup.queue,n,1))) {
    .timermxfileslookup -m 1 100 mx.files.lookup.process
  }
  if ((%mx.enabled == 1) && ($isfile(%mx.find.request.queue)) && ($read(%mx.find.request.queue,n,1))) {
    .timermxfindrequest -m 1 100 mx.find.request.process
  }
  if ($send(0) > 0) {
    mx.speed.start
  }
  if ($dialog(mx.monitor)) {
    .timermx_monitor_guard 0 1 mx.monitor.guard
  }
  if ($dialog(mx.rarserver)) {
    mx.cfg.queue.refresh
    mx.cfg.ui.load
  }
  if (%mx.busy != 1) {
    mx.compress.close
  }
  mx.title.refresh
  echo -a $+($mx.logo,%mx.c1,System restarted,$chr(32),%mx.nc)
}

alias mx.bootstrap {
  mx.cfg.vars.defaults
  mx.stats.init
  if (!$isdir(%mx.publicroot)) mkdir %mx.publicroot
  if (!$isdir(%mx.plbase)) mkdir %mx.plbase
  if (!$isdir(%mx.files.base)) mkdir %mx.files.base
  if (!$isdir(%mx.files.public)) mkdir %mx.files.public
  if (!$isdir(%mx.complete.dir)) mkdir %mx.complete.dir
  if (!$isdir(%mx.complete.jobs)) mkdir %mx.complete.jobs
  if ($isdir(%mx.workdir)) mx.cfg.dir.purge %mx.workdir
  if (!$isdir(%mx.workdir)) mkdir %mx.workdir
  if (!$isfile(%mx.database)) write -c %mx.database
  if (!$isfile(%mx.conf)) write -c %mx.conf
  if (!$isfile(%mx.plnames)) write -c %mx.plnames
  if (!$isfile(%mx.files.database)) write -c $qt(%mx.files.database)
  if (!$isfile(%mx.files.conf)) write -c $qt(%mx.files.conf)
  if (!$isfile(%mx.files.plnames)) write -c $qt(%mx.files.plnames)
  if (!$isfile(%mx.assignments)) write -c $qt(%mx.assignments)
  if (!$isfile(%mx.queue)) write -c %mx.queue
  mx.complete.startup.clean
  var %completeCount = $findfile(%mx.complete.jobs,*.mxc,0)
  while (%completeCount >= 1) {
    var %completeFile = $mx.path.norm($findfile(%mx.complete.jobs,*.mxc,%completeCount))
    if ($mx.complete.job.is(%completeFile)) {
      var %completeNick = $mx.complete.job.get(%completeFile,nick)
      var %completeNet = $mx.complete.job.get(%completeFile,network)
      if (!$dmx.queue.exists(%completeNick,%completeNet,%completeFile)) {
        mx.complete.job.remove %completeFile
      }
    }
    else {
      mx.complete.job.remove %completeFile
    }
    dec %completeCount
  }
  if (!$isfile(%mx.inqueue)) write -c %mx.inqueue
  if (!$isfile(%mx.files.lookup.queue)) write -c $qt(%mx.files.lookup.queue)
  if (!$isfile(%mx.find.request.queue)) write -c $qt(%mx.find.request.queue)
  mx.in.legacy.lookup.clean
  if (!$isfile(%mx.out.queue)) write -c %mx.out.queue
  if (!$isfile(%mx.find.queue)) write -c %mx.find.queue
  mx.del.clean
  mx.assignment.migrate
  mx.assignment.sync
}

alias mx.hardreset {
  if ($mx.compress.active) {
    mx.dbg %mx.c1 Hard reset blocked, compression in progress %mx.nc
    return
  }
  var %a = $input(Are you sure you want to HARD RESET the system?,yn,MXRAR)
  if (%a != $true) return
  var %b = $input(This will DELETE queue, lists, channels and configuration. Continue?,yn,MXRAR)
  if (%b != $true) return
  unset %mxhr.*
  var %keepstats = $input(Do you want to keep current statistics?,yn,MXRAR Statistics)
  if (%keepstats == $true) {
    set %mxhr.keepstats 1
    set %mxhr.loaded.time %mx.loaded.time
    set %mxhr.stats.daystamp %mx.stats.daystamp
    set %mxhr.rarrequested %mx.rarrequested
    set %mxhr.rarstart %mx.rarstart
    set %mxhr.rarcompleted %mx.rarcompleted
    set %mxhr.rarsent %mx.rarsent
    set %mxhr.rarfail %mx.rarfail
    set %mxhr.rarcobytes %mx.rarcobytes
    set %mxhr.rartsent %mx.rartsent
    set %mxhr.rardsent %mx.rardsent
    set %mxhr.rarysent %mx.rarysent
    set %mxhr.rarbmsent %mx.rarbmsent
    set %mxhr.rarbysent %mx.rarbysent
    set %mxhr.rlists %mx.rlists
    set %mxhr.clists %mx.clists
    set %mxhr.flists %mx.flists
    set %mxhr.rarday %mx.rarday
    set %mxhr.rarmonth %mx.rarmonth
    set %mxhr.raryear %mx.raryear
    set %mxhr.stats.file.requested %mx.stats.file.requested
    set %mxhr.stats.file.sent %mx.stats.file.sent
    set %mxhr.stats.file.completed %mx.stats.file.completed
    set %mxhr.stats.file.failed %mx.stats.file.failed
    set %mxhr.stats.file.bytes %mx.stats.file.bytes
    set %mxhr.stats.file.daycount %mx.stats.file.daycount
    set %mxhr.stats.file.daybytes %mx.stats.file.daybytes
    set %mxhr.stats.file.yesterdaycount %mx.stats.file.yesterdaycount
    set %mxhr.stats.file.yesterdaybytes %mx.stats.file.yesterdaybytes
    set %mxhr.stats.folder.sent %mx.stats.folder.sent
    set %mxhr.stats.folder.cancelled %mx.stats.folder.cancelled
    set %mxhr.stats.folder.daycount %mx.stats.folder.daycount
    set %mxhr.stats.folder.yesterdaycount %mx.stats.folder.yesterdaycount
    set %mxhr.stats.transfer.seconds %mx.stats.transfer.seconds
  }
  mx.kill.builder.clean
  mx.compress.close
  .timermx* off
  .timerPLB2 off
  .timerbuildmini_close off
  .timerTDBG off
  .timerTDCC off
  .timerUSLOTS off
  unset %mx.queue.lock
  unset %mx.queue.lockts
  if ($dialog(mx.rarserver)) dialog -x mx.rarserver
  if ($dialog(mx.workdir)) dialog -x mx.workdir
  if ($dialog(mx.addchan)) dialog -x mx.addchan
  if ($dialog(mx.monitor)) dialog -x mx.monitor
  if ($dialog(mx.buildmini)) dialog -x mx.buildmini
  if ($dialog(mx.compress)) dialog -x mx.compress
  if ($dialog(mx.windows)) dialog -x mx.windows
  if ($window(@mx.debug.win)) window -c @mx.debug.win
  if ($window(@mx.dcc.win)) window -c @mx.dcc.win
  if ($hget(mx.outq)) hfree -w mx.outq
  if ($hget(mx.build.reported)) hfree -w mx.build.reported
  if ((%mx.queue) && ($isfile(%mx.queue))) {
    .remove $qt(%mx.queue)
  }
  if ((%mx.inqueue) && ($isfile(%mx.inqueue))) {
    .remove $qt(%mx.inqueue)
  }
  if ((%mx.files.lookup.queue) && ($isfile(%mx.files.lookup.queue))) {
    .remove $qt(%mx.files.lookup.queue)
  }
  if ((%mx.find.request.queue) && ($isfile(%mx.find.request.queue))) {
    .remove $qt(%mx.find.request.queue)
  }
  if ((%mx.out.queue) && ($isfile(%mx.out.queue))) {
    .remove $qt(%mx.out.queue)
  }
  if ((%mx.find.queue) && ($isfile(%mx.find.queue))) {
    .remove $qt(%mx.find.queue)
  }
  if ((%mx.assignments) && ($isfile(%mx.assignments))) {
    .remove $qt(%mx.assignments)
  }
  if ((%mx.plbase) && ($isdir(%mx.plbase))) {
    mx.cfg.dir.purge %mx.plbase
  }
  if ((%mx.files.public) && ($isdir(%mx.files.public))) {
    mx.cfg.dir.purge %mx.files.public
  }
  if ((%mx.complete.dir) && ($isdir(%mx.complete.dir))) {
    mx.cfg.dir.purge %mx.complete.dir
  }
  if ((%mx.workdir) && ($isdir(%mx.workdir))) {
    mx.cfg.dir.purge %mx.workdir
  }
  unset %mx.*
  mx.bootstrap
  mx.cfg.vars.defaults
  mx.stats.init
  if (%mxhr.keepstats == 1) {
    set %mx.loaded.time $iif(%mxhr.loaded.time != $null,%mxhr.loaded.time,$asctime(yyyy-mm-dd HH:nn:ss))
    set %mx.stats.daystamp $iif(%mxhr.stats.daystamp != $null,%mxhr.stats.daystamp,$asctime(yyyy-mm-dd))
    set %mx.rarrequested $iif(%mxhr.rarrequested isnum,%mxhr.rarrequested,0)
    set %mx.rarstart $iif(%mxhr.rarstart isnum,%mxhr.rarstart,0)
    set %mx.rarcompleted $iif(%mxhr.rarcompleted isnum,%mxhr.rarcompleted,0)
    set %mx.rarsent $iif(%mxhr.rarsent isnum,%mxhr.rarsent,0)
    set %mx.rarfail $iif(%mxhr.rarfail isnum,%mxhr.rarfail,0)
    set %mx.rarcobytes $iif(%mxhr.rarcobytes isnum,%mxhr.rarcobytes,0)
    set %mx.rartsent $iif(%mxhr.rartsent isnum,%mxhr.rartsent,0)
    set %mx.rardsent $iif(%mxhr.rardsent isnum,%mxhr.rardsent,0)
    set %mx.rarysent $iif(%mxhr.rarysent isnum,%mxhr.rarysent,0)
    set %mx.rarbmsent $iif(%mxhr.rarbmsent isnum,%mxhr.rarbmsent,0)
    set %mx.rarbysent $iif(%mxhr.rarbysent isnum,%mxhr.rarbysent,0)
    set %mx.rlists $iif(%mxhr.rlists isnum,%mxhr.rlists,0)
    set %mx.clists $iif(%mxhr.clists isnum,%mxhr.clists,0)
    set %mx.flists $iif(%mxhr.flists isnum,%mxhr.flists,0)
    set %mx.rarday $iif(%mxhr.rarday isnum,%mxhr.rarday,$day)
    set %mx.rarmonth $iif(%mxhr.rarmonth isnum,%mxhr.rarmonth,$month)
    set %mx.raryear $iif(%mxhr.raryear isnum,%mxhr.raryear,$year)
    set %mx.stats.file.requested $iif(%mxhr.stats.file.requested isnum,%mxhr.stats.file.requested,0)
    set %mx.stats.file.sent $iif(%mxhr.stats.file.sent isnum,%mxhr.stats.file.sent,0)
    set %mx.stats.file.completed $iif(%mxhr.stats.file.completed isnum,%mxhr.stats.file.completed,0)
    set %mx.stats.file.failed $iif(%mxhr.stats.file.failed isnum,%mxhr.stats.file.failed,0)
    set %mx.stats.file.bytes $iif(%mxhr.stats.file.bytes isnum,%mxhr.stats.file.bytes,0)
    set %mx.stats.file.daycount $iif(%mxhr.stats.file.daycount isnum,%mxhr.stats.file.daycount,0)
    set %mx.stats.file.daybytes $iif(%mxhr.stats.file.daybytes isnum,%mxhr.stats.file.daybytes,0)
    set %mx.stats.file.yesterdaycount $iif(%mxhr.stats.file.yesterdaycount isnum,%mxhr.stats.file.yesterdaycount,0)
    set %mx.stats.file.yesterdaybytes $iif(%mxhr.stats.file.yesterdaybytes isnum,%mxhr.stats.file.yesterdaybytes,0)
    set %mx.stats.folder.sent $iif(%mxhr.stats.folder.sent isnum,%mxhr.stats.folder.sent,0)
    set %mx.stats.folder.cancelled $iif(%mxhr.stats.folder.cancelled isnum,%mxhr.stats.folder.cancelled,0)
    set %mx.stats.folder.daycount $iif(%mxhr.stats.folder.daycount isnum,%mxhr.stats.folder.daycount,0)
    set %mx.stats.folder.yesterdaycount $iif(%mxhr.stats.folder.yesterdaycount isnum,%mxhr.stats.folder.yesterdaycount,0)
    set %mx.stats.transfer.seconds $iif(%mxhr.stats.transfer.seconds isnum,%mxhr.stats.transfer.seconds,0)
  }
  unset %mxhr.*
  mx.apply.runtime
  if (!$dialog(mx.rarserver)) {
    .timerMXHR 1 3 dialog -m mx.rarserver mx.rarserver
  }
  echo -a $+($mx.logo,%mx.c1 Hard reset completed,$chr(32),%mx.nc)
}

alias dmx.queue.clear {
  if (!$mx.queue.lock.acquire(dmx.queue.clear)) return
  if ($isfile(%mx.queue)) {
    mx.dbg %mx.c1 Clearing queue file %mx.nc
    mx.complete.queue.cleanup
    .remove $qt(%mx.queue)
  }
  else {
    mx.dbg %mx.c1 Queue already empty %mx.nc
  }
  unset %mx.queue.rr.last
  dmx.queue.refresh
  if ($dialog(mx.rarserver)) {
    mx.cfg.queue.refresh
  }
  mx.title.refresh
  mx.queue.lock.release dmx.queue.clear
}

alias -l dmx.queue.exists {
  var %nick = $1
  var %net  = $2
  var %payload = $3-
  if (!$isfile(%mx.queue)) return 0
  var %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    var %qnick = $mx.queue.nick(%line)
    var %qnet  = $mx.queue.net(%line)
    var %qpayload = $mx.queue.payload(%line)
    if (($lower(%qnick) == $lower(%nick)) && ($lower(%qnet) == $lower(%net)) && ($lower(%qpayload) == $lower(%payload))) return %i
    inc %i
  }
  return 0
}

alias -l dmx.queue.countnick {
  var %nick = $1
  var %net = $2
  if (!%nick) return 0
  if (!$isfile(%mx.queue)) return 0
  var %i = 1, %c = 0
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    var %qnick = $mx.queue.nick(%line)
    var %qnet  = $mx.queue.net(%line)
    if ($lower(%qnick) == $lower(%nick)) {
      if ((!%net) || ($lower(%qnet) == $lower(%net))) inc %c
    }
    inc %i
  }
  return %c
}

alias dmx.queue.add {
  mx.idle.wake
  if (!$mx.queue.lock.acquire(dmx.queue.add)) {
    mx.dbg %mx.c1 Add blocked, queue lock unavailable %mx.nc
    return
  }
  var %nick = $1
  var %net = $2
  var %mode = $lower($3)
  var %payload = $4-
  if (!$istok(normal silent ctcp,%mode,32)) {
    %mode = normal
    %payload = $3-
  }
  if ($mx.complete.job.is(%payload)) {
    var %jobMode = $lower($mx.complete.job.get(%payload,mode))
    if ($istok(normal silent ctcp,%jobMode,32)) %mode = %jobMode
  }
  if ((!%nick) || (!%net) || (!%payload)) { mx.queue.lock.release dmx.queue.add | return }
  var %cid = $mx.net2cid(%net)
  if (%cid) scid %cid
  var %isList = $mx.payload.islist(%payload)
  var %ln = $dmx.queue.exists(%nick,%net,%payload)
  if (%ln) {
    if (%mode != ctcp) {
      if (%isList) mx.out.send notice %cid %nick %mx.c1 Request denied, you already have a list request pending: %mx.c2 $+ $nopath(%payload) %mx.c1 $+ in the position: %mx.c2 $+ %ln %mx.c3 $+ %mx.cr $+ $mx.logo
      else mx.out.send notice %cid %nick %mx.c1 Request denied, you already have %mx.c2 $+ %payload %mx.c1 $+ in the position: %mx.c2 $+ %ln %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.queue.lock.release dmx.queue.add
    return
  }
  if ((%mx.busy == 1) && ($lower(%mx.current.nick) == $lower(%nick)) && ($lower(%mx.current.net) == $lower(%net)) && ($lower(%mx.current.payload) == $lower(%payload))) {
    if (%mode != ctcp) {
      if (%isList) mx.out.send notice %cid %nick %mx.c1 Request %mx.c2 $+ $nopath(%payload) %mx.c1 $+ is already in process.. %mx.c3 $+ %mx.cr $+ $mx.logo
      else mx.out.send notice %cid %nick %mx.c1 Request %mx.c2 $+ %payload %mx.c1 $+ is in process.. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.queue.lock.release dmx.queue.add
    return
  }
  if ((%mx.maxrequest isnum) && (%mx.maxrequest > 0)) {
    var %c = $dmx.queue.countnick(%nick,%net)
    if (%c >= %mx.maxrequest) {
      if (%mode != ctcp) mx.out.send notice %cid %nick %mx.c1 Request denied. You reached %mx.c2 $+ %c $+ %mx.c1 of %mx.c2 $+ %mx.maxrequest $+ %mx.c1 allowed requests. Please try again later. $+ $mx.logo
      mx.queue.lock.release dmx.queue.add
      return
    }
  }
  if (%isList) {
    var %tmpfile = %mx.queue $+ .tmp
    write -c $qt(%tmpfile) $mx.queue.make(%nick,%net,%mode,%payload)
    if ($isfile(%mx.queue)) filter -ff $qt(%mx.queue) $qt(%tmpfile)
    .remove $qt(%mx.queue)
    .rename $qt(%tmpfile) $qt(%mx.queue)
  }
  else {
    write $qt(%mx.queue) $mx.queue.make(%nick,%net,%mode,%payload)
  }
  dmx.queue.refresh
  if ($dialog(mx.rarserver)) mx.cfg.queue.refresh
  mx.title.refresh
  var %pos = $dmx.queue.count
  var %qpos = $dmx.queue.countnick(%nick,%net)
  var %display = $nopath(%payload)
  if (!%display) %display = %payload
  mx.queue.lock.release dmx.queue.add
  if ((!%isList) && (%mode != ctcp)) {
    if ($isfile(%payload)) {
      mx.out.send notice %cid %nick %mx.c1 Request accepted: $+ %mx.c2 %display $+ %mx.c3 %mx.cr $+ %mx.c1 Queue position: %mx.c2 $+ %pos %mx.c3 $+ %mx.cr $+ %mx.c1 Allowed requests: %mx.c2 $+ %qpos %mx.c1 $+ of %mx.c2 $+ %mx.maxrequest %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    else {
      mx.out.send notice %cid %nick %mx.c1 Request accepted: $+ %mx.c2 %payload $+ %mx.c3 %mx.cr $+ %mx.c1 Queue position: %mx.c2 $+ %pos %mx.c3 $+ %mx.cr $+ %mx.c1 Allowed requests: %mx.c2 $+ %qpos %mx.c1 $+ of %mx.c2 $+ %mx.maxrequest %mx.c3 $+ %mx.cr $+ %mx.c1 Transfer starts automatically after compression. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
  }
}

alias dmx.queue.start.now {
  if (%mx.enabled != 1) return
  if (%mx.queue.joinwait == 1) return
  if (%mx.sleeping == 1) return
  .timerMXRARQ off
  .timerMXRARQ -io 1 2 mx.squeue
}

alias dmx.queue.start {
  if (%mx.enabled != 1) return
  if (%mx.queue.joinwait == 1) return
  if (%mx.sleeping == 1) return
  if (%mx.sendinterval !isnum) set %mx.sendinterval 8
  if (%mx.sendinterval < 3) set %mx.sendinterval 3
  .timerMXRARQ off
  .timerMXRARQ -io 1 %mx.sendinterval mx.squeue
}

alias mx.files.lookup.enqueue {
  var %data = $1-
  var %nick = $gettok(%data,1,29)
  var %net = $gettok(%data,2,29)
  var %mode = $lower($gettok(%data,3,29))
  var %list = $gettok(%data,4,29)
  var %key = $gettok(%data,5-,29)
  if ((!%nick) || (!%net) || (!%list) || (!%key)) {
    return
  }
  if (!$istok(normal silent ctcp,%mode,32)) %mode = normal
  var %id = $+($ticks,.,$rand(1000,9999))
  var %line = $+(%id,$chr(9),%nick,$chr(9),%net,$chr(9),%mode,$chr(9),%list,$chr(9),%key)
  write $qt(%mx.files.lookup.queue) %line
  if (!$timer(mxfileslookup)) {
    .timermxfileslookup -m 1 50 mx.files.lookup.process
  }
}

alias mx.files.lookup.process {
  if (%mx.enabled != 1) {
    return
  }
  if (!$isfile(%mx.files.lookup.queue)) {
    return
  }
  var %line = $read(%mx.files.lookup.queue,n,1)
  if (!%line) {
    return
  }
  write -dl 1 $qt(%mx.files.lookup.queue)
  var %id = $gettok(%line,1,9)
  var %nick = $gettok(%line,2,9)
  var %net = $gettok(%line,3,9)
  var %mode = $lower($gettok(%line,4,9))
  var %list = $gettok(%line,5,9)
  var %key = $gettok(%line,6-,9)
  var %version = $dll($qt(%mx.finder.dll),Version,0)
  if (*1.12* !iswm %version) {
    var %cid = $mx.net2cid(%net)
    if ((%cid) && (%mode != ctcp)) mx.out.send notice %cid %nick %mx.c2 Error: %mx.c1 Files lookup requires mxfinder.dll 1.12 Win32. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    if ($read(%mx.files.lookup.queue,n,1)) .timermxfileslookup -m 1 100 mx.files.lookup.process
    return
  }
  var %path = $mx.lookup.allowed(%mx.files.masterlist,%key,files,%list)
  if (%mx.lookup.laststatus == WAIT) {
    write -il 1 $qt(%mx.files.lookup.queue) %line
    .timermxfileslookup -m 1 1000 mx.files.lookup.process
    return
  }
  if (%mx.lookup.laststatus == ERR) {
    mx.dlist [LOOKUP] File lookup failed - Nick: %nick - Network: %net - Error: %mx.lookup.lasterror - Request: %key
  }
  var %cid = $mx.net2cid(%net)
  if ($isfile(%path)) {
    mx.in.queue %nick %net %mode %path
    if ($timer(MXRARQ).state != on) dmx.queue.start.now
  }
  elseif ((%cid) && (%mode != ctcp)) {
    if (%mx.lookup.laststatus == ERR) {
      mx.out.send notice %cid %nick %mx.c2 Error: $+ %mx.c1 Files lookup service is temporarily unavailable. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    else {
      mx.out.send notice %cid %nick %mx.c2 Error: $+ %mx.c1 File not found in the list assigned to this channel. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
  }
  mx.main.stats.refresh
  if ($read(%mx.files.lookup.queue,n,1)) {
    .timermxfileslookup -m 1 100 mx.files.lookup.process
  }
}

alias mx.in.legacy.lookup.clean {
  if (!$isfile(%mx.inqueue)) return
  var %i = $lines(%mx.inqueue)
  var %removed = 0
  while (%i >= 1) {
    var %line = $read(%mx.inqueue,n,%i)
    if ($lower($gettok(%line,1,9)) == lookup) {
      write -dl %i $qt(%mx.inqueue)
      inc %removed
    }
    dec %i
  }
}

alias mx.in.queue {
  if ($0 < 3) return
  var %nick = $1
  var %net = $2
  var %mode = $lower($3)
  var %payload = $4-
  if (!$istok(normal silent ctcp,%mode,32)) {
    %mode = normal
    %payload = $3-
  }
  if ((!%nick) || (!%net) || (!%payload)) return
  var %line = %nick $+ $chr(9) $+ %net $+ $chr(9) $+ %mode $+ $chr(9) $+ %payload
  write $qt(%mx.inqueue) %line
  .timermxinproc -m 1 1 mx.in.process
}

alias mx.in.process {
  if (!$isfile(%mx.inqueue)) return

  if ($mx.queue.locked) {
    .timermxinproc -m 1 100 mx.in.process
    return
  }

  if (!$mx.queue.lock.acquire(mx.in.process)) {
    .timermxinproc -m 1 100 mx.in.process
    return
  }
  var %line = $read(%mx.inqueue,n,1)
  if (!%line) {
    mx.queue.lock.release mx.in.process
    return
  }
  write -dl 1 $qt(%mx.inqueue)
  mx.queue.lock.release mx.in.process
  var %nick = $gettok(%line,1,9)
  var %net = $gettok(%line,2,9)
  var %mode = $lower($gettok(%line,3,9))
  var %payload
  if ($istok(normal silent ctcp,%mode,32)) {
    %payload = $gettok(%line,4-,9)
  }
  else {
    %mode = normal
    %payload = $gettok(%line,3-,9)
  }
  if ((%nick) && (%net) && (%payload)) dmx.queue.add %nick %net %mode %payload
  if ($read(%mx.inqueue,n,1)) .timermxinproc -m 1 1 mx.in.process
}

alias mx.build.notice {
  var %cid = $1
  var %nick = $2
  var %type = $lower($3)
  if ((!%cid) || (!%nick)) return
  if (%mx.complete.active == 1) {
    mx.out.send notice %cid %nick %mx.c1 Complete list build in progress. Requests are temporarily disabled. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    return
  }
  if (%type == files) {
    mx.out.send notice %cid %nick %mx.c1 Files list build in progress. File requests are temporarily disabled. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    return
  }
  if (%type == folders) {
    mx.out.send notice %cid %nick %mx.c1 Folders list build in progress. Folder requests are temporarily disabled. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    return
  }
  mx.out.send notice %cid %nick %mx.c1 Public list build in progress. Complete requests are temporarily disabled. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
}

;==============================================================================
; COMPLETE PUBLIC LIST - Files + Folders assigned to the requesting channel
;==============================================================================
alias -l mx.complete.job.is {
  var %job = $mx.path.norm($1-)
  if (!%job) return 0
  if (!$isfile(%job)) return 0
  if ($right($lower(%job),4) != .mxc) return 0
  if (!$mx.path.under(%job,%mx.complete.jobs)) return 0
  if ($lower($readini(%job,Complete,type)) != complete) return 0
  return 1
}

alias -l mx.complete.job.get {
  var %job = $mx.path.norm($1)
  var %item = $lower($strip($2))
  if (!$mx.complete.job.is(%job)) return
  if (!$istok(type nick network channel mode files folders created,%item,32)) return
  return $readini(%job,Complete,%item)
}

alias -l mx.complete.job.create {
  var %data = $1-
  var %nick = $strip($gettok(%data,1,29))
  var %net = $strip($gettok(%data,2,29))
  var %chan = $strip($gettok(%data,3,29))
  var %mode = $lower($strip($gettok(%data,4,29)))
  var %files = $strip($gettok(%data,5,29))
  var %folders = $strip($gettok(%data,6-,29))
  if ((!%nick) || (!%net) || (!%chan) || (!%files) || (!%folders)) return
  if ((%files == -) || (%folders == -)) return
  if (!$istok(normal silent ctcp,%mode,32)) %mode = normal
  if (!$isdir(%mx.complete.jobs)) mkdir %mx.complete.jobs
  if (!$isdir(%mx.complete.jobs)) return
  var %key = $lower($+(%nick,$chr(29),%net,$chr(29),%chan,$chr(29),%files,$chr(29),%folders))
  var %id = $hash(%key,32)
  var %job = $+(%mx.complete.jobs,\complete-,%id,.mxc)
  writeini $qt(%job) Complete type complete
  writeini $qt(%job) Complete nick %nick
  writeini $qt(%job) Complete network %net
  writeini $qt(%job) Complete channel %chan
  writeini $qt(%job) Complete mode %mode
  writeini $qt(%job) Complete files %files
  writeini $qt(%job) Complete folders %folders
  writeini $qt(%job) Complete created $ctime
  if (!$mx.complete.job.is(%job)) return
  return %job
}

alias -l mx.complete.job.display {
  var %job = $mx.path.norm($1-)
  if (!$mx.complete.job.is(%job)) return
  var %files = $mx.complete.job.get(%job,files)
  var %folders = $mx.complete.job.get(%job,folders)
  if ((!%files) || (!%folders)) return Complete
  return $+(%files,$chr(32),+,$chr(32),%folders)
}

alias -l mx.complete.job.remove {
  var %job = $mx.path.norm($1-)
  if (!%job) return
  if ($right($lower(%job),4) != .mxc) return
  if (!$mx.path.under(%job,%mx.complete.jobs)) return
  if ($isfile(%job)) .remove $qt(%job)
}

alias -l mx.complete.enqueue {
  var %data = $1-
  var %nick = $strip($gettok(%data,1,29))
  var %net = $strip($gettok(%data,2,29))
  var %chan = $strip($gettok(%data,3,29))
  var %mode = $lower($strip($gettok(%data,4,29)))
  var %cid = $mx.net2cid(%net)
  if ((!%nick) || (!%net) || (!%chan) || (!%cid)) return 0
  var %job = $mx.complete.job.create(%data)
  if (!$mx.complete.job.is(%job)) {
    if (%mode != ctcp) mx.out.send notice %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Complete list request could not be created. %mx.c3 $+ %mx.cr $+ $mx.logo
    return 0
  }
  if ((%mx.complete.active == 1) && ($mx.path.norm(%mx.complete.job.file) == $mx.path.norm(%job))) {
    if (%mode != ctcp) mx.out.send notice %cid %nick %mx.c1 This Complete list is already being prepared. %mx.c3 $+ %mx.cr $+ $mx.logo
    return 0
  }
  var %existing = $dmx.queue.exists(%nick,%net,%job)
  if (%existing) {
    if (%mode != ctcp) mx.find.out.send notice %cid %nick %mx.c1 This Complete list request is already pending in position: %mx.c2 $+ %existing %mx.c3 $+ %mx.cr $+ $mx.logo
    return 0
  }
  if ((%mx.maxrequest isnum) && (%mx.maxrequest > 0)) {
    var %used = $dmx.queue.countnick(%nick,%net)
    if (%used >= %mx.maxrequest) {
      mx.complete.job.remove %job
      if (%mode != ctcp) mx.out.send notice %cid %nick %mx.c1 Request denied. You reached %mx.c2 $+ %used $+ %mx.c1 of %mx.c2 $+ %mx.maxrequest $+ %mx.c1 allowed requests. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
      return 0
    }
  }
  dmx.queue.add %nick %net %mode %job
  var %position = $dmx.queue.exists(%nick,%net,%job)
  if (!%position) {
    mx.complete.job.remove %job
    if (%mode != ctcp) mx.out.send notice %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Complete list request could not be added to the queue. %mx.c3 $+ %mx.cr $+ $mx.logo
    return 0
  }
  var %allowed = $dmx.queue.countnick(%nick,%net)
  if (%mode != ctcp) mx.find.out.send notice %cid %nick %mx.c1 Complete list request accepted: $+ %mx.c2 Files + Folders %mx.c3 $+ %mx.cr $+ %mx.c1 Queue Position: %mx.c2 $+ %position %mx.c3 $+ %mx.cr $+ %mx.c1 The list will be prepared and sent automatically. %mx.c3 $+ %mx.cr $+ $mx.logo
  if ($timer(MXRARQ).state != on) dmx.queue.start.now
  inc %mx.rlists
  mx.main.stats.refresh
  return 1
}

alias mx.complete.request {
  var %data = $1-
  var %job
  var %nick
  var %net
  var %chan
  var %mode
  var %files
  var %folders
  if ($mx.complete.job.is(%data)) {
    %job = $mx.path.norm(%data)
    %nick = $mx.complete.job.get(%job,nick)
    %net = $mx.complete.job.get(%job,network)
    %chan = $mx.complete.job.get(%job,channel)
    %mode = $lower($mx.complete.job.get(%job,mode))
    %files = $mx.complete.job.get(%job,files)
    %folders = $mx.complete.job.get(%job,folders)
  }
  else {
    %nick = $gettok(%data,1,29)
    %net = $gettok(%data,2,29)
    %chan = $gettok(%data,3,29)
    %mode = $lower($gettok(%data,4,29))
    %files = $gettok(%data,5,29)
    %folders = $gettok(%data,6-,29)
  }
  var %cid = $mx.net2cid(%net)
  if ((!%nick) || (!%net) || (!%chan) || (!%cid) || (!%files) || (!%folders) || (%files == -) || (%folders == -)) {
    return
  }
  if (%mx.complete.active == 1) {
    if (%mode != ctcp) {
      mx.out.send notice %cid %nick %mx.c1 Another Complete list is currently being prepared. Please try again shortly. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  if (!$isfile(%mx.plexe)) {
    if (%mode != ctcp) {
      mx.out.send notice %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Public list builder is not available. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  if (!$isfile(%mx.winrar)) {
    if (%mode != ctcp) {
      mx.out.send notice %cid %nick %mx.c2 Error: %mx.c1 Complete list compression is unavailable. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  if ((!$isdir(%mx.files.public)) || (!$isdir(%mx.plbase))) {
    if (%mode != ctcp) {
      mx.out.send notice %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Files or Folders public directory is not available. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  if (!$isdir(%mx.complete.dir)) mkdir %mx.complete.dir
  if (!$isdir(%mx.complete.dir)) {
    if (%mode != ctcp) {
      mx.out.send notice %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Complete list directory could not be created. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  var %runid = $+($ticks,-,$rand(1000,9999))
  var %workdir = $+(%mx.complete.dir,\,%runid)
  var %ini = %workdir $+ \complete.ini
  var %err = %workdir $+ \complete-errors.txt
  var %marker = %workdir $+ \complete.running
  var %trigger = $remove($strip(%mx.trigger),@,!,^)
  if (!%trigger) %trigger = $me
  mkdir %workdir
  if (!$isdir(%workdir)) {
    mx.dbg %mx.c2 $+ Error: $+ %mx.c1 Aborted - Work directory could not be created: $+ %mx.c2 %workdir %mx.nc
    if (%mode != ctcp) {
      mx.out.send notice %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Complete list work directory could not be created. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  set %mx.complete.active 1
  if (%job) set %mx.complete.job.file %job
  else unset %mx.complete.job.file
  set %mx.complete.job.nick %nick
  set %mx.complete.job.net %net
  set %mx.complete.job.mode %mode
  set %mx.complete.job.workdir %workdir
  set %mx.complete.job.ini %ini
  set %mx.complete.job.err %err
  set %mx.complete.job.marker %marker
  set %mx.complete.job.started $ctime
  unset %mx.complete.job.phase
  var %args = /mode=complete $chr(32) /trigger= $+ $qt(%trigger) $chr(32) /filesdir= $+ $qt(%mx.files.public) $chr(32) /foldersdir= $+ $qt(%mx.plbase) $chr(32) /completedir= $+ $qt(%mx.complete.dir) $chr(32) /fileslist= $+ $qt(%files) $chr(32) /folderslist= $+ $qt(%folders) $chr(32) /runid= $+ $qt(%runid) $chr(32) /build= $+ $qt(%ini) $chr(32) /err= $+ $qt(%err) $chr(32) /marker= $+ $qt(%marker)
  if (%mx.winrar) {
    %args = %args $+ $chr(32) /rarexe= $+ $qt(%mx.winrar)
  }
  .run -h $qt(%mx.plexe) %args
  .timerMXCOMPLETE 0 1 mx.complete.watch
}

alias mx.complete.watch {
  if (%mx.complete.active != 1) {
    .timerMXCOMPLETE off
    return
  }
  var %ini = %mx.complete.job.ini
  var %marker = %mx.complete.job.marker
  var %elapsed = $calc($ctime - %mx.complete.job.started)
  if ((%mx.complete.timeout isnum 30-) && (%elapsed >= %mx.complete.timeout)) {
    .run -n taskkill /IM PublicListBuilder.exe /T /F
    mx.complete.fail Complete list creation timeout.
    return
  }
  if ($isfile(%ini)) {
    var %status = $lower($readini(%ini,Complete,status))
    if (%status == running) {
      if ((!$isfile(%marker)) && (%elapsed >= 5)) {
        mx.complete.fail PublicListBuilder.exe stopped while status remained running.
        return
      }
      if (%mx.complete.job.phase != running) {
        set %mx.complete.job.phase running
      }
      return
    }
    if (%status == ok) {
      mx.complete.finish
      return
    }
    if (%status == error) {
      var %message = $readini(%ini,Complete,message)
      if (!%message) {
        %message = Unknown Complete builder error.
      }
      mx.complete.fail %message
      return
    }
  }
  if ((!$isfile(%marker)) && (%elapsed >= 5)) {
    mx.complete.fail PublicListBuilder.exe ended without valid Complete status.
  }
}

alias mx.complete.finish {
  var %ini = %mx.complete.job.ini
  var %nick = %mx.complete.job.nick
  var %net = %mx.complete.job.net
  var %mode = %mx.complete.job.mode
  var %workdir = %mx.complete.job.workdir
  var %cid = $mx.net2cid(%net)
  var %rar = $mx.path.norm($readini(%ini,Complete,output))
  var %filesTxt = $readini(%ini,Complete,files_txt)
  var %foldersTxt = $readini(%ini,Complete,folders_txt)
  var %size = $readini(%ini,Complete,size)
  var %duration = $readini(%ini,Complete,duration)
  if (!$isfile(%rar)) {
    mx.complete.fail Builder reported OK but the Complete RAR does not exist.
    return
  }
  mx.complete.aux.cleanup
  mx.del.add %rar
  if (!%cid) {
    dmx.queue.add %nick %net %mode %rar
    var %line = $dmx.queue.exists(%nick,%net,%rar)
    if (!%line) {
      mx.del.try %rar
    }
    mx.complete.state.clear
    if ((%workdir) && ($isdir(%workdir)) && (!$mx.path.under(%rar,%workdir))) {
      .timer $+ $+(MXCOMPLETEPURGE.,$hash(%workdir,32)) 1 2 mx.complete.workdir.purge $qt(%workdir)
    }
    if (%line) {
      if ($timer(MXRARQ).state != on) dmx.queue.start
    }
    return
  }
  scid %cid
  mx.complete.state.clear
  if ((%workdir) && ($isdir(%workdir)) && (!$mx.path.under(%rar,%workdir))) {
    .timer $+ $+(MXCOMPLETEPURGE.,$hash(%workdir,32)) 1 2 mx.complete.workdir.purge $qt(%workdir)
  }
  mx.idle.touch
  mx.sent.add %nick %net %rar
  dcc send %nick %rar
  mx.speed.start
  if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) dmx.queue.start
  else .timerMXRARQ off
}

alias mx.complete.fail {
  var %reason = $strip($1-)
  var %nick = %mx.complete.job.nick
  var %net = %mx.complete.job.net
  var %mode = %mx.complete.job.mode
  var %cid = $mx.net2cid(%net)
  var %workdir = %mx.complete.job.workdir
  if (!%reason) %reason = Unknown error.
  if ((%cid) && (%mode != ctcp)) mx.out.send notice %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Complete list could not be created: %reason %mx.c3 $+ %mx.cr $+ $mx.logo
  mx.complete.state.clear
  if ((%workdir) && ($isdir(%workdir))) .timer $+ $+(MXCOMPLETEPURGE.,$hash(%workdir,32)) 1 2 mx.complete.workdir.purge $qt(%workdir)
  if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) dmx.queue.start
  else .timerMXRARQ off
}

alias -l mx.complete.workdir.purge {
  var %dir = $mx.path.norm($1-), %root = $mx.path.norm(%mx.complete.dir)
  if ((!%dir) || (!%root) || ($lower(%dir) == $lower(%root))) return
  if (($mx.path.under(%dir,%root)) && ($isdir(%dir))) mx.cfg.dir.purge %dir
}

alias -l mx.complete.aux.cleanup {
  if ((%mx.complete.job.ini) && ($isfile(%mx.complete.job.ini))) .remove $qt(%mx.complete.job.ini)
  if ((%mx.complete.job.err) && ($isfile(%mx.complete.job.err))) .remove $qt(%mx.complete.job.err)
  if ((%mx.complete.job.marker) && ($isfile(%mx.complete.job.marker))) .remove $qt(%mx.complete.job.marker)
}

alias -l mx.complete.state.clear {
  var %job = %mx.complete.job.file
  .timerMXCOMPLETE off
  unset %mx.complete.active
  unset %mx.complete.job.*
  if (%job) mx.complete.job.remove %job
}

alias -l mx.complete.queue.cleanup {
  if (!$isfile(%mx.queue)) return
  var %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %payload = $mx.queue.payload($ifmatch)
    if ($mx.complete.job.is(%payload)) {
      mx.complete.job.remove %payload
    }
    elseif (($mx.path.under(%payload,%mx.complete.dir)) && ($isfile(%payload))) {
      mx.del.try %payload
    }
    inc %i
  }
}

on *:TEXT:!list:*:{
  if ((%mx.enabled != 1) || (%mx.respond.list != 1)) return
  var %requestchan = $chan
  if (!%requestchan) %requestchan = $mx.request.channel($nick,$network)
  if (!%requestchan) return
  if ($lower($mx.assignment.mode(%requestchan,$network)) == ctcp) return
  var %pl = $mx.assignment.public(%requestchan,$network)
  if (!%pl) return
  var %cidR = $mx.net2cid($network)
  if (!%cidR) return
  if (!$mx.list.guard(%cidR,$nick)) return
  var %files = $mx.assignment.files(%requestchan,$network)
  var %folders = $mx.assignment.folders(%requestchan,$network)
  var %types = $iif((%files) && (%folders),Files + Folders,$iif(%files,Files,Folders))
  var %msg = %mx.c1 Available list: $+ %mx.c2 %pl %mx.c1 $+($chr(32),$chr(40),%types,$chr(41)) %mx.c3 $+ %mx.cr $+ %mx.c1 Request it with: $+ %mx.c2 @ $+ %mx.trigger %mx.c3 $+ %mx.cr $+ $mx.logo
  %msg = $mx.out.clean(notice,%msg)
  mx.out.view notice %cidR $nick %msg
  scid %cidR
  .notice $nick %msg
}

on *:TEXT:@*:*:{
  if (%mx.enabled != 1) return
  var %requestchan = $chan
  if (!%requestchan) %requestchan = $mx.request.channel($nick,$network)
  if (!%requestchan) return
  var %row = $mx.assignment.find(%requestchan,$network)
  if (!%row) return
  var %files = $gettok(%row,3,124)
  var %folders = $gettok(%row,4,124)
  var %pl = $gettok(%row,5,124)
  var %mode = $lower($gettok(%row,6,124))
  if ($lower($1-) == @mx-trigger) {
    var %cidT = $mx.net2cid($network)
    if (!%cidT) return
    var %keyT = $+(%,mx.trigger.cooldown.,%cidT,.,$lower($nick))
    var %lastT = $eval(%keyT,2)
    if ((%lastT isnum) && ($calc($ctime - %lastT) < 15)) return
    set %keyT $ctime
    if (%mode != ctcp) {
      mx.out.now notice %cidT $nick %mx.c1 File or folder trigger: $+ %mx.c2 ! $+ %mx.trigger $+ $chr(32) $+ FileOrFolderName %mx.c3 $+ %mx.cr $+ %mx.c1 List request trigger: $+ %mx.c2 @ $+ %mx.trigger %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    .timer $+ $+(MXTRIGGER.,%cidT,.,$lower($nick)) 1 15 unset %keyT
    return
  }
  if ($mx.trigger.match($1-,-remove)) {
    mx.idle.wake
    if (%mode == ctcp) mx.nick.remove $nick $network silent
    else mx.nick.remove $nick $network
    return
  }
  if ($mx.trigger.match($1-,-queue)) {
    mx.idle.wake
    if (%mode != ctcp) mx.nick.queue $nick $network
    return
  }
  if ($mx.trigger.match($1-,-stats)) {
    mx.idle.wake
    var %cidS = $mx.net2cid($network)
    if (!%cidS) return
    if (!$mx.list.guard(%cidS,$nick)) return
    if (%mode != ctcp) mx.nick.stats $nick $network %mode
    return
  }
  if ($mx.trigger.match($1-,-fullstats)) {
    mx.idle.wake
    var %cidF = $mx.net2cid($network)
    if (!%cidF) return
    if (!$mx.list.guard(%cidF,$nick)) return
    if (%mode != ctcp) mx.nick.fullstats $nick $network
    return
  }
  if (($lower($1) == @find) || ($lower($1) == @locator)) {
    if ((%mx.find.enabled == 1) && ($0 > 1) && (%mode != ctcp)) {
      if ($mx.find.cooldown.allow($nick,$network)) mx.find.request $nick %requestchan $network $2-
    }
    return
  }
  if ($0 != 1) return
  var %cmd = $mid($1,2)
  if ($lower(%cmd) != $lower(%mx.trigger)) return
  mx.idle.wake
  var %cidR = $mx.net2cid($network)
  if (%cidR) scid -t %cidR
  var %requesttype
  if ((%files) && (%files != -) && (%folders) && (%folders != -)) {
    %requesttype = complete
  }
  elseif ((%files) && (%files != -)) {
    %requesttype = files
  }
  elseif ((%folders) && (%folders != -)) {
    %requesttype = folders
  }
  else {
    return
  }
  if ($mx.build.request.blocked(%requesttype)) {
    if (%mode != ctcp) mx.build.notice %cidR $nick %requesttype
    return
  }
  if ((%files != -) && (%folders == -) && (%mx.files.list != 1)) {
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c1 Files list service is disabled. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  if ((%folders != -) && (%files == -) && (%mx.list != 1)) {
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c1 Folders list service is disabled. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  if ((%files != -) && (%folders != -)) {
    if ((%mx.files.list != 1) || (%mx.list != 1)) {
      if (%mode != ctcp) {
        mx.out.send notice %cidR $nick %mx.c1 Complete list is not available because Files or Folders lists are disabled. %mx.c3 $+ %mx.cr $+ $mx.logo
      }
      return
    }
    mx.complete.enqueue $+($nick,$chr(29),$network,$chr(29),%requestchan,$chr(29),%mode,$chr(29),%files,$chr(29),%folders)
    return
  }
  var %rar = $mx.publiclist.pick(%requestchan,$network)
  if (!%rar) {
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c2 $+ Error: $+ %mx.c1 Public list archive not found. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  var %existing = $dmx.queue.exists($nick,$network,%rar)
  dmx.queue.add $nick $network %mode %rar
  if (%existing) return
  var %position = $dmx.queue.exists($nick,$network,%rar)
  if (!%position) return
  var %listtype = $iif((%files != -) && (%folders == -),Files,Folders)
  if (%mode != ctcp) {
    mx.find.out.send notice %cidR $nick %mx.c1 List Request Accepted: $+ %mx.c2 %listtype %mx.c3 $+ %mx.cr $+ %mx.c1 Queue Position: $+ %mx.c2 %position %mx.c3 $+ %mx.cr $+ $mx.logo
  }
  if ($timer(MXRARQ).state != on) dmx.queue.start.now
  inc %mx.rlists
  mx.main.stats.refresh
}

alias -l mx.publiclist.pick {
  var %chan = $1, %net = $2, %public = $mx.assignment.public(%chan,%net), %files = $mx.assignment.files(%chan,%net), %folders = $mx.assignment.folders(%chan,%net), %file
  if (!%public) return
  if ((%files) && (%folders)) {
    %file = $findfile(%mx.files.public,* $+ %public $+ (*)-MX.rar,1)
    if (!%file) %file = $findfile(%mx.plbase,* $+ %public $+ (*)-MX.rar,1)
  }
  elseif (%files) {
    %file = $findfile(%mx.files.public,* $+ %public $+ -Files(*)-MX.rar,1)
    if (!%file) %file = $findfile(%mx.files.public,* $+ %files $+ *-MX.rar,1)
  }
  elseif (%folders) {
    %file = $findfile(%mx.plbase,* $+ %public $+ -Folders(*)-MX.rar,1)
    if (!%file) %file = $findfile(%mx.plbase,* $+ %folders $+ *-MX.rar,1)
  }
  if ($isfile(%file)) return %file
}

alias -l mx.find.cooldown.allow {
  var %nick = $lower($strip($1))
  var %net = $lower($strip($2))
  if ((!%nick) || (!%net)) return 0
  var %seconds = $iif(%mx.find.cooldown isnum 1-60,%mx.find.cooldown,5)
  var %hash = $md5($+(%net,$chr(124),%nick))
  var %var = $+(%,mx.find.cooldown.nick.,%hash)
  var %last = $eval(%var,2)
  if ((%last isnum) && ($calc($ctime - %last) < %seconds)) return 0
  set $+(-u,%seconds) %var $ctime
  return 1
}

alias mx.find.request {
  var %nick = $1
  var %chan = $2
  var %net = $3
  var %term = $replace($strip($4-),$chr(124),$chr(32))
  var %cid = $mx.net2cid(%net)
  if ((!%nick) || (!%chan) || (!%cid) || ($len(%term) < 2)) return
  mx.cfg.vars.defaults
  var %files = $mx.assignment.files(%chan,%net)
  var %folders = $mx.assignment.folders(%chan,%net)
  var %requesttype
  if ((%files) && (%files != -) && (%folders) && (%folders != -)) {
    %requesttype = complete
  }
  elseif ((%files) && (%files != -)) {
    %requesttype = files
  }
  elseif ((%folders) && (%folders != -)) {
    %requesttype = folders
  }
  if ((%requesttype) && ($mx.build.request.blocked(%requesttype))) {
    mx.build.notice %cid %nick %requesttype
    return
  }
  if (!$isfile(%mx.finder.dll)) {
    mx.find.out.send msg %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Finder DLL not found: $+ %mx.c2 %mx.finder.dll %mx.c3 $+ %mx.cr $+ $mx.logo
    return
  }
  var %version = $dll($qt(%mx.finder.dll),Version,0)
  if (*1.12* !iswm %version) {
    mx.find.out.send msg %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Search requires mxfinder.dll 1.12 Win32. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    return
  }
  var %hasfiles = $iif((%files) && (%files != -) && (%mx.files.list == 1),1,0)
  var %hasfolders = $iif((%folders) && (%folders != -) && (%mx.list == 1),1,0)
  if ((!%hasfiles) && (!%hasfolders)) {
    mx.find.out.send msg %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Search list not available for this channel. %mx.c3 $+ %mx.cr $+ $mx.logo
    return
  }
  %term = $replace(%term,$chr(9),$chr(32),$chr(29),$chr(32))
  var %stage = $iif(%hasfiles,files,folders)
  var %id = $+($ticks,.,$rand(1000,9999))
  var %line = $+(%id,$chr(9),%nick,$chr(9),%chan,$chr(9),%net,$chr(9),%files,$chr(9),%folders,$chr(9),%stage,$chr(9),%term)
  write $qt(%mx.find.request.queue) %line
  if (!$timer(mxfindrequest)) .timermxfindrequest -m 1 50 mx.find.request.process
}

alias mx.find.request.process {
  if (%mx.enabled != 1) return
  if (!$isfile(%mx.find.request.queue)) return
  var %line = $read(%mx.find.request.queue,n,1)
  if (!%line) return
  var %nick = $gettok(%line,2,9)
  var %chan = $gettok(%line,3,9)
  var %net = $gettok(%line,4,9)
  var %files = $gettok(%line,5,9)
  var %folders = $gettok(%line,6,9)
  var %stage = $lower($gettok(%line,7,9))
  var %term = $gettok(%line,8-,9)
  var %cid = $mx.net2cid(%net)
  if ((!%nick) || (!%chan) || (!%net) || (!%cid) || (!%term)) {
    write -dl 1 $qt(%mx.find.request.queue)
    if ($read(%mx.find.request.queue,n,1)) .timermxfindrequest -m 1 %mx.find.interval mx.find.request.process
    return
  }
  if (%stage == files) {
    var %status = $mx.find.request.run(files,%nick,%chan,%net,%cid,%files,%mx.files.masterlist,%term)
  }
  elseif (%stage == folders) {
    var %status = $mx.find.request.run(folders,%nick,%chan,%net,%cid,%folders,%mx.masterlist,%term)
  }
  else {
    var %status = DONE
  }
  if (%status == WAIT) {
    .timermxfindrequest -m 1 %mx.find.interval mx.find.request.process
    return
  }
  if ((%stage == files) && (%folders) && (%folders != -) && (%mx.list == 1)) {
    var %next = $puttok(%line,folders,7,9)
    write -l1 $qt(%mx.find.request.queue) %next
    .timermxfindrequest -m 1 %mx.find.interval mx.find.request.process
    return
  }
  write -dl 1 $qt(%mx.find.request.queue)
  if ($read(%mx.find.request.queue,n,1)) .timermxfindrequest -m 1 %mx.find.interval mx.find.request.process
}

alias -l mx.find.request.run {
  var %type = $1
  var %nick = $2
  var %chan = $3
  var %net = $4
  var %cid = $5
  var %list = $6
  var %master = $7
  var %term = $strip($8-)
  var %showmax = $iif(%mx.maxfind isnum 1-8,%mx.maxfind,8)
  var %fetchmax = 8
  var %label = $iif(%type == files,File(s),Folder(s))
  if ((!%type) || (!%nick) || (!%chan) || (!%net) || (!%cid) || (!%list) || (%list == -) || (!%term)) return DONE
  if (!$isfile(%master)) {
    mx.find.out.send msg %cid %nick %mx.c2 $+ Error: $+ %mx.c1 %label masterlist not found. %mx.c3 $+ %mx.cr $+ $mx.logo
    return DONE
  }
  var %params = %term $+ $chr(124) $+ %master $+ $chr(124) $+ %fetchmax $+ $chr(124) $+ %type
  var %t = $ticks
  var %res = $dll($qt(%mx.finder.dll),FindPack,%params)
  var %ms = $calc($ticks - %t)
  if ($gettok(%res,1,124) == WAIT) return WAIT
  if ($gettok(%res,1,124) == NO) return DONE
  if ($gettok(%res,1,124) == ERR) {
    var %err = $gettok(%res,2-,124)
    if (%err == empty_tokens) return DONE
    mx.find.out.send msg %cid %nick %mx.c2 $+ Error: $+ %mx.c1 Finder error: $+ %mx.c2 %err %mx.c3 $+ %mx.cr $+ $mx.logo
    return DONE
  }
  if ($gettok(%res,1,124) != OK) return DONE
  var %total = $gettok(%res,2,124)
  var %count = $gettok(%res,3,124)
  var %data = $gettok(%res,4-,124)
  if (%total !isnum) return DONE
  if (%total < 1) return DONE
  if (%count !isnum 1-8) return DONE
  if (!%data) return DONE
  var %accepted
  var %seen
  var %shown = 0
  var %i = 1
  while ((%i <= %count) && (%shown < %showmax)) {
    var %path = $mx.path.norm($gettok(%data,%i,30))
    if (%path) {
      if (%type == files) {
        if (($isfile(%path)) && ($mx.list.path.allowed(files,%list,%path))) {
          var %key = $lower($nopath(%path))
          if (!$istok(%seen,%key,29)) {
            %seen = $addtok(%seen,%key,29)
            %accepted = $addtok(%accepted,%path,30)
            inc %shown
          }
        }
      }
      elseif (%type == folders) {
        if (($isdir(%path)) && ($mx.list.path.allowed(folders,%list,%path))) {
          var %key = $lower(%path)
          if (!$istok(%seen,%key,29)) {
            %seen = $addtok(%seen,%key,29)
            %accepted = $addtok(%accepted,%path,30)
            inc %shown
          }
        }
      }
    }
    inc %i
  }
  if (%shown < 1) return DONE
  if (%total > %shown) {
    mx.out.now msg %cid %nick %mx.c1 Search results: $+ %mx.c2 $bmx(%total) %label %mx.c1 $+ matches for $+ %mx.c2 %term $+ %mx.c3 %mx.cr $+ %mx.c1 Showing $+ %mx.c2 %shown %mx.c1 $+ result(s). Get my list by typing $+ %mx.c2 @ $+ %mx.trigger %mx.c1 $+ In The Channel. $+ %mx.c3 %mx.cr $+ $mx.logo %mx.nc
  }
  else {
    mx.out.now msg %cid %nick %mx.c1 Search results: $+ %mx.c2 $bmx(%total) %label %mx.c1 $+ matches for $+ %mx.c2 %term $+ %mx.c3 %mx.cr $+ %mx.c1 Get my list by typing $+ %mx.c2 @ $+ %mx.trigger %mx.c1 $+ In The Channel. $+ %mx.c3 %mx.cr $+ $mx.logo $+ %mx.nc
  }
  %i = 1
  while (%i <= %shown) {
    var %path = $gettok(%accepted,%i,30)
    if (%type == files) {
      var %size = $bytes($file(%path).size).suf
      var %show = $+(!,%mx.trigger,$chr(32),$nopath(%path),$chr(32),%mx.c2,::INFO::,$chr(32),%mx.c1,%size)
      mx.find.out.send msg %cid %nick %mx.c1 $+ %show %mx.nc
    }
    elseif (%type == folders) {
      var %show = $+(!,%mx.trigger,$chr(32),%path,.rar)
      mx.find.out.send msg %cid %nick %mx.c1 $+ %show %mx.nc
    }
    inc %i
  }
  return DONE
}

alias -l mx.trigger.match {
  var %a = $lower($strip($1))
  var %b = $lower(@ $+ %mx.trigger $+ $2)
  return $iif(%a == %b,1,0)
}

alias mx.nick.queue {
  var %nick = $1
  var %net = $2
  if ((!%nick) || (!%net) || (!$isfile(%mx.queue))) return
  var %n = $dmx.queue.countnick(%nick,%net)
  var %cid = $mx.net2cid(%net)
  if (!%cid) return
  if (!%n) {
    mx.out.now msg %cid %nick %mx.c1 Queue Status: No pending requests. %mx.c3 $+ %mx.cr $+ $mx.logo
    return
  }
  mx.out.now msg %cid %nick %mx.c1 Queue Status: $+ %mx.c2 %n %mx.c1 $+ pending request(s). %mx.c3 $+ %mx.cr $+ $mx.logo
  var %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    if (($lower($mx.queue.nick(%line)) == $lower(%nick)) && ($lower($mx.queue.net(%line)) == $lower(%net))) {
      var %payload = $mx.queue.payload(%line)
      var %type
      var %display
      if ($mx.complete.job.is(%payload)) {
        %type = Complete
        %display = $mx.complete.job.display(%payload)
      }
      else {
        var %islist = $mx.payload.islist(%payload)
        if ($isdir(%payload)) {
          %type = Folder
          %display = $nopath(%payload)
          if (%mx.smart == 1) {
            var %smartname = $mx.rar.make.name(%payload)
            if (%smartname) %display = %smartname
          }
          if ($right($lower(%display),4) != .rar) {
            %display = %display $+ .rar
          }
        }
        elseif (%islist) {
          %type = List
          %display = $nopath(%payload)
        }
        else {
          %type = File
          %display = $nopath(%payload)
          if (!%display) %display = %payload
        }
      }
      mx.find.out.send msg %cid %nick %mx.c2 $chr(35) $+ %i %mx.c1 $+ %type $+ : $+ %mx.c2 %display %mx.nc
    }
    inc %i
  }
}

alias mx.nick.remove {
  var %nick = $1, %net = $2, %silent = $iif($lower($3) == silent,1,0), %tmp = %mx.queue $+ .tmp.nick, %bak = %mx.queue $+ .bak.nick, %rem = 0, %completeCleanup
  if ((!%nick) || (!%net) || (!$isfile(%mx.queue))) return
  if (!$mx.queue.lock.acquire(mx.nick.remove)) return
  write -c $qt(%tmp)
  var %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    if (($lower($mx.queue.nick(%line)) == $lower(%nick)) && ($lower($mx.queue.net(%line)) == $lower(%net))) {
      inc %rem
      var %removedPayload = $mx.queue.payload(%line)
      if ($mx.path.under(%removedPayload,%mx.complete.dir)) %completeCleanup = $addtok(%completeCleanup,%removedPayload,29)
    }
    else write $qt(%tmp) %line
    inc %i
    mx.queue.lock.touch
  }
  if ($isfile(%bak)) .remove $qt(%bak) 
  .rename $qt(%mx.queue) $qt(%bak) 
  if (!$isfile(%bak)) { 
    if ($isfile(%tmp)) .remove $qt(%tmp) 
    mx.dbg %mx.c2 Error: $+ %mx.c1 Nick remove aborted, could not create backup for: $+ %mx.c2 %mx.queue %mx.nc 
    mx.queue.lock.release mx.nick.remove 
    return 
  } 
  .rename $qt(%tmp) $qt(%mx.queue) 
  if (!$isfile(%mx.queue)) { 
    .rename $qt(%bak) $qt(%mx.queue) 
    mx.dbg %mx.c2 Error: $+ %mx.c1 Nick remove restore executed after rename failure. %mx.nc 
    mx.queue.lock.release mx.nick.remove 
    return 
  } 
  if ($isfile(%bak)) .remove $qt(%bak) 
  dmx.queue.refresh
  if ($dialog(mx.rarserver)) mx.cfg.queue.refresh
  mx.queue.lock.release mx.nick.remove
  var %cleanupIndex = 1
  while ($gettok(%completeCleanup,%cleanupIndex,29)) {
    var %cleanupFile = $ifmatch
    if ($mx.complete.job.is(%cleanupFile)) {
      mx.complete.job.remove %cleanupFile
    }
    elseif ($isfile(%cleanupFile)) {
      mx.del.try %cleanupFile
    }
    inc %cleanupIndex
  }
  var %cid = $mx.net2cid(%net)
  if ((%cid) && (%silent != 1)) {
    mx.out.now notice %cid %nick %mx.c1 Your $+ %mx.c2 %rem %mx.c1 pending request(s) were removed. %mx.c3 $+ %mx.cr $+ $mx.logo
  }
}

alias mx.nick.stats {
  var %nick = $1
  var %net = $2
  var %mode = $lower($3)
  if ((!%nick) || (!%net)) return
  var %cid = $mx.net2cid(%net)
  if (!%cid) return
  mx.slots.update
  mx.stats.rollover
  var %free = $iif(%mx.slots isnum,%mx.slots,0)
  var %max = $iif(%mx.maxsend isnum,%mx.maxsend,0)
  var %queue = $dmx.queue.count
  var %speed = $mx.speed($iif(%mx.cps isnum,%mx.cps,0))
  var %next = $mx.ctcp.next
  var %allowed = $iif(%mx.maxrequest isnum,%mx.maxrequest,0)
  var %find = $iif(%mx.find.enabled == 1,ON,OFF)
  if (%queue !isnum) %queue = 0
  if (!%next) %next = N/A
  var %modeText = Normal
  if (%mode == silent) %modeText = Silent
  elseif (%mode == ctcp) %modeText = Request only
  var %masterFiles = 0
  var %filesIni = %mx.files.public $+ \masterlist.ini
  if ($isfile(%filesIni)) {
    var %mf = $readini(%filesIni,Masterlist,files)
    if (%mf isnum) %masterFiles = %mf
  }
  var %masterFolders = $mx.master.stat(routes)
  if (%masterFolders !isnum) %masterFolders = 0
  var %filesSent = $iif(%mx.stats.file.completed isnum,%mx.stats.file.completed,0)
  var %foldersSent = $iif(%mx.rarsent isnum,%mx.rarsent,0)
  var %totalSent = $calc(%filesSent + %foldersSent)
  var %fileBytes = $iif(%mx.stats.file.bytes isnum,%mx.stats.file.bytes,0)
  var %folderBytes = $iif(%mx.rartsent isnum,%mx.rartsent,0)
  var %totalBytes = $calc(%fileBytes + %folderBytes)
  var %transferSecs = $iif(%mx.stats.transfer.seconds isnum,%mx.stats.transfer.seconds,0)
  var %average = 0
  if (%transferSecs > 0) {
    %average = $round($calc(%totalBytes / %transferSecs),0)
  }
  mx.out.now msg %cid %nick %mx.c1 Script Stats Information %mx.c3 $+ %mx.cr $+ %mx.c2 $+ $mx.logo
  mx.find.out.send msg %cid %nick %mx.c1 Free Slots: %mx.c2 $+ %free $+ / $+ %max %mx.c3 $+ %mx.cr $+ %mx.c1 Requests In Queue: %mx.c2 $+ %queue %mx.c3 $+ %mx.cr $+ %mx.c1 Total Speed: %mx.c2 $+ %speed %mx.c3 $+ %mx.cr $+ %mx.c1 Next Slot: %mx.c2 $+ %next %mx.c3 $+ %mx.cr $+ %mx.c1 Allowed: %mx.c2 $+ %allowed %mx.c3 $+ %mx.cr $+ %mx.c1 Find/Locator: %mx.c2 $+ %find %mx.c3 $+ %mx.cr $+ %mx.c1 Mode: %mx.c2 $+ %modeText %mx.nc
  mx.find.out.send msg %cid %nick %mx.c1 Masterlist: %mx.c2 $+ $bmx(%masterFiles) %mx.c1 Files %mx.c3 $+ / %mx.c2 $+ $bmx(%masterFolders) %mx.c1 Folders %mx.c3 $+ %mx.cr $+ %mx.c1 Sent: %mx.c2 $+ $bmx(%totalSent) %mx.c3 $+ %mx.cr $+ %mx.c1 Files Sent: %mx.c2 $+ $bmx(%filesSent) %mx.c3 $+ %mx.cr $+ %mx.c1 Folders Sent: %mx.c2 $+ $bmx(%foldersSent) %mx.c3 $+ %mx.cr $+ %mx.c1 Data Sent: %mx.c2 $+ $mx.bytes(%totalBytes) %mx.c3 $+ %mx.cr $+ %mx.c1 Average Speed: %mx.c2 $+ $mx.speed(%average) %mx.nc
}

alias mx.nick.fullstats {
  var %nick = $1
  var %net = $2
  if ((!%nick) || (!%net)) return
  var %outcid = $mx.net2cid(%net)
  if (!%outcid) return
  var %sendwindows = $send(0)
  var %i = 1
  var %position = 1
  var %sends = 0
  var %sendcps = 0
  var %queue = $dmx.queue.count
  if (%queue !isnum) %queue = 0
  mx.out.now msg %outcid %nick %mx.c1 DCC Transfer Status %mx.c3 $+ %mx.cr $+ $mx.logo
  while (%i <= %sendwindows) {
    var %status = $lower($send(%i).status)
    if (($send(%i).done != $true) && (!$istok(sent failed,%status,32))) {
      var %sendnick = $send(%i)
      var %file = $send(%i).file
      var %size = $send(%i).size
      var %sent = $send(%i).sent
      if (%sent == $null) %sent = $send(%i).pos
      var %cps = $send(%i).cps
      var %cid = $send(%i).cid
      var %sendnet = $iif(%cid,$scid(%cid).network,-)
      var %pct = 0%
      if (%sendnick == $null) %sendnick = -
      if (%file == $null) %file = -
      if (%size == $null) %size = 0
      if (%sent == $null) %sent = 0
      if (%cps == $null) %cps = 0
      if (%sendnet == $null) %sendnet = -
      if (%size > 0) {
        %pct = $int($calc(%sent * 100 / %size)) $+ %
      }
      var %secs = $send(%i).secs
      if (%secs !isnum) %secs = 0
      var %elapsed = $mx.fmt.time(%secs)
      var %display = $nopath(%file)
      if (!%display) %display = %file
      mx.find.out.send msg %outcid %nick %mx.c2 $chr(35) $+ %position %mx.c1 $+ Send %mx.c3 $+ %mx.cr $+ %mx.c1 Nick: %mx.c2 $+ %sendnick %mx.c3 $+ %mx.cr $+ %mx.c1 Network: %mx.c2 $+ %sendnet %mx.c3 $+ %mx.cr $+ %mx.c1 File: %mx.c2 $+ %display %mx.c3 $+ %mx.cr $+ %mx.c1 Size: %mx.c2 $+ $mx.monitor.bytes(%size) %mx.c3 $+ %mx.cr $+ %mx.c1 Speed: %mx.c2 $+ $mx.monitor.speed(%cps) %mx.c3 $+ %mx.cr $+ %mx.c1 Progress: %mx.c2 $+ %pct %mx.c3 $+ %mx.cr $+ %mx.c1 Elapsed: %mx.c2 $+ %elapsed %mx.nc
      inc %sendcps %cps
      inc %sends
      inc %position
    }
    inc %i
  }
  if (%sends == 0) {
    mx.find.out.send msg %outcid %nick %mx.c1 No active sends. %mx.nc
  }
  mx.find.out.send msg %outcid %nick %mx.c1 Queue: %mx.c2 $+ %queue %mx.c3 $+ %mx.cr $+ %mx.c1 Sends: %mx.c2 $+ %sends %mx.c3 $+ %mx.cr $+ %mx.c1 Total Speed: %mx.c2 $+ $mx.monitor.speed(%sendcps) %mx.nc
}

alias -l mx.chans.getpl { return $mx.assignment.public($1,$2) }

on *:TEXT:!*:*:{
  var %cmd = $mid($1,2)
  if (%mx.enabled != 1) return
  if ($lower(%cmd) != $lower(%mx.trigger)) return
  var %requestchan = $chan
  if (!%requestchan) %requestchan = $mx.request.channel($nick,$network)
  if (!%requestchan) return
  var %row = $mx.assignment.find(%requestchan,$network)
  if (!%row) return
  var %fileslist = $gettok(%row,3,124)
  var %folderslist = $gettok(%row,4,124)
  var %mode = $lower($gettok(%row,6,124))
  var %cidR = $mx.net2cid($network)
  if (!%cidR) return
  scid %cidR
  mx.sendfail.reset $nick $network
  mx.idle.wake
  if ($0 < 2) {
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c2 $+ Error: %mx.c1 Invalid request. Use: %mx.c2 ! $+ %mx.trigger $+ $chr(32) $+ FileOrFolderName %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    return
  }
  var %rawrequest = $strip($2-)
  var %req = $mx.request.clean(%rawrequest)
  if ($len(%req) < 2) return
  var %requesttype = files
  if (($right($lower(%req),4) == .rar) && (($pos(%req,$chr(92),1)) || ($pos(%req,$chr(47),1)))) {
    %requesttype = folders
  }
  if ($mx.build.request.blocked(%requesttype)) {
    if (%mode != ctcp) mx.build.notice %cidR $nick %requesttype
    return
  }
  if (%requesttype == folders) {
    inc %mx.rarrequested
    if ((%folderslist == -) || (%mx.list != 1)) {
      if (%mode != ctcp) {
        mx.out.send notice %cidR $nick %mx.c2 Error: %mx.c1 Folder requests are not enabled for this channel. %mx.c3 $+ %mx.cr $+ $mx.logo
      }
      mx.main.stats.refresh
      return
    }
    if (!$isfile(%mx.dll)) {
      mx.dbg %mx.c2 Error: %mx.c1 Folder lookup DLL missing: %mx.c2 %mx.dll %mx.nc
      if (%mode != ctcp) {
        mx.out.send notice %cidR $nick %mx.c2 Error: %mx.c1 Folder lookup service is unavailable. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
      }
      mx.main.stats.refresh
      return
    }
    if (!$isfile(%mx.masterlist)) {
      if (%mode != ctcp) {
        mx.out.send notice %cidR $nick %mx.c2 Error: %mx.c1 Folder masterlist is not available. %mx.c3 $+ %mx.cr $+ $mx.logo
      }
      mx.main.stats.refresh
      return
    }
    var %key = $strip($left(%req,-4))
    var %path = $mx.lookup.allowed(%mx.masterlist,%key,folders,%folderslist)
    if ($isdir(%path)) {
      mx.in.queue $nick $network %mode %path
      if ($timer(MXRARQ).state != on) {
        dmx.queue.start.now
      }
      mx.main.stats.refresh
      return
    }
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c2 Error: %mx.c1 Folder not found in the list assigned to this channel. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.main.stats.refresh
    return
  }
  inc %mx.stats.file.requested
  if ((%fileslist == -) || (%mx.files.list != 1)) {
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c2 Error: %mx.c1 File requests are not enabled for this channel. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.main.stats.refresh
    return
  }
  if (!$isfile(%mx.finder.dll)) {
    mx.dlist %mx.c2 Error: %mx.c1 Files lookup DLL missing: %mx.c2 %mx.finder.dll %mx.nc
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c2 Error: %mx.c1 Files lookup service is unavailable. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.main.stats.refresh
    return
  }
  if (!$isfile(%mx.files.masterlist)) {
    if (%mode != ctcp) {
      mx.out.send notice %cidR $nick %mx.c2 Error: %mx.c1 File masterlist is not available. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.main.stats.refresh
    return
  }
  mx.files.lookup.enqueue $+($nick,$chr(29),$network,$chr(29),%mode,$chr(29),%fileslist,$chr(29),%req)
  mx.main.stats.refresh
}

alias -l mx.request.channel {
  var %nick = $1, %net = $2, %i = 1, %chan
  while (%i <= $comchan(%nick,0)) {
    %chan = $comchan(%nick,%i)
    if ($mx.assignment.find(%chan,%net)) return %chan
    inc %i
  }
}

alias -l mx.request.clean {
  var %request = $strip($1-)
  var %marker = $pos($lower(%request),$+($chr(32),::info::),1)
  if (%marker isnum 1-) {
    %request = $left(%request,$calc(%marker - 1))
  }
  if ($regex(%request,/^(.+\.[a-z0-9]{1,8})(?:\s+.*|[.:]+)$/i)) {
    %request = $regml(1)
  }
  while ($left(%request,1) == $chr(32)) %request = $mid(%request,2)
  while ($right(%request,1) == $chr(32)) %request = $left(%request,-1)
  return %request
}

menu @mx.debug.win {
  clean
  .active:mx.wclear -a
  .events:mx.wclear -w
  .-
  .all windows:mx.wclear
  -
  configuration
  .open:mx.cfg.open
  .restart:mx.restart
  -
  logging
  .log on:log on @mx.debug.win -f logs\mx_debug.log
  .log off:log off @mx.debug.win
  .-
  .open log:run notepad logs\mx_debug.log
  -
  reopen:window -c @mx.debug.win | mx.debug.win.open
  close:window -c @mx.debug.win
}

alias mx.debug.win.open {
  if (!$window(@mx.debug.win)) window $iif($1 == start,-zn,-z) @mx.debug.win
  mx.title.refresh
}

alias mx.title.refresh {
  mx.slots.update
  if ($dialog(mx.rarserver)) mx.main.queue.summary
  if (($isalias(mx.title.debug)) && ($window(@mx.debug.win))) .timerTDBG 1 1 mx.title.debug
  if (($isalias(mx.title.dcc)) && ($window(@mx.dcc.win))) .timerTDCC 1 1 mx.title.dcc
}

alias mx.title.dcc {
  if (!$window(@mx.dcc.win)) return
  var %lists = $iif(%mx.clists isnum,%mx.clists,0)
  var %files = $iif(%mx.stats.file.completed isnum,%mx.stats.file.completed,0)
  var %filebytes = $iif(%mx.stats.file.bytes isnum,%mx.stats.file.bytes,0)
  var %folders = $iif(%mx.rarsent isnum,%mx.rarsent,0)
  var %folderbytes = $iif(%mx.rartsent isnum,%mx.rartsent,0)
  var %totalbytes = $calc(%filebytes + %folderbytes)
  var %state = $iif(%mx.sleeping == 1,sleeping,active)
  titlebar @mx.dcc.win $chr(62) $chr(91) $+ $upper(%state) $+ $chr(93) $+ $chr(32) $+ $chr(64) DCC Events Monitor > Sent lists: %lists - Sent files: %files $chr(91) $+ $mx.bytes(%filebytes) $+ $chr(93) - Sent folders: %folders $chr(91) $+ $mx.bytes(%folderbytes) $+ $chr(93) - Total: $mx.bytes(%totalbytes)
}

alias mx.title.debug {
  if (!$window(@mx.debug.win)) return
  mx.slots.update
  var %active = $send(0)
  var %max = $iif(%mx.maxsend isnum,%mx.maxsend,0)
  var %queue = $dmx.queue.count
  var %speed = $mx.speed($iif(%mx.cps isnum,%mx.cps,0))
  var %compression = $iif(%mx.busy == 1,Running,Idle)
  var %state = $iif(%mx.sleeping == 1,sleeping,active)
  titlebar @mx.debug.win $chr(62) $chr(91) $+ $upper(%state) $+ $chr(93) $+ $chr(32) $+ $chr(64) Active: %active $+ / $+ %max - Queue: %queue - Speed: %speed - Compression: %compression
}

alias mx.debug.win.set {
  if (($1 !isnum 0-2)) return
  set %mx.wdebug $1
  set %mx.debug $iif(%mx.wdebug == 0,0,1)
  if (%mx.wdebug == 2) {
    if (!$window(@mx.debug.win)) mx.debug.win.open
  }
  else {
    if ($window(@mx.debug.win)) window -c @mx.debug.win
  }
}

alias mx.dlist {
  echo -s $+($time(HH:nn:ss),$chr(32),$chr(62),$chr(32),$1-)
  if (%mx.debug != 1) return
  if (%mx.wdebug == 2) {
    if (!$window(@mx.debug.win)) mx.debug.win.open
    aline @mx.debug.win $+($time(HH:nn:ss),$chr(32),$chr(62),$chr(32),$1-)
  }
}

alias mx.dbg {
  if ((%mx.debug != 1) || (%mx.wdebug == 0)) return
  if (%mx.wdebug == 1) {
    echo -s $+($time(HH:nn:ss),$chr(32),$chr(62),$chr(32),$1-)
    return
  }
  if (%mx.wdebug == 2) {
    if (!$window(@mx.debug.win)) mx.debug.win.open
    aline @mx.debug.win $+($time(HH:nn:ss),$chr(32),$chr(62),$chr(32),$1-)
  }
}

alias mx.out.view {
  if ((%mx.debug != 1) || (%mx.wdebug == 0)) return
  var %type = $1
  var %cid = $2
  var %to = $3
  var %txt = $4-
  var %net = $scid(%cid).network
  if (!%net) var %net = Unknown
  if (%mx.wdebug == 2) {
    if (!$window(@mx.debug.win)) mx.debug.win.open
    aline @mx.debug.win $+($time(HH:nn:ss),$chr(32),%net,$chr(58),%type,$chr(58),%to,$chr(32),$chr(62),$chr(32),%txt)
    return
  }
  if (%mx.wdebug == 1) {
    echo -s $+($time(HH:nn:ss),$chr(32),%net,$chr(58),%type,$chr(58),%to,$chr(32),$chr(62),$chr(32),%txt)
  }
}

alias -l mx.out.clean {
  var %type = $1
  var %txt = $2-
  if ((%mx.nocolor == 1) && (%type == notice)) return $strip(%txt,burc)
  return %txt
}

alias mx.out.send {
  if ($0 < 4) return
  var %type = $1
  var %cid = $2
  var %to = $3
  var %hasSilent = $iif($4 isnum,1,0)
  var %silent = $iif(%hasSilent == 1,$4,0)
  var %from = $iif(%hasSilent == 1,5,4)
  var %text = $gettok($1-,%from $+ -,32)
  if (!%text) return
  %text = $mx.out.clean(%type,%text)
  write $qt(%mx.out.queue) %type $chr(9) %cid $chr(9) %to $chr(9) %text
  if (%silent != 1) mx.out.view %type %cid %to %text
}

alias mx.out.now {
  if ($0 < 4) return
  var %type = $1
  var %cid = $2
  var %to = $3
  var %txt = $4-
  if ((!%cid) || (!%to) || (!%txt)) return
  %txt = $mx.out.clean(%type,%txt)
  mx.out.view %type %cid %to %txt
  if ($scid(%cid).status != connected) {
    mx.dbg %mx.c1 Now blocked, cid not connected: $+ %mx.c2 %cid %mx.nc
    return
  }
  scid %cid
  if (%type == msg) .msg %to %txt
  elseif (%type == notice) .notice %to %txt
  elseif (%type == ctcp) .ctcp %to %txt
}

alias mx.out.flush {
  if (!$isfile(%mx.out.queue)) return
  var %d = $read($qt(%mx.out.queue),n,1)
  if (!%d) return
  var %type = $gettok(%d,1,9)
  var %cid  = $gettok(%d,2,9)
  var %to   = $gettok(%d,3,9)
  var %txt  = $gettok(%d,4-,9)
  if ((!%cid) || (!%to) || (!%txt)) {
    write -dl 1 $qt(%mx.out.queue)
    return
  }
  if ($scid(%cid).status != connected) {
    write -dl 1 $qt(%mx.out.queue)
    return
  }
  scid %cid
  if (%type == msg) .msg %to %txt
  elseif (%type == notice) .notice %to %txt
  elseif (%type == ctcp) .ctcp %to %txt
  else {
    mx.dbg %mx.c1 Flush skipped, invalid type: %mx.c2 %type %mx.nc
    write -dl 1 $qt(%mx.out.queue)
    return
  }
  write -dl 1 $qt(%mx.out.queue)
}

alias mx.out.start {
  .timermxout off
  .timermxfindout off
  if (%mx.enabled != 1) return
  .timermxout -m 0 %mx.out.delay mx.out.flush
  mx.find.out.start
}

alias mx.find.out.send {
  if ($0 < 4) return
  var %type = $1
  var %cid = $2
  var %to = $3
  var %text = $4-
  if ((!%cid) || (!%to) || (!%text)) return
  %text = $mx.out.clean(%type,%text)
  write $qt(%mx.find.queue) %type $chr(9) %cid $chr(9) %to $chr(9) %text
  mx.out.view %type %cid %to %text
  if (!$timer(mxfindout)) mx.find.out.start
}

alias mx.find.out.flush {
  if (!$isfile(%mx.find.queue)) return
  var %data = $read($qt(%mx.find.queue),n,1)
  if (!%data) return
  var %type = $gettok(%data,1,9)
  var %cid = $gettok(%data,2,9)
  var %to = $gettok(%data,3,9)
  var %text = $gettok(%data,4-,9)
  if ((!%cid) || (!%to) || (!%text)) {
    write -dl 1 $qt(%mx.find.queue)
    return
  }
  if ($scid(%cid).status != connected) {
    write -dl 1 $qt(%mx.find.queue)
    return
  }
  scid %cid
  if (%type == msg) .msg %to %text
  elseif (%type == notice) .notice %to %text
  elseif (%type == ctcp) .ctcp %to %text
  else {
    write -dl 1 $qt(%mx.find.queue)
    return
  }
  write -dl 1 $qt(%mx.find.queue)
}

alias mx.find.out.start {
  .timermxfindout off
  if (%mx.enabled != 1) return
  if (%mx.find.out.delay !isnum 500-5000) set %mx.find.out.delay 3000
  .timermxfindout -m 0 %mx.find.out.delay mx.find.out.flush
}

alias -l mx.rar.make.name {
  var %folder = $1-
  if (!%folder) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Empty folder received %mx.nc
    return
  }
  var %last = $nopath(%folder)
  var %parentfull = $left(%folder,$calc($len(%folder) - $len(%last) - 1))
  var %parent = $nopath(%parentfull)
  if (!%last) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Last folder empty, using fallback %mx.nc
    return folder_ $+ $ctime
  }
  if (!$regex(%last,/^(cd|disc|disk|disco|dvd|lp|singles|cover|covers|scan|scans|artwork)$/i)) {
    if (!$regex(%last,/^(cd|disc|disk|disco|part|parte|vol|volume|volumen|dvd|lp)\s*0*\d+$/i)) {
      if (!$regex(%last,/^(cd|disc|disk|disco|part|parte|vol|volume|volumen|dvd|lp)\s*(i|ii|iii|iv|v|vi|vii|viii|ix|x)$/i)) {
        if (!$regex(%last,/^(side|lado)\s*[ab]$/i)) {
          if (!$regex(%last,/^(a|b)\s*(side|lado)$/i)) {
            if (!$regex(%last,/^(pt|chapter|capitulo|session)\s*(0*\d+|i|ii|iii|iv|v|vi|vii|viii|ix|x)$/i)) {
              return %last
            }
          }
        }
      }
    }
  }
  if (%parent) {
    var %rarname = %parent - %last
    return %rarname
  }
  return %last
}

ctcp *:VERSION:*:{
  if (%mx.ctcp.version.lock) return
  set -u6 %mx.ctcp.version.lock 1
  .ctcpreply $nick VERSION $+($chr(91),$chr(32),mx.rarserver,$chr(32),v,%mx.version,$chr(32),$chr(93),$chr(32),Unified Files + Folders Sharing Server • https://github.com/mxbiteck/mxrarserver)
}

alias mx.stats.init {
  if (%mx.rarrequested == $null) set %mx.rarrequested 0
  if (%mx.rarstart == $null) set %mx.rarstart 0
  if (%mx.rarcompleted == $null) set %mx.rarcompleted 0
  if (%mx.rarsent == $null) set %mx.rarsent 0
  if (%mx.rarfail == $null) set %mx.rarfail 0
  if (%mx.rarcobytes == $null) set %mx.rarcobytes 0
  if (%mx.rartsent == $null) set %mx.rartsent 0
  if (%mx.rardsent == $null) set %mx.rardsent 0
  if (%mx.rarysent == $null) set %mx.rarysent 0
  if (%mx.rarbmsent == $null) set %mx.rarbmsent 0
  if (%mx.rarbysent == $null) set %mx.rarbysent 0
  if (%mx.rlists == $null) set %mx.rlists 0
  if (%mx.clists == $null) set %mx.clists 0
  if (%mx.flists == $null) set %mx.flists 0
  if (%mx.stats.file.requested == $null) set %mx.stats.file.requested 0
  if (%mx.stats.file.sent == $null) set %mx.stats.file.sent 0
  if (%mx.stats.file.completed == $null) set %mx.stats.file.completed 0
  if (%mx.stats.file.failed == $null) set %mx.stats.file.failed 0
  if (%mx.stats.file.bytes == $null) set %mx.stats.file.bytes 0
  if (%mx.stats.file.daycount == $null) set %mx.stats.file.daycount 0
  if (%mx.stats.file.daybytes == $null) set %mx.stats.file.daybytes 0
  if (%mx.stats.file.yesterdaycount == $null) set %mx.stats.file.yesterdaycount 0
  if (%mx.stats.file.yesterdaybytes == $null) set %mx.stats.file.yesterdaybytes 0
  if (%mx.stats.folder.sent == $null) set %mx.stats.folder.sent 0
  if (%mx.stats.folder.cancelled == $null) set %mx.stats.folder.cancelled 0
  if (%mx.stats.folder.daycount == $null) set %mx.stats.folder.daycount 0
  if (%mx.stats.folder.yesterdaycount == $null) set %mx.stats.folder.yesterdaycount 0
  if (%mx.stats.transfer.seconds == $null) set %mx.stats.transfer.seconds 0
  if (%mx.stats.daystamp == $null) set %mx.stats.daystamp $asctime(yyyy-mm-dd)
  if (%mx.rarday == $null) set %mx.rarday $day
  if (%mx.rarmonth == $null) set %mx.rarmonth $month
  if (%mx.raryear == $null) set %mx.raryear $year
}

alias mx.stats.file.sent {
  mx.stats.rollover
  inc %mx.stats.file.sent
  mx.main.stats.refresh
}

alias mx.stats.folder.sent {
  mx.stats.rollover
  inc %mx.stats.folder.sent
  mx.main.stats.refresh
}

alias mx.stats.rollover {
  mx.stats.init
  var %today = $asctime(yyyy-mm-dd)
  var %yesterday = $asctime($calc($ctime - 86400),yyyy-mm-dd)
  if (%mx.raryear != $year) {
    set %mx.rarbysent 0
    set %mx.raryear $year
  }
  if (%mx.rarmonth != $month) {
    set %mx.rarbmsent 0
    set %mx.rarmonth $month
  }
  if (%mx.stats.daystamp != %today) {
    if (%mx.stats.daystamp == %yesterday) {
      set %mx.stats.file.yesterdaycount %mx.stats.file.daycount
      set %mx.stats.file.yesterdaybytes %mx.stats.file.daybytes
      set %mx.stats.folder.yesterdaycount %mx.stats.folder.daycount
      set %mx.rarysent %mx.rardsent
    }
    else {
      set %mx.stats.file.yesterdaycount 0
      set %mx.stats.file.yesterdaybytes 0
      set %mx.stats.folder.yesterdaycount 0
      set %mx.rarysent 0
    }
    set %mx.stats.file.daycount 0
    set %mx.stats.file.daybytes 0
    set %mx.stats.folder.daycount 0
    set %mx.rardsent 0
    set %mx.stats.daystamp %today
    set %mx.rarday $day
  }
}

alias mx.stats.jobstart {
  mx.stats.rollover
  inc %mx.rarstart 1
  if ($dialog(mx.rarserver)) mx.main.stats.refresh
  set %mx.current.start $ctime
}

alias mx.stats.compdone {
  mx.stats.rollover
  inc %mx.rarcompleted 1
  var %sec = 0
  if (%mx.current.start != $null) var %sec = $calc($ctime - %mx.current.start)
  if (%sec < 0) var %sec = 0
  if ($isfile(%mx.current.rarfile)) {
    var %b = $file(%mx.current.rarfile).size
    if (%b > 0) inc %mx.rarcobytes %b
  }
  if ($dialog(mx.rarserver)) mx.main.stats.refresh
}

alias mx.stats.sentok {
  mx.stats.rollover
  var %b = $iif($1 isnum,$1,0)
  if ((%b <= 0) && ($isfile($2-))) {
    var %b = $file($2-).size
  }
  inc %mx.rarsent
  inc %mx.stats.folder.daycount
  if (%b > 0) {
    inc %mx.rartsent %b
    inc %mx.rardsent %b
    inc %mx.rarbmsent %b
    inc %mx.rarbysent %b
  }
}

dialog mx.monitor {
  title "mx.rarserver - Transfer Monitor"
  size -1 -1 294 135
  option dbu
  box "Queue", 30, 4 2 286 61
  button "Move up", 2, 257 10 32 11
  button "Move down", 3, 257 22 32 11
  button "Delete", 4, 257 34 32 11
  button "Clear", 5, 257 46 32 11
  box "Active transfers", 31, 4 64 286 56
  text "Queue: 0 | Sends: 0 | Receives: 0 | Speed: 0 KB/s", 7, 6 124 244 8
  button "Close", 6, 257 122 32 11, cancel
}

alias -l mx.cfg.dir.del {
  if (!$dialog(mx.rarserver)) return
  var %pl = $mx.cfg.pl.name.sanitize($mx.main.dcx.get(mx.rarserver,201,2).seltext)
  if (!%pl) return
  var %path = $mx.main.dcx.get(mx.rarserver,211,2).seltext
  if (!%path) return
  var %ok = $input(Remove this directory? $+ $crlf $+ %path,yn,Remove Dir)
  if (%ok != $true) return
  var %db = $mx.cfg.dbfile
  if (!$isfile(%db)) return
  var %tmp = $scriptdir $+ plb2_dirs.delone.tmp
  write -c $qt(%tmp)
  var %i = 1, %found = 0
  while ($read(%db,n,%i)) {
    var %l = $ifmatch
    if (($gettok(%l,1,124) == %pl) && ($gettok(%l,2-,124) == %path)) {
      %found = 1
    }
    else write $qt(%tmp) %l
    inc %i
  }
  if (!%found) { .remove $qt(%tmp) | mx.dbg %mx.c1 No match, nothing removed %mx.nc | return }
  .remove $qt(%db)
  .rename $qt(%tmp) $qt(%db)
  mx.dbg %mx.c1 Directory $+ %mx.c2 %path %mx.c1 $+ has been removed from list: $+ %mx.c2 %pl %mx.nc 
  mx.cfg.plb2.selchanged
}

alias mx.menu.buildlists {
  if ($1 == begin) return
  if ($1 !isnum) return
  if (!$isfile(%mx.plnames)) return
  var %name = $read(%mx.plnames,n,$1)
  if (!%name) return
  return %name $+ :mx.cfg.pl.build.selected.byname $qt(%name)
}

alias mx.cfg.pl.build.selected.byname {
  if (!$1-) return
  mx.cfg.pl.build.selected $noqt($1-)
}

alias mx.menu.buildfiles {
  if ($1 == begin) return
  if ($1 !isnum) return
  if (!$isfile(%mx.files.plnames)) return
  var %name = $read(%mx.files.plnames,n,$1)
  if (!%name) return
  return %name $+ :mx.files.build.selected.byname $qt(%name)
}

alias mx.files.build.selected.byname {
  if (!$1-) return
  mx.files.build selected $noqt($1-)
}

alias mx.menu.publiclists {
  if ($1 == begin) return
  if ($1 !isnum) return
  var %file = $findfile(%mx.plbase,*-MX.txt,$1)
  if (!%file) return
  return $nopath(%file) $+ :run $qt(%file)
}

alias mx.menu.publicfiles {
  if ($1 == begin) return
  if ($1 !isnum) return
  var %file = $findfile(%mx.files.public,*-MX.txt,$1)
  if (!%file) return
  return $nopath(%file) $+ :run $qt(%file)
}

menu menubar {
  mxrarserver %mx.version
  .configuration
  ..open:mx.cfg.open
  ..$iif(%mx.enabled == 1,turn off,turn on):mx.toggle
  ..-
  ..$iif(%mx.ad.echo == 1,hide own ads,show own ads):mx.ad.echo.toggle
  ..-
  ..add channel assignment:mx.cfg.chan.add
  .-
  .monitoring
  ..status:mx.status
  ..statistics:mx.stats
  ..-
  ..monitor:mx.monitor.open
  .-
  .queue
  ..clear queue:dmx.queue.clear
  ..queue unlock:mx.queue.unlock
  .-
  .build lists
  ..Files
  ...build all:mx.files.build all
  ...-
  ...build selected $+ ( $+ $iif($isfile(%mx.files.plnames),$lines(%mx.files.plnames),0) $+ )
  ....$submenu($mx.menu.buildfiles($1))
  ..Folders
  ...build all:mx.cfg.pl.build.all
  ...-
  ...build selected $+ ( $+ $iif($isfile(%mx.plnames),$lines(%mx.plnames),0) $+ )
  ....$submenu($mx.menu.buildlists($1))
  .active lists
  ..Files
  ...masterlist:run $qt(%mx.files.masterlist)
  ...-
  ...public lists $+ ( $+ $findfile(%mx.files.public,*-MX.txt,0) $+ )
  ....$submenu($mx.menu.publicfiles($1))
  ..Folders
  ...masterlist:run $qt(%mx.masterlist)
  ...-
  ...public lists $+ ( $+ $findfile(%mx.plbase,*-MX.txt,0) $+ )
  ....$submenu($mx.menu.publiclists($1))
  .-
  .tools
  ..themes:mx.cfg.open | mx.main.section themes
  ..windows:mx.windows.open
  ..-
  ..cancel folder compression:mx.dbg %mx.c2 [warn] %mx.c1 Manual action: cancel compression, terminate mxrar.exe, and resume queue. %mx.nc | mx.kill.rar.clean resume
  ..cancel active list build:mx.dbg %mx.c2 [warn] %mx.c1 Manual action: cancel the active Files, Folders, or Complete list build. %mx.nc | mx.kill.builder.clean
  ..-
  ..restart system:mx.restart
  ..hard reset:mx.hardreset
  .-
  .clean window
  ..active:mx.wclear -a
  ..events:mx.wclear -w
  ..-
  ..all windows:mx.wclear
  -
}

menu nicklist {
  mxrarserver %mx.version
  .remove pending requests:mx.queue.confirm $1 $network
  .-
  .request selected nick's list:say @ $+ $$1
  .-
  .configuration:mx.cfg.open
  .monitoring
  ..status:mx.status
  ..statistics:mx.stats
  ..-
  ..monitor:mx.monitor.open
  -
}

menu channel,status,query {
  mxrarserver %mx.version
  .configuration
  ..open:mx.cfg.open
  ..$iif(%mx.enabled == 1,turn off,turn on):mx.toggle
  ..-
  ..$iif(%mx.ad.echo == 1,hide own ads,show own ads):mx.ad.echo.toggle
  ..-
  ..add channel assignment:mx.cfg.chan.add
  .-
  .monitoring
  ..status:mx.status
  ..statistics:mx.stats
  ..-
  ..monitor:mx.monitor.open
  .-
  .queue
  ..clear queue:dmx.queue.clear
  ..queue unlock:mx.queue.unlock
  .-
  .build lists
  ..Files
  ...build all:mx.files.build all
  ...-
  ...build selected $+ ( $+ $iif($isfile(%mx.files.plnames),$lines(%mx.files.plnames),0) $+ )
  ....$submenu($mx.menu.buildfiles($1))
  ..Folders
  ...build all:mx.cfg.pl.build.all
  ...-
  ...build selected $+ ( $+ $iif($isfile(%mx.plnames),$lines(%mx.plnames),0) $+ )
  ....$submenu($mx.menu.buildlists($1))
  .active lists
  ..Files
  ...masterlist:run $qt(%mx.files.masterlist)
  ...-
  ...public lists $+ ( $+ $findfile(%mx.files.public,*-MX.txt,0) $+ )
  ....$submenu($mx.menu.publicfiles($1))
  ..Folders
  ...masterlist:run $qt(%mx.masterlist)
  ...-
  ...public lists $+ ( $+ $findfile(%mx.plbase,*-MX.txt,0) $+ )
  ....$submenu($mx.menu.publiclists($1))
  .-
  .tools
  ..themes:mx.cfg.open | mx.main.section themes
  ..windows:mx.windows.open
  ..-
  ..cancel folder compression:mx.dbg %mx.c2 [warn] %mx.c1 Manual action: cancel compression, terminate mxrar.exe, and resume queue. %mx.nc | mx.kill.rar.clean resume
  ..cancel active list build:mx.dbg %mx.c2 [warn] %mx.c1 Manual action: cancel the active Files, Folders, or Complete list build. %mx.nc | mx.kill.builder.clean
  ..-
  ..restart system:mx.restart
  ..hard reset:mx.hardreset
  .-
  .clean window
  ..active:mx.wclear -a
  ..events:mx.wclear -w
  ..-
  ..all windows:mx.wclear
  -
}

alias mx.wclear {
  if ($1 == -a) {
    var %w = $active, %t = $window(%w).type, %n = $lower(%w)
    if ((%t == status) || (%t == channel) || (%t == query) || ((%t == custom) && ($left(%n,4) == @mx.))) clear $qt(%w)
    return
  }
  if ($scon(0)) scon -a mx.wclear.run $1
  else mx.wclear.run $1
}

alias -l mx.wclear.run {
  var %i = $window(*,0), %w, %t, %n
  while (%i > 0) {
    %w = $window(*,%i)
    %t = $window(%w).type
    %n = $lower(%w)
    if (($1 == -w) && (%t == custom) && ($left(%n,4) == @mx.)) clear $qt(%w)
    elseif (($1 != -w) && ((%t == status) || (%t == channel) || (%t == query) || ((%t == custom) && ($left(%n,4) == @mx.)))) clear $qt(%w)
    dec %i
  }
}

alias mx.status {
  mx.slots.update
  var %state = $iif(%mx.enabled == 1,On,Off)
  var %activity = $iif(%mx.sleeping == 1,Sleeping,Active)
  var %compression = $iif(%mx.busy == 1,Running,Idle)
  var %files = $iif(%mx.files.list == 1,Enabled,Disabled)
  var %folders = $iif(%mx.list == 1,Enabled,Disabled)
  var %filesbuild = $iif($mx.build.files.running,Running,Idle)
  var %foldersbuild = $iif($mx.build.folders.running,Running,Idle)
  var %completebuild = $iif(%mx.complete.active == 1,Running,Idle)
  var %active = $send(0)
  var %max = $iif(%mx.maxsend isnum,%mx.maxsend,0)
  var %free = $iif(%mx.slots isnum,%mx.slots,0)
  var %queue = $dmx.queue.count
  var %speed = $mx.speed($iif(%mx.cps isnum,%mx.cps,0))
  var %filelists = $iif($isfile(%mx.files.plnames),$lines(%mx.files.plnames),0)
  var %folderlists = $iif($isfile(%mx.plnames),$lines(%mx.plnames),0)
  var %channels = $numtok(%mx.chans,44)
  mx.dlist $mx.logo
  mx.dlist %mx.c1 State: %mx.c2 $+ %state %mx.c1 - Activity: %mx.c2 $+ %activity %mx.nc
  mx.dlist %mx.c1 Compression: %mx.c2 $+ %compression %mx.nc
  mx.dlist %mx.c1 Files service: %mx.c2 $+ %files %mx.c1 - Lists: %mx.c2 $+ %filelists %mx.c1 - Build: %mx.c2 $+ %filesbuild %mx.nc
  mx.dlist %mx.c1 Folders service: %mx.c2 $+ %folders %mx.c1 - Lists: %mx.c2 $+ %folderlists %mx.c1 - Build: %mx.c2 $+ %foldersbuild %mx.nc
  mx.dlist %mx.c1 Complete list build: %mx.c2 $+ %completebuild %mx.nc
  mx.dlist %mx.c1 Trigger: %mx.c2 $+ $iif(%mx.trigger,%mx.trigger,Undefined) %mx.nc
  mx.dlist %mx.c1 Active sends: %mx.c2 $+ %active $+ / $+ %max %mx.c1 - Available slots: %mx.c2 $+ %free $+ / $+ %max %mx.nc
  mx.dlist %mx.c1 Queue: %mx.c2 $+ %queue %mx.c1 request(s) - Speed: %mx.c2 $+ %speed %mx.nc
  mx.dlist %mx.c1 Send timer: %mx.c2 $+ $iif($timer(MXRARQ),On,Off) %mx.c1 - Ads timer: %mx.c2 $+ $iif($timer(mxads),On,Off) %mx.nc
  mx.dlist %mx.c1 Assigned channels: %mx.c2 $+ %channels %mx.nc
  if (%mx.busy == 1) {
    mx.dlist %mx.c1 Current job nick: %mx.c2 $+ %mx.current.nick %mx.c1 - Network: %mx.c2 $+ %mx.current.net %mx.nc
    mx.dlist %mx.c1 Current RAR: %mx.c2 $+ %mx.current.rarname %mx.nc
    mx.dlist %mx.c1 Source: %mx.c2 $+ %mx.current.payload %mx.nc
  }
}

alias mx.toggle {
  if (%mx.enabled == 1) set %mx.enabled 0
  else set %mx.enabled 1
  if ($dialog(mx.rarserver)) did -c mx.rarserver 121 %mx.enabled
  mx.apply.runtime
  if (%mx.enabled == 1) mx.dbg %mx.c1 Script enabled %mx.nc
  else mx.dbg %mx.c1 Script disabled %mx.nc
}

alias -l mx.plb2.run.cfg {
  if ($mx.build.isrunning) {
    if ($mx.build.files.running) mx.dlist %mx.c2 Folders build blocked: $+ %mx.c1 Files list build is still in progress. %mx.nc
    else mx.dlist %mx.c2 Folders build blocked: $+ %mx.c1 Another list build is still in progress. %mx.nc
    return 0
  }
  if ($hget(mx.build.reported)) hfree -w mx.build.reported
  var %cfg  = $1
  var %mode = $2
  var %job  = $3-
  if (!$isfile(%mx.plexe)) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Exe missing: $+ %mx.c2 %mx.plexe %mx.nc
    mx.buildmini.fail
    return 0
  }
  if (!$isfile(%cfg)) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Cfg missing: $+ %mx.c2 %cfg %mx.nc
    mx.buildmini.fail
    return 0
  }
  if (!%mx.plbase) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Base empty %mx.nc
    mx.buildmini.fail
    return 0
  }
  if (!%mx.masterlist) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Masterlist empty %mx.nc
    mx.buildmini.fail
    return 0
  }
  var %trg = %mx.trigger
  if (!%trg) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Nick trigger empty %mx.nc
    mx.buildmini.fail
    return 0
  }
  var %run = %mx.plbase $+ \publiclistbuilder.running
  var %progress = $mx.build.progress.file(folders)
  if ($isfile(%run)) .remove $qt(%run)
  if ($isfile(%progress)) .remove $qt(%progress)
  var %args = /config= $+ $qt(%cfg) $chr(32) /publicdir= $+ $qt(%mx.plbase) $chr(32) /master= $+ $qt(%mx.masterlist) $chr(32) /marker= $+ $qt(%run) $chr(32) /progress= $+ $qt(%progress) $chr(32) /trigger= $+ $qt(%trg) $chr(32) /ext= $+ %mx.ext $chr(32) /leaf /size=1
  if (%mode == selected) {
    if (!%job) {
      mx.dbg %mx.c2 Error: %mx.c1 $+ Job empty %mx.nc
      mx.buildmini.fail
      return 0
    }
    %args = %args $+ $chr(32) /job= $+ $qt(%job)
    set %mx.plphase selected
    set %mx.build.count 1
    set %mx.build.name %job
    set %mx.build.mode selected
  }
  else {
    set %mx.plphase all
    unset %mx.build.name
    set %mx.build.mode all
    if (%mx.build.count !isnum) set %mx.build.count 0
  }
  set %mx.build.run 1
  set %mx.build.watch 1
  set %mx.build.start $ctime
  set %mx.build.progress %progress
  if ($isfile($mx.master.ini)) .remove $qt($mx.master.ini)
  if ($isfile(%mx.masterlist)) .remove $qt(%mx.masterlist)
  if (%mode == selected) {
    if ($isfile($mx.list.ini(%job))) .remove $qt($mx.list.ini(%job))
  }
  mx.buildmini.open folders %progress
  mx.dlist %mx.c1 Selected trigger: $+ %mx.c2 %trg %mx.nc
  .run -h $qt(%mx.plexe) %args
  .timerPLB2 0 1 mx.plb2.watch
  return 1
}

dialog mx.buildmini {
  title "Building..."
  size -1 -1 75 113
  option dbu
  box "", 100, 4 2 67 94
  text "Status:", 101, 8 9 18 8
  text "-", 102, 29 9 39 8
  text "Type:", 103, 8 19 18 8
  text "-", 104, 29 19 39 8
  text "Mode:", 105, 8 29 18 8
  text "-", 106, 29 29 39 8
  text "Lists:", 107, 8 39 18 8
  text "-", 108, 29 39 39 8
  text "List creation", 111, 8 50 38 8
  text "", 112, 51 50 16 8, right
  text "Masterlist", 113, 8 70 38 8
  text "Waiting", 114, 46 70 21 8, right
  text "Elapsed:", 115, 8 88 18 8
  text "-", 116, 29 88 39 8
  button "Close", 109, 41 99 29 11, disable
  button "Cancel", 110, 6 99 29 11
}

alias -l mx.build.progress.file {
  if ($lower($1) == files) {
    if (!%mx.files.base) return
    return $+(%mx.files.base,\build-progress.ini)
  }
  if (!%mx.plbase) return
  return $+(%mx.plbase,\build-progress.ini)
}

alias -l mx.buildmini.dcx.init {
  if (!$dialog(mx.buildmini)) return
  if (!$isfile($mx.main.dcx.path)) {
    mx.dlist %mx.c2 Error: %mx.c1 DCX.dll not found: %mx.c2 $mx.main.dcx.path %mx.nc
    return
  }
  mx.main.dcx.call Mark mx.buildmini return
  mx.main.dcx.call xdialog -c mx.buildmini 901 pbar $mx.main.pxw(8) $mx.main.pxh(59) $mx.main.pxw(59) $mx.main.pxh(7) smooth notheme
  mx.main.dcx.call xdialog -c mx.buildmini 902 pbar $mx.main.pxw(8) $mx.main.pxh(79) $mx.main.pxw(59) $mx.main.pxh(7) smooth notheme
  mx.main.dcx.call xdid -r mx.buildmini 901 0 100
  mx.main.dcx.call xdid -r mx.buildmini 902 0 100
  mx.main.dcx.call xdid -c mx.buildmini 901 $rgb(0,120,215)
  mx.main.dcx.call xdid -c mx.buildmini 902 $rgb(0,120,215)
  mx.main.dcx.call xdid -k mx.buildmini 901 $rgb(230,230,230)
  mx.main.dcx.call xdid -k mx.buildmini 902 $rgb(230,230,230)
  mx.main.dcx.call xdid -v mx.buildmini 901 0
  mx.main.dcx.call xdid -v mx.buildmini 902 0
}

alias -l mx.buildmini.percent {
  var %value = $1
  if (%value !isnum) %value = 0
  if (%value < 0) %value = 0
  if (%value > 100) %value = 100
  return $int(%value)
}

alias -l mx.buildmini.bar {
  if (!$dialog(mx.buildmini)) return
  if (!$isfile($mx.main.dcx.path)) return
  var %id = $1, %value = $mx.buildmini.percent($2)
  mx.main.dcx.call xdid -v mx.buildmini %id %value
}

on *:DIALOG:mx.buildmini:sclick:110: {
  mx.dbg %mx.c1 Manual action from build monitor: cancel PublicListBuilder.exe and clean build state. %mx.nc
  mx.kill.builder.clean
}

alias mx.buildmini.open {
  .timerbuildmini_close off
  .timerMXBUILDMINI off
  set %mx.buildmini.source $iif($lower($1) == files,files,folders)
  set %mx.buildmini.progress $2-
  if (!%mx.buildmini.progress) set %mx.buildmini.progress $mx.build.progress.file(%mx.buildmini.source)
  set %mx.buildmini.start $ctime
  if (!$dialog(mx.buildmini)) dialog -m mx.buildmini mx.buildmini
  else dialog -v mx.buildmini
  if (!$dialog(mx.buildmini)) {
    mx.dbg %mx.c2 Error: $+ %mx.c1 Build monitor dialog could not be opened. %mx.nc
    return
  }
  var %mode = $iif(%mx.buildmini.source == files,%mx.files.build.mode,%mx.build.mode)
  var %total = $iif(%mode == selected,1,$iif(%mx.buildmini.source == files,$lines(%mx.files.plnames),%mx.build.count))
  if (%total !isnum) %total = 0
  did -ra mx.buildmini 102 Starting
  did -ra mx.buildmini 104 $iif(%mx.buildmini.source == files,Files,Folders)
  did -ra mx.buildmini 106 $iif(%mode == selected,Build selected,Build all)
  did -ra mx.buildmini 108 0 / %total
  did -r mx.buildmini 112
  did -ra mx.buildmini 114 Waiting
  did -ra mx.buildmini 116 00:00:00
  did -b mx.buildmini 109
  did -e mx.buildmini 110
  mx.buildmini.bar 901 0
  mx.buildmini.bar 902 0
  .timerMXBUILDMINI 0 1 mx.buildmini.update
}

alias mx.buildmini.update {
  if (!$dialog(mx.buildmini)) {
    .timerMXBUILDMINI off
    return
  }
  var %progress = %mx.buildmini.progress
  var %stage = $lower($readini(%progress,Progress,stage))
  var %type = $lower($readini(%progress,Progress,type))
  var %listCurrent = $readini(%progress,Progress,list_current)
  var %listTotal = $readini(%progress,Progress,list_total)
  var %listPercent = $mx.buildmini.percent($readini(%progress,Progress,listpercent))
  var %masterPercent = $mx.buildmini.percent($readini(%progress,Progress,masterpercent))
  var %elapsed = $calc($ctime - %mx.buildmini.start)
  if ((%type != files) && (%type != folders)) %type = %mx.buildmini.source
  if (%listCurrent !isnum) %listCurrent = 0
  if (%listTotal !isnum) {
    var %mode = $iif(%mx.buildmini.source == files,%mx.files.build.mode,%mx.build.mode)
    %listTotal = $iif(%mode == selected,1,$iif(%mx.buildmini.source == files,$lines(%mx.files.plnames),%mx.build.count))
  }
  if (%listTotal !isnum) %listTotal = 0
  var %state = Starting
  ;  if (%stage == list) %state = Building list
  if ((%stage == list) && (%type == files) && (%listPercent == 0)) %state = Scanning files
  elseif (%stage == list) %state = Building list
  elseif (%stage == masterlist) %state = Building masterlist
  elseif (%stage == complete) %state = Completed
  elseif (%stage == error) %state = Error
  did -ra mx.buildmini 102 %state
  did -ra mx.buildmini 104 $iif(%type == files,Files,Folders)
  did -ra mx.buildmini 108 %listCurrent / %listTotal
  did -r mx.buildmini 112
  if (((%stage == starting) || (%stage == list) || (!%stage)) && (%masterPercent == 0)) did -ra mx.buildmini 114 Waiting
  else did -r mx.buildmini 114
  did -ra mx.buildmini 116 $mx.fmt.time(%elapsed)
  mx.buildmini.bar 901 %listPercent
  mx.buildmini.bar 902 %masterPercent
}

alias mx.buildmini.done {
  if (!$dialog(mx.buildmini)) return
  mx.buildmini.update
  did -ra mx.buildmini 102 Completed
  did -r mx.buildmini 112
  did -r mx.buildmini 114
  did -ra mx.buildmini 116 $mx.fmt.time($calc($ctime - %mx.buildmini.start))
  mx.buildmini.bar 901 100
  mx.buildmini.bar 902 100
  did -e mx.buildmini 109
  did -b mx.buildmini 110
  .timerMXBUILDMINI off
  .timerbuildmini_close 1 3 if ($dialog(mx.buildmini)) dialog -x mx.buildmini
}

alias mx.buildmini.fail {
  .timerMXBUILDMINI off
  .timerbuildmini_close off
  if ($dialog(mx.buildmini)) {
    mx.buildmini.update
    did -ra mx.buildmini 102 Error
    did -ra mx.buildmini 116 $mx.fmt.time($calc($ctime - $iif(%mx.buildmini.start isnum,%mx.buildmini.start,$ctime)))
    did -e mx.buildmini 109
    did -b mx.buildmini 110
  }
  unset %mx.build.run
  unset %mx.build.watch
  unset %mx.build.count
  unset %mx.build.name
}

on *:dialog:mx.buildmini:sclick:109:{ dialog -x mx.buildmini }
on *:dialog:mx.buildmini:close:*:{ .timerMXBUILDMINI off }
on *:dialog:mx.buildmini:init:0:{ mx.buildmini.dcx.init }

alias mx.cfg.pl.build.selected {
  if ($mx.build.isrunning) {
    if ($mx.build.files.running) mx.dlist %mx.c2 Folders build blocked: $+ %mx.c1 Files list build is still in progress. %mx.nc
    else mx.dlist %mx.c2 Folders build blocked: $+ %mx.c1 Another list build is still in progress. %mx.nc
    return
  }
  var %pl
  if ($1-) {
    %pl = $mx.cfg.pl.name.sanitize($1-)
  }
  else {
    if (!$dialog(mx.rarserver)) return
    if (!$mx.main.dcx.get(mx.rarserver,201).sel) return
    %pl = $mx.cfg.pl.name.sanitize($mx.main.dcx.get(mx.rarserver,201,2).seltext)
  }
  if (!%pl) return
  mx.cfg.vars.defaults
  mx.plb2.db.init
  write -c %mx.conf
  var %i = 1, %selectedok = 0, %totalvalid = 0
  while (%i <= $lines(%mx.database)) {
    var %l = $read(%mx.database,n,%i)
    var %name = $gettok(%l,1,124)
    var %path = $gettok(%l,2-,124)
    if (($isdir(%path)) && ($findfile(%path,*,1))) {
      var %outpath = $iif($pos(%path,$chr(32)),$qt(%path),%path)
      write %mx.conf $+(%name,$chr(124),%outpath)
      inc %totalvalid
      if ($lower(%name) == $lower(%pl)) inc %selectedok
    }
    inc %i
  }
  if (%selectedok == 0) {
    if ($isfile(%mx.conf)) .remove %mx.conf
    mx.dbg %mx.c2 Error: %mx.c1 $+ Build cancelled, missing directories for list: $+ %mx.c2 %pl %mx.nc
    mx.buildmini.fail
    return
  }
  if (%totalvalid == 0) {
    if ($isfile(%mx.conf)) .remove %mx.conf
    mx.dbg %mx.c2 Error: %mx.c1 $+ Build cancelled, no valid directories found %mx.nc
    mx.buildmini.fail
    return
  }
  set %mx.build.count 1
  set %mx.build.name %pl
  set %mx.build.mode selected
  mx.dlist %mx.c1 Selected list: $+ %mx.c2 %pl %mx.nc
  mx.plb2.run.cfg %mx.conf selected %pl
}

alias -l mx.plb2.report.list {
  var %pl = $1-
  if (!%pl) return 0
  if ($hget(mx.build.reported,%pl)) return 0
  var %ini = $mx.list.ini(%pl)
  if (!$isfile(%ini)) return 0
  var %status = $mx.list.stat(%pl,status)
  if (($lower(%status) != ok) && ($lower(%status) != error)) return 0
  var %folders = $iif($mx.list.stat(%pl,folders),$v1,0), %files = $iif($mx.list.stat(%pl,files),$v1,0), %errors = $iif($mx.list.stat(%pl,errors),$v1,0), %ldur = $iif($mx.list.stat(%pl,duration),$v1,0), %size = $iif($mx.list.stat(%pl,size),$v1,0), %speed = $iif($mx.list.stat(%pl,speed),$v1,0), %date = $iif($mx.list.stat(%pl,date),$v1,-), %time = $iif($mx.list.stat(%pl,time),$v1,-)
  if (!$mx.plb2.ini.fresh(%ini,%date,%time)) return 0
  mx.dlist %mx.c1 List $+ %mx.c2 %pl %mx.c1 $+ created with folders: $+ %mx.c2 $bmx(%folders) $+ %mx.c1 folders containing $+ %mx.c2 $bmx(%files) $+ %mx.c1 files with $+ %mx.c2 $bmx(%errors) %mx.c1 $+ errors completed in $+ %mx.c2 $duration(%ldur) %mx.c1 $+ total size $+ %mx.c2 $mx.bytes(%size) %mx.c1 $+ average speed $+ %mx.c2 %speed folders/s %mx.c1 $+ generated on $+ %mx.c2 %date %mx.c1 $+ at $+ %mx.c2 %time $+ %mx.c1 $+ . %mx.nc
  hadd mx.build.reported %pl 1
  return 1
}

alias -l mx.plb2.report.master {
  if ($hget(mx.build.reported,masterlist)) return 0
  var %ini = $mx.master.ini
  if (!$isfile(%ini)) return 0
  var %routes = $iif($mx.master.stat(routes),$v1,0), %files = $iif($mx.master.stat(files),$v1,0), %errors = $iif($mx.master.stat(errors),$v1,0), %dur = $iif($mx.master.stat(duration),$v1,0), %size = $iif($mx.master.stat(size),$v1,0), %speed = $iif($mx.master.stat(speed),$v1,0), %date = $iif($mx.master.stat(date),$v1,-), %time = $iif($mx.master.stat(time),$v1,-)
  if (!$mx.plb2.ini.fresh(%ini,%date,%time)) return 0
  mx.dlist %mx.c2 Masterlist %mx.c1 $+ created with $+ %mx.c2 $bmx(%routes) %mx.c1 $+ routes containing $+ %mx.c2 $bmx(%files) %mx.c1 $+ files with $+ %mx.c2 $bmx(%errors) %mx.c1 $+ errors completed in $+ %mx.c2 $duration(%dur) %mx.c1 $+ total size $+ %mx.c2 $mx.bytes(%size) %mx.c1 $+ average speed $+ %mx.c2 %speed routes/s %mx.c1 $+ generated on $+ %mx.c2 %date %mx.c1 $+ at $+ %mx.c2 %time $+ %mx.c1 $+ . %mx.nc
  hadd mx.build.reported masterlist 1
  return
}

alias mx.plb2.watch {
  var %run = %mx.plbase $+ \publiclistbuilder.running
  var %mini = $mx.master.ini
  if (!$hget(mx.build.reported)) hmake mx.build.reported 100
  var %reportedLists = 0, %masterReady = 0, %expected = 0
  if ((%mx.build.count == 1) && (%mx.build.name)) {
    mx.plb2.report.list %mx.build.name
    if ($hget(mx.build.reported,%mx.build.name)) inc %reportedLists
    set %expected 1
  }
  elseif ((%mx.build.mode == all) && ($isfile(%mx.plnames))) {
    %expected = $lines(%mx.plnames)
    var %i = 1
    while (%i <= %expected) {
      var %pl = $strip($read(%mx.plnames,n,%i),burc)
      if (%pl) {
        mx.plb2.report.list %pl
        if ($hget(mx.build.reported,%pl)) inc %reportedLists
      }
      inc %i
    }
  }
  if ($isfile(%mini)) {
    mx.plb2.report.master
    if ($hget(mx.build.reported,masterlist)) set %masterReady 1
  }
  if ((%reportedLists < %expected) || (!%masterReady)) {
    if (($isfile(%run)) || ($calc($ctime - %mx.build.start) < 5)) {
      mx.buildmini.update
      return
    }
    .timerPLB2 off
    mx.dbg %mx.c2 Error: $+ %mx.c1 PublicListBuilder.exe ended without valid completion data. %mx.nc
    mx.buildmini.fail
    return
  }
  if ($isfile(%run)) .remove $qt(%run)
  .timerPLB2 off
  mx.buildmini.done
  unset %mx.plphase
  unset %mx.build.run
  unset %mx.build.watch
  unset %mx.build.count
  unset %mx.build.name
  mx.assignment.ui.init
}

alias -l mx.ui.map {
  if ($1 == 444) return 136 444 1 100 mx.maxsend 1
  if ($1 == 555) return 127 555 1 200 mx.maxrequest 1
  if ($1 == 844) return 843 844 1 5 mx.maxpernick 1
  if ($1 == 834) return 833 834 1 8 mx.maxfind 1
  if ($1 == 666) return 138 666 3 60 mx.sendinterval 1
  if ($1 == 777) return 141 777 300 1200 mx.rartimeout 1
  if ($1 == 888) return 143 888 5 60 mx.ad.minutes 1
  if ($1 == 999) return 145 999 5 30 mx.idle.sleep 1
  if ($1 == 1000) return 147 1000 5 30 mx.out.seconds 1
  if ($1 == 136) return 136 444 1 100 mx.maxsend 1
  if ($1 == 127) return 127 555 1 200 mx.maxrequest 1
  if ($1 == 843) return 843 844 1 5 mx.maxpernick 1
  if ($1 == 833) return 833 834 1 8 mx.maxfind 1
  if ($1 == 138) return 138 666 3 60 mx.sendinterval 1
  if ($1 == 141) return 141 777 300 1200 mx.rartimeout 1
  if ($1 == 143) return 143 888 5 60 mx.ad.minutes 1
  if ($1 == 145) return 145 999 5 30 mx.idle.sleep 1
  if ($1 == 147) return 147 1000 5 30 mx.out.seconds 1
}

alias -l mx.var.get return $eval($+($chr(37),$1),2)
alias -l mx.var.set set $+($chr(37),$1) $2-

alias mx.ui.clamp {
  var %v = $1, %min = $2, %max = $3
  if (%v !isnum) %v = %min
  if (%v < %min) %v = %min
  if (%v > %max) %v = %max
  return %v
}

alias -l mx.ui.scrollpos {
  var %val = $1, %min = $2, %max = $3, %inv = $4
  if (%inv == 1) return $calc(%max + %min - %val)
  return %val
}

alias -l mx.ui.scrollval {
  var %pos = $1, %min = $2, %max = $3, %inv = $4
  if (%inv == 1) return $calc(%max + %min - %pos)
  return %pos
}

alias  mx.ui.update {
  var %edit = $1, %scr = $2, %min = $3, %max = $4, %var = $5, %val = $6, %inv = $7
  if (!$dialog(mx.rarserver)) return
  %val = $mx.ui.clamp(%val,%min,%max)
  var %pos = $mx.ui.scrollpos(%val,%min,%max,%inv)
  set %mx.ui.lock 1
  mx.var.set %var %val
  if ($did(mx.rarserver,%scr).sel != %pos) did -c mx.rarserver %scr %pos
  if ($did(mx.rarserver,%edit).text != %val) did -ra mx.rarserver %edit %val
  unset %mx.ui.lock
}

alias -l mx.ui.sync {
  if (!$dialog(mx.rarserver)) return
  var %m = $mx.ui.map($1)
  if (!%m) return
  var %edit = $gettok(%m,1,32)
  var %scr  = $gettok(%m,2,32)
  var %min  = $gettok(%m,3,32)
  var %max  = $gettok(%m,4,32)
  var %var  = $gettok(%m,5,32)
  var %inv  = $gettok(%m,6,32)
  var %v = $mx.var.get(%var)
  if (%v == $null) %v = %min
  %v = $mx.ui.clamp(%v,%min,%max)
  mx.ui.update %edit %scr %min %max %var %v %inv
}

alias mx.ui.scroll.initall {
  if (!$dialog(mx.rarserver)) return
  mx.ui.sync 444
  mx.ui.sync 555
  mx.ui.sync 844
  mx.ui.sync 834
  mx.ui.sync 666
  mx.ui.sync 777
  mx.ui.sync 888
  mx.ui.sync 999
  mx.ui.sync 1000
}

alias -l mx.ui.commit {
  if (!$dialog(mx.rarserver)) return
  if (%mx.ui.lock == 1) return
  var %id = $1
  if (!%id) return
  var %m = $mx.ui.map(%id)
  if (!%m) return
  var %edit = $gettok(%m,1,32)
  var %scr  = $gettok(%m,2,32)
  var %min  = $gettok(%m,3,32)
  var %max  = $gettok(%m,4,32)
  var %var  = $gettok(%m,5,32)
  var %inv  = $gettok(%m,6,32)
  var %t = $did(mx.rarserver,%edit).text
  if ((%t == $null) || (%t !isnum)) {
    var %cur = $mx.var.get(%var)
    if (%cur == $null) %cur = %min
    mx.ui.update %edit %scr %min %max %var %cur %inv
  }
  else {
    %t = $mx.ui.clamp(%t,%min,%max)
    mx.ui.update %edit %scr %min %max %var %t %inv
  }
  unset %mx.ui.pending.edit
}

alias mx.ui.edit.on {
  if (%mx.ui.lock == 1) return
  if (%mx.ui.init == 1) return
  if (!$dialog(mx.rarserver)) return
  if (%mx.ui.pending.edit) {
    if (%mx.ui.pending.edit != $1) mx.ui.commit.one %mx.ui.pending.edit
  }
  set %mx.ui.active $1
  set %mx.ui.pending.edit $1
  var %m = $mx.ui.map($1)
  if (!%m) return
  var %edit = $gettok(%m,1,32)
  var %min  = $gettok(%m,3,32)
  var %max  = $gettok(%m,4,32)
  var %var  = $gettok(%m,5,32)
  var %t    = $did(mx.rarserver,%edit).text
  if ((%t != $null) && (%t isnum)) {
    if ((%t >= %min) && (%t <= %max)) {
      mx.ui.commit.one $1
    }
  }
}

alias mx.ui.scroll.on {
  if (%mx.ui.lock == 1) return
  if (%mx.ui.init == 1) return
  if (!$dialog(mx.rarserver)) return
  mx.ui.commit.active $1
  var %m = $mx.ui.map($1)
  if (!%m) return
  var %edit = $gettok(%m,1,32)
  var %scr  = $gettok(%m,2,32)
  var %min  = $gettok(%m,3,32)
  var %max  = $gettok(%m,4,32)
  var %var  = $gettok(%m,5,32)
  var %inv  = $gettok(%m,6,32)
  var %pos = $did(mx.rarserver,%scr).sel
  if (%pos == $null) var %pos = %min
  var %val = $mx.ui.scrollval(%pos,%min,%max,%inv)
  mx.ui.update %edit %scr %min %max %var %val %inv
  mx.ui.apply.instant $1
}

on *:dialog:mx.rarserver:init:0:{
  if ($did != 0) return
  unset %mx.ui.lock
  unset %mx.ui.init
  unset %mx.ui.pending.edit
  unset %mx.ui.active
  unset %mx.main.navlock
  set %mx.ui.init 1
  if (!$mx.main.tree.create) {
    unset %mx.ui.init
    dialog -x mx.rarserver
    return
  }
  mx.cfg.ui.load
  mx.main.section general
  unset %mx.ui.pending.edit
  unset %mx.ui.init
}

on *:dialog:mx.rarserver:close:*:{
  if (%mx.ui.pending.edit) mx.ui.commit.one %mx.ui.pending.edit
  unset %mx.ui.lock
  unset %mx.ui.init
  unset %mx.ui.pending.edit
  unset %mx.ui.active
  unset %mx.main.navlock
}

on *:dialog:mx.rarserver:tab:*:{
  if (%mx.ui.pending.edit) mx.ui.commit %mx.ui.pending.edit
}

on *:dialog:mx.rarserver:key:136,127,843,833,138,141,143,145,147:{
  if (($keyval == 13) || ($keyval == 9)) {
    if (%mx.ui.pending.edit) mx.ui.commit %mx.ui.pending.edit
  }
}

alias -l mx.ui.commit.pending {
  if (%mx.ui.pending.edit) {
    var %id = %mx.ui.pending.edit
    mx.ui.commit.one %id
    unset %mx.ui.pending.edit
    if ($dialog(mx.rarserver)) {
      var %m = $mx.ui.map(%id)
      if (%m) {
        var %edit = $gettok(%m,1,32)
        var %var = $gettok(%m,5,32)
        var %val = $mx.var.get(%var)
        did -ra mx.rarserver %edit %val
      }
    }
  }
}

on *:dialog:mx.rarserver:scroll:444: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 444
on *:dialog:mx.rarserver:scroll:555: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 555
on *:dialog:mx.rarserver:scroll:844: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 844
on *:dialog:mx.rarserver:scroll:834: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 834
on *:dialog:mx.rarserver:scroll:666: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 666
on *:dialog:mx.rarserver:scroll:777: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 777
on *:dialog:mx.rarserver:scroll:888: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 888 
on *:dialog:mx.rarserver:scroll:999: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 999
on *:dialog:mx.rarserver:scroll:1000: if (%mx.ui.init) return | mx.ui.commit.pending | mx.ui.scroll.on 1000

on *:dialog:mx.rarserver:edit:136: if (%mx.ui.init) return | mx.ui.edit.on 136
on *:dialog:mx.rarserver:edit:127: if (%mx.ui.init) return | mx.ui.edit.on 127
on *:dialog:mx.rarserver:edit:843: if (%mx.ui.init) return | mx.ui.edit.on 843
on *:dialog:mx.rarserver:edit:833: if (%mx.ui.init) return | mx.ui.edit.on 833
on *:dialog:mx.rarserver:edit:138: if (%mx.ui.init) return | mx.ui.edit.on 138
on *:dialog:mx.rarserver:edit:141: if (%mx.ui.init) return | mx.ui.edit.on 141
on *:dialog:mx.rarserver:edit:143: if (%mx.ui.init) return | mx.ui.edit.on 143 
on *:dialog:mx.rarserver:edit:145: if (%mx.ui.init) return | mx.ui.edit.on 145
on *:dialog:mx.rarserver:edit:147: if (%mx.ui.init) return | mx.ui.edit.on 147

alias -l mx.ui.commit.one {
  if (%mx.ui.lock == 1) return
  if (%mx.ui.init == 1) return
  if (!$dialog(mx.rarserver)) return
  var %m = $mx.ui.map($1)
  if (!%m) return
  var %edit = $gettok(%m,1,32)
  var %scr  = $gettok(%m,2,32)
  var %min  = $gettok(%m,3,32)
  var %max  = $gettok(%m,4,32)
  var %var  = $gettok(%m,5,32)
  var %inv  = $gettok(%m,6,32)
  var %t = $did(mx.rarserver,%edit).text
  if ((%t == $null) || (%t !isnum)) {
    var %cur = $mx.var.get(%var)
    if (%cur == $null) %cur = %min
    mx.ui.update %edit %scr %min %max %var %cur %inv
    mx.ui.apply.instant $1
    return
  }
  %t = $mx.ui.clamp(%t,%min,%max)
  mx.ui.update %edit %scr %min %max %var %t %inv
  mx.ui.apply.instant $1
}

alias -l mx.ui.apply.instant {
  var %m = $mx.ui.map($1) | if (!%m) return
  var %var = $gettok(%m,5,32) | var %val = $mx.var.get(%var) | if (%val == $null) return
  if (%var == mx.maxsend) { mx.slots.update | mx.title.refresh | return }
  if (%var == mx.maxpernick) return
  if (%var == mx.maxfind) return
  if (%var == mx.sendinterval) {
    if (%mx.enabled == 1) {
      if ((%mx.sleeping != 1) && ($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) dmx.queue.start
      elseif (%mx.sleeping != 1) .timerMXRARQ off
    }
    return
  }
  if (%var == mx.out.seconds) {
    set %mx.out.delay $calc(%mx.out.seconds * 1000)
    if (%mx.enabled == 1) mx.out.start
    return
  }
  if (%var == mx.ad.minutes) {
    set %mx.adstime $calc(%mx.ad.minutes * 60)
    if ((%mx.enabled == 1) && (%mx.ads == 1) && (%mx.chansadv)) dmx.ads
    else .timermxads off
    return
  }
  if (%var == mx.idle.sleep) {
    set %mx.idle $iif(%mx.idle.sleep > 0,1,0) | set %mx.last.activity $ctime
    if (%mx.idle == 1) { .timerMXIDLE off | .timerMXIDLE -o 0 5 mx.idle.check }
    else { .timerMXIDLE off | if (%mx.sleeping == 1) { set %mx.sleeping 0 | mx.title.refresh } }
    return
  }
}

alias -l mx.ui.commit.active {
  if (!%mx.ui.active) return
  if ($1) {
    var %ma = $mx.ui.map(%mx.ui.active)
    var %mn = $mx.ui.map($1)
    if (%ma && %mn) {
      if (($gettok(%ma,1,32) == $gettok(%mn,1,32)) && ($gettok(%ma,2,32) == $gettok(%mn,2,32))) return
    }
    elseif (%mx.ui.active == $1) return
  }
  mx.ui.commit.one %mx.ui.active
}

alias -l mx.list.ini {
  if (!$1) return
  return %mx.plbase $+ \ $+ $1 $+ \ $+ $1 $+ .ini
}

alias -l mx.master.ini return %mx.plbase $+ \masterlist.ini 

alias -l mx.plb2.ini.fresh {
  var %ini = $1
  var %date = $2
  var %time = $3
  if (%mx.build.start !isnum) return 1
  if ($isfile(%ini)) {
    var %mtime = $file(%ini).mtime
    if ((%mtime isnum) && (%mtime >= %mx.build.start)) return 1
  }
  if ((!%date) || (!%time) || (%date == -) || (%time == -)) return 0
  var %stamp = $ctime(%date %time)
  if (%stamp !isnum) return 0
  if (%stamp < %mx.build.start) return 0
  return 1
}

alias mx.list.stat {
  var %pl = $1
  var %key = $2
  if ((!%pl) || (!%key)) return
  var %ini = $mx.list.ini(%pl)
  if (!$isfile(%ini)) return
  return $readini(%ini,%pl,%key)
}

alias mx.master.stat {
  var %key = $1
  var %ini = $mx.master.ini
  if ((!%key) || (!$isfile(%ini))) return
  return $readini(%ini,Masterlist,%key)
}

alias -l mx.ctcp.stats {
  var %fl = $strip($1), %fo = $strip($2)
  var %entries = 0, %size = 0, %latest = 0
  if ((%fl) && (%fl != -)) {
    var %fini = %mx.files.public $+ \ $+ %fl $+ \ $+ %fl $+ .ini
    if ($isfile(%fini)) {
      var %fn = $readini(%fini,%fl,files)
      var %fs = $readini(%fini,%fl,size)
      var %fd = $readini(%fini,%fl,date)
      var %ft = $readini(%fini,%fl,time)
      var %fstamp = 0
      if (%fd) %fstamp = $ctime(%fd %ft)
      if (%fn isnum) inc %entries %fn
      if (%fs isnum) inc %size %fs
      if (%fstamp isnum 1-) %latest = %fstamp
    }
  }
  if ((%fo) && (%fo != -)) {
    var %dini = $mx.list.ini(%fo)
    if ($isfile(%dini)) {
      var %dn = $readini(%dini,%fo,folders)
      var %ds = $readini(%dini,%fo,size)
      var %dd = $readini(%dini,%fo,date)
      var %dt = $readini(%dini,%fo,time)
      var %dstamp = 0
      if (%dd) %dstamp = $ctime(%dd %dt)
      if (%dn isnum) inc %entries %dn
      if (%ds isnum) inc %size %ds
      if ((%dstamp isnum 1-) && (%dstamp > %latest)) %latest = %dstamp
    }
  }
  return $+(%entries,$chr(29),%size,$chr(29),%latest)
}

alias -l mx.ctcp.next {
  if (%mx.slots > 0) return NOW
  var %i = 1, %best = 0
  while (%i <= $send(0)) {
    var %size = $send(%i).size
    var %sent = $send(%i).sent
    var %cps = $send(%i).cps
    if ((%size isnum) && (%sent isnum) && (%cps isnum 1-)) {
      var %secs = $ceil($calc((%size - %sent) / %cps))
      if ((%secs > 0) && ((%best == 0) || (%secs < %best))) %best = %secs
    }
    inc %i
  }
  if (%best > 0) return $ceil($calc(%best / 60)) $+ m
  return N/A
}

alias -l mx.ctcp.mode {
  if ($lower($1) == silent) return 1
  if ($lower($1) == ctcp) return 2
  return 0
}

alias mx.ad.echo.toggle {
  set %mx.ad.echo $iif(%mx.ad.echo == 1,0,1)
  mx.dbg %mx.c1 Show own ads locally: %mx.c2 $+ $iif(%mx.ad.echo == 1,ON,OFF) %mx.nc
}

alias -l mx.logo return $+(%mx.c3,$chr(32),[,$chr(32),%mx.c2,mx.rarserver,$chr(32),v,%mx.version,%mx.c3,$chr(32),$chr(93),$chr(32),%mx.nc)

alias mx.msg.adx {
  if (%mx.enabled != 1) return
  if (%mx.ads != 1) return
  if (%mx.build.run == 1) return
  if (%mx.build.watch == 1) return
  if (!%mx.chansadv) return
  if (!$timer(mxout)) mx.out.start
  mx.slots.update
  mx.stats.rollover
  var %old = $cid
  var %slots = $iif(%mx.slots isnum,%mx.slots,0)
  var %skipnets
  var %i = 1
  while ($gettok(%mx.chansadv,%i,44)) {
    var %t = $strip($gettok(%mx.chansadv,%i,44))
    var %chan = $gettok(%t,1,58)
    var %net = $gettok(%t,2,58)
    if (%chan && %net) {
      var %cid = $mx.net2cid(%net)
      if ((!%cid) || ($scid(%cid).status != connected)) {
        if ((%mx.debug == 1) && (!$istok(%skipnets,%net,44))) {
          mx.dbg %mx.c1 Advertisement skipped, network not connected: $+ %mx.c2 %net %mx.nc
          %skipnets = $addtok(%skipnets,%net,44)
        }
      }
      else {
        scid %cid
        if (($lower($network) == $lower(%net)) && ($me ison %chan)) {
          var %pl = $mx.chans.getpl(%chan,%net)
          if (%pl) {
            var %mode = $mx.assignment.mode(%chan,%net)
            var %fileslist = $mx.assignment.files(%chan,%net)
            var %folderslist = $mx.assignment.folders(%chan,%net)
            if (!$istok(normal silent ctcp,%mode,32)) %mode = normal
            var %stats = $mx.ctcp.stats(%fileslist,%folderslist)
            var %entries = $gettok(%stats,1,29)
            var %totalsize = $gettok(%stats,2,29)
            var %listdate = $gettok(%stats,3,29)
            if (%entries !isnum) %entries = 0
            if (%totalsize !isnum) %totalsize = 0
            if (%listdate !isnum) %listdate = 0
            var %filecount = 0
            var %foldercount = 0
            if (%fileslist) {
              var %filesini = %mx.files.public $+ \ $+ %fileslist $+ \ $+ %fileslist $+ .ini
              if ($isfile(%filesini)) {
                var %fc = $readini(%filesini,%fileslist,files)
                if (%fc isnum) %filecount = %fc
              }
            }
            if (%folderslist) {
              var %foldersini = $mx.list.ini(%folderslist)
              if ($isfile(%foldersini)) {
                var %dc = $readini(%foldersini,%folderslist,folders)
                if (%dc isnum) %foldercount = %dc
              }
            }
            var %fecha = $iif(%listdate isnum 1-,$asctime(%listdate,dd/mmm/yy),Unknown)
            var %speed = $mx.ad.speed(%mx.cps)
            var %ctcpspeed = $iif(%mx.cps isnum,%mx.cps,0)
            var %qcount = $dmx.queue.count
            var %sentcount = $calc($iif(%mx.rarsent isnum,%mx.rarsent,0) + $iif(%mx.stats.file.completed isnum,%mx.stats.file.completed,0))
            var %maxsend = $iif(%mx.maxsend isnum,%mx.maxsend,0)
            var %next = $mx.ctcp.next
            var %servermode = $mx.ctcp.mode(%mode)
            var %trigger = $iif(%mx.trigger,%mx.trigger,$me)
            var %triggerText = $+($chr(64),%trigger)
            var %logo = $mx.logo
            var %startText = %mx.ad.start
            var %endText = %mx.ad.end
            if (%qcount !isnum) %qcount = 0
            if (!%next) %next = N/A
            var %fileText
            var %folderText
            var %listText
            if (%fileslist) {
              %fileText = %mx.c1 $+ Files: $+ %mx.c2 $+ $+($chr(40),$bmx(%filecount),$chr(41))
            }
            if (%folderslist) {
              %folderText = %mx.c1 $+ Folders: $+ %mx.c2 $+ $+($chr(40),$bmx(%foldercount),$chr(41))
            }
            if ((%fileText) && (%folderText)) {
              %listText = %fileText %mx.c3 $+ $chr(47) %folderText
            }
            elseif (%fileText) {
              %listText = %fileText
            }
            else {
              %listText = %folderText
            }
            var %msg = %mx.c1 Type: %mx.c2 $+ %triggerText %mx.c1 $+ to get list(s) of %listText %mx.c3 $+ %mx.cr $+ %mx.c1 Slots: %mx.c2 $+ %slots $+ $chr(47) $+ %maxsend %mx.c3 $+ %mx.cr $+ %mx.c1 Queue: %mx.c2 $+ %qcount %mx.c3 $+ %mx.cr $+ %mx.c1 Sent: %mx.c2 $+ $bmx(%sentcount) $+ $chr(32) $+ $+($chr(40),$mx.bytes($calc($iif(%mx.rartsent isnum,%mx.rartsent,0) + $iif(%mx.stats.file.bytes isnum,%mx.stats.file.bytes,0)),1),$chr(41)) %mx.c3 $+ %mx.cr $+ %mx.c1 Speed: %mx.c2 $+ %speed %mx.c3 $+ %mx.cr $+ %mx.c1 Updated: %mx.c2 $+ %fecha %mx.c3 $+ %mx.cr $+ %logo
            if (%startText != $null) {
              %msg = %mx.c1 $+ %startText $+ $chr(32) $+ %msg
            }
            if (%endText != $null) {
              %msg = %msg $+ $chr(32) $+ %mx.c1 $+ %endText $+ %mx.nc
            }
            if (%mx.ad.nocolor == 1) {
              %msg = $strip(%msg,burc)
            }
            if (%mode == normal) {
              mx.out.send msg %cid %chan $iif(%mx.ad.echo == 1,0,1) %msg
            }
            if ((%mx.ctcp.channels == 1) && (%mode != ctcp)) {
              var %ctcp = SLOTS %maxsend %slots %next %qcount 999 %ctcpspeed %entries %totalsize %servermode %listdate $uptime(server,3) mx.rarserver v $+ %mx.version
              mx.out.send ctcp %cid %chan 1 %ctcp
            }
          }
        }
      }
    }
    inc %i
  }
  if (%old) scid %old
}

alias bmx return $bytes($1,b)

alias mx.start.adx {
  if (%mx.enabled != 1) { .timermxads off | unset %mx.adstime.last | return }
  if (%mx.ads != 1) { .timermxads off | unset %mx.adstime.last | return }
  if (!%mx.chansadv) { .timermxads off | unset %mx.adstime.last | return }
  if (%mx.adstime !isnum) set %mx.adstime 300
  if (%mx.adstime < 300) set %mx.adstime 300
  if (%mx.adstime > 3600) set %mx.adstime 3600
  if (!$timer(mxout)) mx.out.start
  if ((%mx.adstime.last !isnum) || (%mx.adstime != %mx.adstime.last)) {
    set %mx.adstime.last %mx.adstime
    .timermxads off
    .timermxads -io 0 %mx.adstime mx.msg.adx
    return
  }
  if (!$timer(mxads)) {
    .timermxads -io 0 %mx.adstime mx.msg.adx
  }
}

on *:DISCONNECT:{
  .timerMXQSTART_* off
  .timermx_recover 1 3 mx.apply.runtime
}

alias mx.speed {
  if ((!$isnum($1)) || ($1 <= 0)) return 0 KB/s
  var %v = $abs($1), %join = $iif($2 == 1,1,0)
  if (%v < 1024) return $iif(%join,%v $+ B/s,%v B/s)
  if (%v < 1048576) return $iif(%join,$round($calc(%v / 1024),2) $+ KB/s,$round($calc(%v / 1024),2) KB/s)
  return $iif(%join,$round($calc(%v / 1048576),2) $+ MB/s,$round($calc(%v / 1048576),2) MB/s)
}

alias mx.ad.speed return $mx.speed($strip($1),0)

alias mx.speed.tick {
  var %total = $send(0)
  var %i = 1
  var %sum = 0
  if (%total <= 0) {
    mx.speed.stop
    return
  }
  while (%i <= %total) {
    var %cps = $send(%i).cps
    if (%cps isnum) inc %sum %cps
    inc %i
  }
  set %mx.cps %sum
  if ($window(@mx.debug.win)) mx.title.debug
}

alias mx.speed.start {
  if (!$timer(mx_speed)) .timermx_speed 0 1 mx.speed.tick
  mx.speed.tick
  if (($dialog(mx.monitor)) && (!$timer(mx_monitor))) .timermx_monitor 0 1 mx.monitor.refresh
}

alias mx.speed.stop {
  .timermx_speed off
  if (($dialog(mx.monitor)) && ($mx.monitor.get.active > 0)) {
    if (!$timer(mx_monitor)) .timermx_monitor 0 1 mx.monitor.refresh
  }
  else {
    .timermx_monitor off
    unset %mx.sendclock.*
  }
  set %mx.cps 0
  unset %mx.sent.tick.*
}

alias mx.slots.update {
  var %used = $send(0)
  var %max  = %mx.maxsend
  var %free = $calc(%max - %used)
  if (%free < 0) var %free = 0
  set %mx.slots %free
}

alias mx.colors.num {
  var %v = $1-
  if (%v == $null) return 00
  if ($left(%v,1) == $chr(3)) %v = $mid(%v,2-)
  %v = $gettok(%v,1,44)
  return %v
}

alias mx.colors.theme.apply {
  var %theme = $1-
  if (%theme == MX Classic) {
    set %mx.c4 02
    set %mx.c1 $chr(3) $+ 15 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 09 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 04 $+ , $+ %mx.c4
    set %mx.cr ■
  }
  elseif (%theme == MX Dark) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 15 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 14 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 10 $+ , $+ %mx.c4
    set %mx.cr •
  }
  elseif (%theme == MX Neon) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 11 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 08 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 13 $+ , $+ %mx.c4
    set %mx.cr »
  }
  elseif (%theme == MX Ocean) {
    set %mx.c4 00
    set %mx.c1 $chr(3) $+ 11 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 12 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 10 $+ , $+ %mx.c4
    set %mx.cr ·
  }
  elseif (%theme == MX Fire) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 08 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 04 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 07 $+ , $+ %mx.c4
    set %mx.cr *
  }
  elseif (%theme == MX Toxic) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 09 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 03 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 11 $+ , $+ %mx.c4
    set %mx.cr ☣
  }
  elseif (%theme == MX Cyberpunk) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 13 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 08 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 12 $+ , $+ %mx.c4
    set %mx.cr ◆
  }
  elseif (%theme == MX Matrix) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 03 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 09 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 14 $+ , $+ %mx.c4
    set %mx.cr ▓
  }
  elseif (%theme == MX Sunset) {
    set %mx.c4 00
    set %mx.c1 $chr(3) $+ 07 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 04 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 08 $+ , $+ %mx.c4
    set %mx.cr ☀
  }
  elseif (%theme == MX Ice) {
    set %mx.c4 00
    set %mx.c1 $chr(3) $+ 12 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 11 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 15 $+ , $+ %mx.c4
    set %mx.cr ❄
  }
  elseif (%theme == MX Plasma) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 06 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 13 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 08 $+ , $+ %mx.c4
    set %mx.cr ✦
  }
  elseif (%theme == MX Acid) {
    set %mx.c4 01
    set %mx.c1 $chr(3) $+ 08 $+ , $+ %mx.c4
    set %mx.c2 $chr(3) $+ 09 $+ , $+ %mx.c4
    set %mx.c3 $chr(3) $+ 03 $+ , $+ %mx.c4
    set %mx.cr ⚡
  }
  set %mx.theme %theme
}

alias -l mx.sent.tick.var {
  var %key = $mx.sent.key($1,$2,$3-)
  return $+($chr(37),mx.sent.tick.,$crc(%key,0))
}

alias -l mx.sent.tick.set {
  var %tickvar = $mx.sent.tick.var($1,$2,$3-)
  var %now = $ticks
  set $mx.sent.tick.var($1,$2,$3-) %now
}

alias -l mx.sent.key return $+($lower($1),$chr(124),$lower($2),$chr(124),$lower($3-)) 
alias -l mx.sent.tick.get return $($mx.sent.tick.var($1,$2,$3-),2)

alias -l mx.sent.tick.del {
  var %tickvar = $mx.sent.tick.var($1,$2,$3-)
  var %value = $mx.sent.tick.get($1,$2,$3-)
  unset $mx.sent.tick.var($1,$2,$3-)
}

alias -l mx.sent.tick.elapsed {
  var %tickvar = $mx.sent.tick.var($1,$2,$3-)
  var %start = $mx.sent.tick.get($1,$2,$3-)
  var %now = $ticks
  if (%start !isnum) {
    return 0
  }
  var %ms = $calc(%now - %start)
  if (%ms < 0) var %ms = $calc(%ms + 4294967296)
  if (%ms <= 0) {
    return 0
  }
  var %elapsed = $calc(%ms / 1000)
  return %elapsed
}

alias -l mx.sent.add {
  if ((!$1) || (!$2) || (!$3-)) {
    return
  }
  var %key = $mx.sent.key($1,$2,$3-)
  if ($mx.sent.has($1,$2,$3-)) {
    return
  }
  if (!%mx.sent.list) set %mx.sent.list %key
  else set %mx.sent.list %mx.sent.list $+ $chr(10) $+ %key
  mx.sent.tick.set $1 $2 $3-
}

alias -l mx.sent.has {
  if ((!$1) || (!$2) || (!$3-)) return 0
  var %key = $mx.sent.key($1,$2,$3-)
  var %i = 1
  while ($gettok(%mx.sent.list,%i,10)) {
    if ($v1 == %key) return 1
    inc %i
  }
  return 0
}

alias -l mx.sent.del {
  if ((!$1) || (!$2) || (!$3-)) {
    return
  }
  var %key = $mx.sent.key($1,$2,$3-)
  var %i = 1, %out
  while ($gettok(%mx.sent.list,%i,10)) {
    var %row = $v1
    if (%row != %key) {
      if (!%out) var %out = %row
      else %out = %out $+ $chr(10) $+ %row
    }
    inc %i
  }
  if (%out) set %mx.sent.list %out
  else unset %mx.sent.list
  mx.sent.tick.del $1 $2 $3-
}

alias mx.dcc.win.open {
  if (!$window(@mx.dcc.win)) window $iif($1 == start,-zn,-z) @mx.dcc.win
  mx.title.refresh
}

alias mm {
  var %txt = $1, %label = $2, %bg = $3, %sep = $4, %tail = $5-
  var %c = $chr(3), %m = $chr(44), %b = $chr(2), %s = $chr(32), %p = $chr(46)
  var %bar = $+(%c,%sep,%m,%sep,%p,%c)
  return $+(%bar,%c,%txt,%m,%bg,%b,%s,%label,%s,%b,%bar,%c,%sep,%m,%bg,%tail,%c)
}

alias mx.dcc.format {
  var %size = $iif($1 isnum,$1,0), %secs = $iif($2 isnum,$2,0), %cps = $iif($3 isnum,$3,0), %sizeTxt = $iif(%size > 0,$mx.bytes(%size,1),-), %dur = $iif(%secs > 0,$duration(%secs),-), %speed = $iif(%cps > 0,$mx.speed(%cps,1),-)
  return %sizeTxt $+ / $+ %dur $+ / $+ %speed
}

alias mx.dcc.msg.sent {
  var %nick = $1
  var %net = $2
  var %name = $3
  var %size = $iif($4 isnum,$4,0)
  var %secs = $iif($5 isnum,$5,0)
  var %cps = $iif($6 isnum,$6,0)
  var %resume = $iif($7 isnum,$7,0)
  var %fmt = $mx.dcc.format(%size,%secs,%cps)
  var %rTxt
  if (%resume > 0) {
    %rTxt = $chr(32) $+  Completed after resume from  $mx.bytes(%resume,1)
  }
  return $time(HH:nn:ss) $chr(62) $mm(9,Filesent,12,9) %net $chr(45) Nick: %nick $chr(45) File: %name $chr(45) Size/Time/Speed: %fmt $+ %rTxt
}

alias mx.dcc.msg.rcvd {
  var %nick = $1
  var %net = $2
  var %name = $3
  var %size = $iif($4 isnum,$4,0)
  var %secs = $iif($5 isnum,$5,0)
  var %cps = $iif($6 isnum,$6,0)
  var %resume = $iif($7 isnum,$7,0)
  var %fmt = $mx.dcc.format(%size,%secs,%cps)
  var %rTxt
  if (%resume > 0) {
    %rTxt = $chr(32) $+  Completed after resume from  $mx.bytes(%resume,1)
  }
  return $time(HH:nn:ss) $chr(62) $mm(7,Filercvd,12,7) %net $chr(45) Nick: %nick $chr(45) File: %name $chr(45) Size/Time/Speed: %fmt $+ %rTxt
}

alias mx.dcc.msg.sendfail {
  var %nick = $1, %net = $2, %name = $3, %size = $iif($4 isnum,$4,0), %sent = $iif($5 isnum,$5,0), %secs = $iif($6 isnum,$6,0), %sizeTxt = $iif(%size > 0,$mx.bytes(%size,1),-), %sentTxt = $iif(%sent > 0,$mx.bytes(%sent,1),0B), %dur = $iif(%secs > 0,$duration(%secs),-)
  return $time(HH:nn:ss) $chr(62) $mm(0,Sendfail,4,5) %net $chr(45) Nick: %nick $chr(45) File: %name Size/Transferred: %sizeTxt $+ / $+ %sentTxt $chr(45) Duration: %dur
}

alias mx.dcc.msg.getfail {
  var %nick = $1, %net = $2, %name = $3, %size = $iif($4 isnum,$4,0), %got = $iif($5 isnum,$5,0), %secs = $iif($6 isnum,$6,0), %sizeTxt = $iif(%size > 0,$mx.bytes(%size,1),-), %gotTxt = $iif(%got > 0,$mx.bytes(%got,1),0B), %dur = $iif(%secs > 0,$duration(%secs),-)
  return $time(HH:nn:ss) $chr(62) $mm(0,Getfail,5,4) %net $chr(45) Nick: %nick $chr(45) File: %name $chr(45) Size/Transferred: %sizeTxt $+ / $+ %gotTxt Duration: %dur
}

on *:filesent:*: {
  var %nick = $nick
  var %net = $network
  var %name = $nopath($filename)
  var %size = $send(-1).size
  var %secs = $send(-1).secs
  var %cps = $send(-1).cps
  var %resume = $iif($send(-1).resume isnum,$send(-1).resume,0)
  var %isList = $mx.payload.islist($filename)
  var %isFolder = $mx.sent.isfolderrar($filename)
  var %norm = $mx.path.norm($filename)
  if (%mx.adcc == 1) {
    if (!$window(@mx.dcc.win)) mx.dcc.win.open
    if ($window(@mx.dcc.win)) {
      aline @mx.dcc.win $mx.dcc.msg.sent(%nick,%net,%name,%size,%secs,%cps,%resume)
    }
  }
  mx.del.try $filename
  if (!$mx.sent.has(%nick,%net,$filename)) {
    mx.sent.tick.del %nick %net $filename
    if ($mx.monitor.send.active <= 0) mx.speed.stop
    mx.slots.update
    mx.title.refresh
    return
  }
  mx.sendfail.reset %nick %net
  var %elapsed = $mx.sent.tick.elapsed(%nick,%net,$filename)
  if (%isList) {
    inc %mx.clists
  }
  elseif (%isFolder) {
    mx.stats.transfer.add %size %elapsed %secs %cps
    mx.stats.sentok %size $filename
  }
  else {
    mx.stats.transfer.add %size %elapsed %secs %cps
    mx.stats.file.sentok $filename
  }
  mx.sent.del %nick %net $filename
  if ($mx.monitor.send.active <= 0) mx.speed.stop
  mx.slots.update
  mx.idle.touch
  mx.main.stats.refresh
  mx.title.refresh
}

on *:filercvd:*: {
  var %nick = $nick
  var %net = $network
  var %name = $nopath($filename)
  var %size = $get(-1).size
  var %secs = $get(-1).secs
  var %cps = $get(-1).cps
  var %resume = $iif($get(-1).resume isnum,$get(-1).resume,0)
  if ((%size > 0) && (%secs > 0) && ((%cps <= 0) || (%cps < $calc(%size / %secs / 8)))) {
    %cps = $calc(%size / %secs)
  }
  if (%mx.adcc == 1) {
    if (!$window(@mx.dcc.win)) mx.dcc.win.open
    if ($window(@mx.dcc.win)) {
      aline @mx.dcc.win $mx.dcc.msg.rcvd(%nick,%net,%name,%size,%secs,%cps,%resume)
    }
  }
  mx.title.refresh
}

on *:sendfail:*: {
  var %nick = $nick
  var %net = $network
  var %name = $nopath($filename)
  var %size = $send(-1).size
  var %sent = $send(-1).sent
  var %secs = $send(-1).secs
  var %isList = $mx.payload.islist($filename)
  var %norm = $mx.path.norm($filename)
  mx.idle.touch
  if (%mx.adcc == 1) {
    if (!$window(@mx.dcc.win)) mx.dcc.win.open
    if ($window(@mx.dcc.win)) {
      aline @mx.dcc.win $mx.dcc.msg.sendfail(%nick,%net,%name,%size,%sent,%secs)
    }
  }
  mx.del.try $filename
  if (!$mx.sent.has(%nick,%net,$filename)) {
    mx.sent.tick.del %nick %net $filename
    if ($mx.monitor.send.active <= 0) mx.speed.stop
    mx.slots.update
    mx.title.refresh
    return
  }
  if ($comchan(%nick,0) == 0) {
    mx.sendfail.track %nick %net
  }
  else {
    mx.sendfail.reset %nick %net
  }
  if (%isList) {
    inc %mx.flists
    mx.main.stats.refresh
  }
  elseif ($mx.sent.isfolderrar($filename)) {
    mx.stats.folder.fail
  }
  else {
    mx.stats.file.fail
  }
  mx.sent.del %nick %net $filename
  if ($mx.monitor.send.active <= 0) mx.speed.stop
  mx.slots.update
  mx.idle.touch
  mx.title.refresh
}

on *:getfail:*: {
  var %nick = $nick, %net = $network, %name = $nopath($filename), %size = $get(-1).size, %secs = $get(-1).secs, %got = $iif($isfile($filename),$file($filename).size,0)
  if (%mx.adcc == 1) {
    if (!$window(@mx.dcc.win)) mx.dcc.win.open
    if ($window(@mx.dcc.win)) aline @mx.dcc.win $mx.dcc.msg.getfail(%nick,%net,%name,%size,%got,%secs)
  }
  mx.title.refresh
}

alias -l mx.sendfail.reset {
  var %nick = $1, %net = $2
  if ((!%nick) || (!%net)) return
  var %id = $hash($lower($+(%nick,$chr(29),%net)),32)
  unset %mx.sendfail.count. [ $+ [ %id ] ]
  unset %mx.sendfail.block. [ $+ [ %id ] ]
}

alias -l mx.sendfail.track {
  var %nick = $1, %net = $2
  if ((!%nick) || (!%net)) return
  var %id = $hash($lower($+(%nick,$chr(29),%net)),32)
  var %countVar = $+($chr(37),mx.sendfail.count.,%id)
  var %blockVar = $+($chr(37),mx.sendfail.block.,%id)
  if ($(%blockVar,2) == 1) return
  var %fails = $(%countVar,2)
  if (%fails !isnum) var %fails = 0
  inc %fails
  set $+($chr(37),mx.sendfail.count.,%id) %fails
  mx.dbg %mx.c1 Nick no longer in shared channels: $+ %mx.c2 %nick %mx.c1 $+ Network: $+ %mx.c2 %net %mx.c1 $+ Failed sends: $+ %mx.c2 %fails $+ /2 %mx.nc
  if (%fails < 2) return
  unset %mx.sendfail.count. [ $+ [ %id ] ]
  set -u60 $+($chr(37),mx.sendfail.block.,%id) 1
  var %pending = $dmx.queue.countnick(%nick,%net)
  mx.dbg %mx.c1 Nick unavailable after two failed sends. Removing pending requests for: $+ %mx.c2 %nick %mx.c1 $+ Network: $+ %mx.c2 %net %mx.c1 $+ Pending: $+ %mx.c2 %pending %mx.nc
  if (%pending > 0) {
    mx.nick.remove %nick %net silent
  }
  if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0) && ($timer(MXRARQ).state != on)) {
    dmx.queue.start.now
  }
}

menu @mx.dcc.win {
  clean
  .active:mx.wclear -a
  .events:mx.wclear -w
  .-
  .all windows:mx.wclear
  -
  configuration
  .open:mx.cfg.open
  .restart:mx.restart
  -
  logging
  .log on:log on @mx.dcc.win -f logs\mx_dcc.log
  .log off:log off @mx.dcc.win
  .-
  .open log:run notepad logs\mx_dcc.log
  -
  reopen:window -c @mx.dcc.win | mx.dcc.win.open
  close:window -c @mx.dcc.win
}

alias mx.queue.confirm {
  var %nick = $1
  var %net  = $2
  if ((!%nick) || (!%net)) return
  var %q = $input(Remove pending queue requests for %nick on %net?,yn,MXRAR)
  if (%q != $true) return
  mx.queue.purge %nick %net
}

alias mx.queue.purge {
  if (!$mx.queue.lock.acquire(mx.queue.purge)) return
  var %nick = $1
  var %netf = $2
  var %tmp = %mx.queue $+ .tmp.admin
  var %removed = 0
  if ((!%nick) || (!%netf)) { mx.queue.lock.release mx.queue.purge | return }
  if (!$isfile(%mx.queue)) { mx.queue.lock.release mx.queue.purge | return }
  write -c $qt(%tmp)
  var %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    var %qn = $mx.queue.nick(%line)
    var %qr = $mx.queue.net(%line)
    if (($lower(%qn) == $lower(%nick)) && ($lower(%qr) == $lower(%netf))) inc %removed
    else write $qt(%tmp) %line
    inc %i
    mx.queue.lock.touch
  }
  if (%removed <= 0) {
    .remove $qt(%tmp)
    mx.queue.lock.release mx.queue.purge
    mx.dbg %mx.c1 No requests found for $+ %mx.c2 %nick %mx.c1 $+ on $+ %mx.c2 %netf %mx.nc
    return
  }
  if (!$isfile(%tmp)) {
    mx.queue.lock.release mx.queue.purge
    mx.dbg %mx.c2 Error: %mx.c1 $+ Queue purge aborted, temp file missing. %mx.nc
    return
  }
  var %bak = %mx.queue $+ .bak.purge
  if ($isfile(%bak)) .remove $qt(%bak)
  .rename $qt(%mx.queue) $qt(%bak)
  if (!$isfile(%bak)) {
    .remove $qt(%tmp)
    mx.queue.lock.release mx.queue.purge
    mx.dbg %mx.c2 Error: %mx.c1 $+ Queue purge aborted, backup failed. %mx.nc
    return
  }
  .rename $qt(%tmp) $qt(%mx.queue)
  if (!$isfile(%mx.queue)) {
    .rename $qt(%bak) $qt(%mx.queue)
    mx.queue.lock.release mx.queue.purge
    mx.dbg %mx.c2 Error: %mx.c1 $+ Queue purge restore executed after rename failure. %mx.nc
    return
  }
  if ($isfile(%bak)) .remove $qt(%bak)
  dmx.queue.refresh
  if ($dialog(mx.rarserver)) mx.cfg.queue.refresh
  mx.title.refresh
  mx.queue.lock.release mx.queue.purge
  var %cid = $mx.net2cid(%netf)
  var %ans = $input(Do you want to ignore this nick too?,yn,MXRAR)
  if (%ans == $true) {
    var %mins = $input(Enter ignore time in minutes:,e,MXRAR,60)
    if ((%mins !isnum) || (%mins <= 0)) {
      mx.dbg %mx.c1 Invalid ignore time. Queue entries were removed, but no ignore was applied. %mx.nc
      return
    }
    mx.queue.ignore %nick %netf %mins
    if (%cid) mx.out.now notice %cid %nick %mx.c1 Your $+ %mx.c2 %removed %mx.c1 $+ pending requests $+ %mx.c2 %netf %mx.c1 $+ were removed by the administrator. You have been ignored for $+ %mx.c2 %mins %mx.c1 $+ minute(s). $+ %mx.c3 %mx.cr $+ $mx.logo
  }
  else {
    if (%cid) mx.out.now notice %cid %nick %mx.c1 Your $+ %mx.c2 %removed %mx.c1 $+ pending requests on $+ %mx.c2 %netf %mx.c1 $+ were removed by the administrator. $+ %mx.c3 %mx.cr $+ $mx.logo
  }
}

alias mx.queue.ignore {
  var %nick = $1
  var %nets = $2
  var %mins = $3
  if ((!%nick) || (!%nets) || (%mins !isnum) || (%mins <= 0)) return
  %nets = $remove(%nets,=)
  var %secs = $calc(%mins * 60)  
  var %i = 1
  while ($gettok(%nets,%i,44)) {
    var %net = $v1
    if (%net) {
      var %cid = $mx.net2cid(%net)
      if (%cid) {
        scid %cid
        if ($nick(%nick,0)) {
          .ignore -u $+ %secs $address(%nick,2)
        }
        else {
          .ignore -u $+ %secs %nick
        }
      }
    }
    inc %i
  }
}

alias -l dmx.queue.picknext {
  if (!$isfile(%mx.queue)) return 0
  var %listOwners
  var %normalOwners
  var %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    var %nick = $mx.queue.nick(%line)
    var %net = $mx.queue.net(%line)
    var %payload = $mx.queue.payload(%line)
    if ((%nick) && (%net) && (%payload)) {
      var %cid = $mx.net2cid(%net)
      if (%cid) {
        scid %cid
        if ($mx.send.count.net(%nick,%net) < %mx.maxpernick) {
          var %owner = $lower($+(%nick,@,%net))
          if ($mx.payload.islist(%payload)) {
            %listOwners = $addtok(%listOwners,%owner,44)
          }
          else {
            %normalOwners = $addtok(%normalOwners,%owner,44)
          }
        }
      }
    }
    inc %i
  }
  var %wantList = $iif(%listOwners,1,0)
  var %owners = $iif(%wantList == 1,%listOwners,%normalOwners)
  if (!%owners) return 0
  var %pos = $findtok(%owners,%mx.queue.rr.last,1,44)
  if (%pos !isnum 1-) {
    %pos = 1
  }
  else {
    inc %pos

    if (%pos > $numtok(%owners,44)) {
      %pos = 1
    }
  }
  var %chosen = $gettok(%owners,%pos,44)
  %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    var %nick = $mx.queue.nick(%line)
    var %net = $mx.queue.net(%line)
    var %payload = $mx.queue.payload(%line)
    var %owner = $lower($+(%nick,@,%net))
    var %isList = $mx.payload.islist(%payload)
    if (%owner == %chosen) {
      if (((%wantList == 1) && (%isList == 1)) || ((%wantList == 0) && (%isList != 1))) {
        var %cid = $mx.net2cid(%net)
        if (%cid) {
          scid %cid
          var %active = $mx.send.count.net(%nick,%net)
          if (%active < %mx.maxpernick) {
            set %mx.queue.rr.last %chosen
            var %type = $iif(%isList == 1,List,File/Folder)
            return %i
          }
        }
      }
    }
    inc %i
  }
  return 0
}

alias -l mx.send.count.net {
  var %nick = $lower($1)
  var %net = $2
  if ((!%nick) || (!%net)) return 0
  var %cid = $mx.net2cid(%net)
  if (!%cid) return 0
  var %i = 1, %count = 0
  while (%i <= $send(0)) {
    if (($lower($send(%i)) == %nick) && ($send(%i).cid == %cid)) inc %count
    inc %i
  }
  return %count
}

alias mx.pl.exists {
  if ((!$1) || (!$2)) return 0
  var %db = $mx.cfg.dbfile
  if (!$isfile(%db)) return 0
  var %i = 1
  while ($read(%db,n,%i)) {
    var %l = $ifmatch
    var %pl = $lower($strip($gettok(%l,1,124)))
    var %p  = $lower($strip($gettok(%l,2-,124)))
    if ((%pl == $lower($1)) && (%p == $lower($2))) return 1
    inc %i
  }
  return 0
}

alias mx.plb2.db.init {
  if (%mx.database == $null) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ List database not defined %mx.nc
    return
  }
  if (%mx.plnames == $null) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ List names file not defined %mx.nc
    return
  }
  if (!$isfile(%mx.database)) {
    write -c %mx.database
    mx.dbg %mx.c1 List database created %mx.nc
  }
  if (!$isfile(%mx.plnames)) {
    write -c %mx.plnames
    mx.dbg %mx.c1 List names database created %mx.nc
  }
}

alias -l mx.cfg.pl.add {
  if (!$dialog(mx.rarserver)) return
  var %last = %mx.pl.add.last
  var %raw, %name, %db, %dir
  while (1) {
    %raw = $input(PublicList name,eg,Add PublicList,%last)
    if (!%raw) {
      mx.dbg %mx.c1 Cancelled, list was not created %mx.nc
      return
    }
    set %mx.pl.add.last %raw
    %name = $mx.cfg.pl.name.sanitize(%raw)
    if (!%name) {
      mx.dbg %mx.c2 Error: %mx.c1 $+ Invalid list name: $+ %mx.c2 %raw %mx.nc
      continue
    }
    %db = $remove(%mx.plnames,$chr(9),$chr(10),$chr(13))
    %dir = $left(%db,$calc($len(%db) - $len($nopath(%db))))
    if ((%dir) && (!$isdir(%dir))) {
      mkdir %dir
      if (!$isdir(%dir)) {
        mx.dbg %mx.c2 Error: %mx.c1 $+ Failed to create folder: $+ %mx.c2 %dir %mx.nc
        return
      }
    }
    if (!$isfile(%db)) {
      write -c %db
      if (!$isfile(%db)) {
        mx.dbg %mx.c2 Error: %mx.c1 $+ Failed to create database: $+ %mx.c2 %db %mx.nc
        return
      }
    }
    var %i = 1, %dup = 0
    while (%i <= $mx.main.dcx.get(mx.rarserver,201).num) {
      if ($lower($mx.main.dcx.get(mx.rarserver,201,%i,2).text) == $lower(%name)) {
        %dup = 1
        break
      }
      inc %i
    }
    if (%dup) {
      mx.dbg %mx.c1 List with this name already exists: $+ %mx.c2 %name %mx.nc
      continue
    }
    var %k = 1, %dbdup = 0
    while ($read(%db,n,%k)) {
      if ($lower($strip($ifmatch)) == $lower(%name)) {
        %dbdup = 1
        break
      }
      inc %k
    }
    if (%dbdup) {
      mx.dbg %mx.c2 Error: %mx.c1 $+ Duplicate entry in database: $+ %mx.c2 %name %mx.nc
      continue
    }
    write %db %name
    mx.main.lv.add 201 %name
    mx.main.dcx.call xdid -c mx.rarserver 201 $mx.main.dcx.get(mx.rarserver,201).num
    unset %mx.pl.add.last
    mx.dbg %mx.c1 List successfully added: $+ %mx.c2 %name %mx.nc
    mx.cfg.plb2.selchanged
    return
  }
}

alias -l mx.ui.publiclists.load {
  var %dlg = $1
  var %id  = $2
  if ((!%dlg) || (!%id)) return
  if (!$dialog(%dlg)) return
  if ((%dlg == mx.rarserver) && (%id == 201)) mx.main.dcx.call xdid -r mx.rarserver 201
  else did -r %dlg %id
  if (!$isfile(%mx.plnames)) return
  var %i = 1
  while ($read(%mx.plnames,n,%i)) {
    var %name = $strip($ifmatch)
    if (%name) {
      if ((%dlg == mx.rarserver) && (%id == 201)) mx.main.lv.add 201 %name
      else did -a %dlg %id %name
    }
    inc %i
  }
  if ((%dlg == mx.rarserver) && (%id == 201)) {
    if ($mx.main.dcx.get(mx.rarserver,201).num > 0) {
      if (!$mx.main.dcx.get(mx.rarserver,201).sel) mx.main.dcx.call xdid -c mx.rarserver 201 1
    }
    return
  }
  if ($did(%dlg,%id).num > 0) {
    if (!$did(%dlg,%id).sel) did -c %dlg %id 1
  }
  did -z %dlg %id
}

alias mx.cfg.pl.build.all {
  if ($mx.build.isrunning) {
    if ($mx.build.files.running) mx.dlist %mx.c2 Folders build blocked: $+ %mx.c1 Files list build is still in progress. %mx.nc
    else mx.dlist %mx.c2 Folders build blocked: $+ %mx.c1 Another list build is still in progress. %mx.nc
    return
  }
  mx.dlist %mx.c2 Build-all %mx.c1 $+ list(s) building mode selected %mx.nc
  mx.plb2.db.init
  if (!$isfile(%mx.plnames)) {
    echo -s %mx.c2 Error: $+ %mx.c1 Build cancelled, list database not found %mx.nc
    mx.buildmini.fail
    return
  }
  if (!$isfile(%mx.database)) {
    mx.dbg %mx.c2 Error: $+ %mx.c1 Build cancelled, path database not found %mx.nc
    mx.buildmini.fail
    return
  }
  var %totalLists = $lines(%mx.plnames)
  if (%totalLists == 0) {
    mx.dbg %mx.c2 Error: $+ %mx.c1 Build cancelled, no lists configured %mx.nc
    mx.buildmini.fail
    return
  }
  write -c %mx.conf
  var %missing = $null, %built = 0, %i = 1
  while (%i <= %totalLists) {
    var %pl = $strip($read(%mx.plnames,%i),burc)
    var %hasValid = 0
    var %j = 1
    while (%j <= $lines(%mx.database)) {
      var %l = $read(%mx.database,%j)
      var %name = $strip($gettok(%l,1,124),burc)
      var %path = $strip($gettok(%l,2-,124),burc)
      if (%name == %pl) {
        if (($isdir(%path)) && ($findfile(%path,*,1))) {
          var %outpath = $iif($pos(%path,$chr(32)),$qt(%path),%path)
          write %mx.conf $+(%pl,$chr(124),%outpath)
          set %hasValid 1
        }
      }
      inc %j
    }
    if (!%hasValid) %missing = $addtok(%missing,%pl,44)
    else inc %built
    inc %i
  }
  if ($len(%missing)) {
    if ($isfile(%mx.conf)) .remove %mx.conf
    var %missingl = $replace(%missing,$chr(44),$chr(44) $+ $chr(32))
    mx.dlist %mx.c2 Error: %mx.c1 $+ Build cancelled, missing directories for lists: $+ %mx.c2 %missingl %mx.nc
    mx.buildmini.fail
    return
  }
  if (%built == 0) {
    if ($isfile(%mx.conf)) .remove %mx.conf
    mx.dlist %mx.c2 Error: $+ %mx.c1 Build cancelled, no valid lists to build %mx.nc
    mx.buildmini.fail
    return
  }
  set %mx.build.mode all
  unset %mx.build.name
  set %mx.build.count %built
  mx.plb2.run.cfg %mx.conf all
}

alias mx.workdir.open {
  if ($dialog(mx.workdir)) {
    dialog -v mx.workdir
    return
  }
  dialog -m mx.workdir mx.workdir
}

alias -l mx.cfg.dir.add {
  if (!$dialog(mx.rarserver)) return
  var %pl = $mx.cfg.pl.name.sanitize($mx.main.dcx.get(mx.rarserver,201,2).seltext)
  if (!%pl) return
  var %start = $iif(%mx.last.adddir,%mx.last.adddir,%mx.workdir)
  var %path = $sdir(%start,Select folder to add)
  if (!%path) return
  %path = $mx.path.norm(%path)
  if (!%path) return
  if (!$isdir(%path)) return
  set %mx.last.adddir $nofile(%path)
  var %db = $mx.cfg.dbfile
  if (!$isfile(%db)) write -c %db
  var %key = %pl $+ $chr(124) $+ %path
  if ($mx.pl.exists(%pl,%path)) {
    mx.dbg %mx.c1 Directory $+ %mx.c2 %path %mx.c1 $+ already exists in list: $+ %mx.c2 %pl %mx.nc
    return
  }
  write %db %key
  mx.dbg %mx.c1 Directory $+ %mx.c2 %path %mx.c1 $+ has been added to list $+ %mx.c2 %pl %mx.nc
  mx.cfg.plb2.selchanged
}

alias -l mx.cfg.dir.purge {
  var %dir = $mx.path.norm($1-)
  if (!%dir) return
  if (!$isdir(%dir)) return
  if (!$mx.cfg.dir.purge.allowed(%dir)) {
    mx.dbg %mx.c2 Error: %mx.c1 Purge blocked for unsafe directory: %mx.c2 %dir %mx.c1 - External workdir folder must be named exactly rarwork. %mx.nc
    return
  }
  while ($findfile(%dir,*,0) > 0) {
    var %f = $findfile(%dir,*,1)
    if (!%f) break
    .remove $qt(%f)
    if ($isfile(%f)) {
      mx.dbg %mx.c2 Error: %mx.c1 Purge halted. File locked: %mx.c2 %f %mx.nc
      return
    }
  }
  while ($finddir(%dir,*,0) > 0) {
    var %count = $finddir(%dir,*,0)
    var %i = 1
    var %deep
    while (%i <= %count) {
      var %sub = $finddir(%dir,*,%i)
      if ((!%deep) || ($len(%sub) > $len(%deep))) {
        %deep = %sub
      }
      inc %i
    }
    if (!%deep) break
    .rmdir $qt(%deep)
    if ($isdir(%deep)) {
      mx.dbg %mx.c2 Error: %mx.c1 Purge halted. Directory could not be removed: %mx.c2 %deep %mx.nc
      return
    }
  }
  if ($isdir(%dir)) {
    .rmdir $qt(%dir)
    if ($isdir(%dir)) {
      mx.dbg %mx.c2 Error: %mx.c1 Purge halted. Target directory could not be removed: %mx.c2 %dir %mx.nc
    }
  }
}

alias -l mx.cfg.dir.purge.allowed {
  var %dir = $mx.path.norm($1-)
  var %script = $mx.path.norm($scriptdir)
  var %workdir = $mx.path.norm(%mx.workdir)
  if ((!%dir) || (!%script)) return 0
  if ($lower(%dir) == $lower(%script)) return 0
  if ((%workdir) && ($lower(%dir) == $lower(%workdir))) {
    if ($lower($nopath(%workdir)) == rarwork) return 1
    return 0
  }
  var %roots = $+(%mx.plbase,$chr(29),%mx.files.public,$chr(29),%mx.complete.dir)
  var %i = 1
  while ($gettok(%roots,%i,29)) {
    var %root = $mx.path.norm($v1)
    if ((%root) && ($lower(%root) != $lower(%script)) && ($mx.path.under(%root,%script))) {
      if ($mx.path.under(%dir,%root)) return 1
    }
    inc %i
  }
  return 0
}

alias -l mx.cfg.pl.del {
  if (!$dialog(mx.rarserver)) return
  var %pl = $mx.main.dcx.get(mx.rarserver,201,2).seltext
  if (!%pl) return
  var %pl2 = $mx.cfg.pl.name.sanitize(%pl)
  if (!%pl2) return
  if ($input(Delete %pl2 $+ ?,yn,Delete PublicList) != $true) return
  mx.cfg.pl.chans.purge %pl2
  mx.assignment.list.purge folders %pl2
  if ($isfile(%mx.plnames) && $read(%mx.plnames,w,%pl2)) {
    write -dl $readn %mx.plnames
  }
  mx.cfg.pl.del.dbfile %pl2
  var %dir = %mx.plbase $+ \ $+ %pl2
  if ($isdir(%dir)) {
    mx.cfg.dir.purge %dir
  }
  mx.dbg %mx.c1 List removed successfully: $+ %mx.c2 %pl2 %mx.nc
  mx.cfg.plb2.refresh
}

alias -l mx.cfg.pl.del.dbfile {
  var %db = %mx.database
  if (!$isfile(%db)) return
  var %name = $mx.cfg.pl.name.sanitize($1-)
  if (!%name) return
  var %tmp = $scriptdir $+ plb2_dirs.del.tmp
  write -c $qt(%tmp)
  var %i = 1
  while ($read(%db,n,%i)) {
    var %l = $ifmatch
    if ($lower($gettok(%l,1,124)) != $lower(%name)) {
      write $qt(%tmp) %l
    }
    inc %i
  }
  if (!$isfile(%tmp)) {
    mx.dbg %mx.c2 Error: %mx.c1 $+ Database delete aborted, temp file missing. %mx.nc
    return
  }
  var %bak = %db $+ .bak.del
  if ($isfile(%bak)) .remove $qt(%bak)
  .rename $qt(%db) $qt(%bak)
  if (!$isfile(%bak)) {
    .remove $qt(%tmp)
    mx.dbg %mx.c2 Error: %mx.c1 $+ Database delete aborted, backup failed: $+ %mx.c2 %db %mx.nc
    return
  }
  .rename $qt(%tmp) $qt(%db)
  if (!$isfile(%db)) {
    .rename $qt(%bak) $qt(%db)
    mx.dbg %mx.c2 Error: %mx.c1 $+ Database restore executed after rename failure. %mx.nc
    return
  }
  if ($isfile(%bak)) .remove $qt(%bak)
}

alias -l mx.queue.consume.line {
  var %ln = $1
  if (%ln !isnum 1-) return
  if (!$isfile(%mx.queue)) return
  write -dl %ln $qt(%mx.queue)
  if ($lines(%mx.queue) <= 0) unset %mx.queue.rr.last
  dmx.queue.refresh
  if ($dialog(mx.rarserver)) mx.cfg.queue.refresh
  mx.title.refresh
}

alias mx.squeue {
  if (%mx.enabled != 1) return
  if (%mx.queue.joinwait == 1) return
  if (%mx.sleeping == 1) return
  if ((%mx.busy == 1) || (%mx.complete.active == 1)) {
    dmx.queue.start
    return
  }
  if ((%mx.waitdcc == 1) && ($mx.dcc.waiting)) {
    dmx.queue.start
    return
  }
  if ((%mx.maxsend isnum) && ($send(0) >= %mx.maxsend)) { dmx.queue.start | return }
  if (!$isfile(%mx.queue)) return
  if (!$mx.queue.lock.acquire(mx.squeue)) { dmx.queue.start | return }
  var %ln = $dmx.queue.picknext
  if (!%ln) { mx.queue.lock.release mx.squeue | dmx.queue.start | return }
  var %line = $read(%mx.queue,n,%ln)
  if (!%line) { mx.queue.lock.release mx.squeue | dmx.queue.start | return }
  var %nick = $mx.queue.nick(%line)
  var %net  = $mx.queue.net(%line)
  var %mode = $mx.queue.mode(%line)
  var %real = $mx.queue.payload(%line)
  var %cidN = $mx.net2cid(%net)
  if (!%cidN) { mx.queue.lock.release mx.squeue | dmx.queue.start | return }
  scid %cidN
  if (!%nick) {
    mx.queue.consume.line %ln
    mx.queue.lock.release mx.squeue
    dmx.queue.start
    return
  }
  if (!%real) {
    mx.queue.consume.line %ln
    mx.queue.lock.release mx.squeue
    if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) {
      dmx.queue.start
    }
    else {
      .timerMXRARQ off
    }
    return
  }
  if ($mx.complete.job.is(%real)) {
    if ($mx.build.isrunning) {
      mx.queue.lock.release mx.squeue
      dmx.queue.start
      return
    }
    mx.complete.request %real
    if ((%mx.complete.active == 1) && ($mx.path.norm(%mx.complete.job.file) == $mx.path.norm(%real))) {
      mx.queue.consume.line %ln
      mx.queue.lock.release mx.squeue
      return
    }
    mx.queue.consume.line %ln
    mx.queue.lock.release mx.squeue
    mx.complete.job.remove %real
    if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) dmx.queue.start
    else .timerMXRARQ off
    return
  }
  if ($isfile(%real)) {
    mx.queue.consume.line %ln
    mx.queue.lock.release mx.squeue
    mx.dbg %mx.c1 Sending file: $+ %mx.c2 %real %mx.nc
    mx.idle.touch
    mx.sent.add %nick %net %real
    dcc send %nick %real
    if (!$mx.payload.islist(%real)) {
      mx.stats.file.sent
    }
    mx.speed.start
    if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) dmx.queue.start
    else .timerMXRARQ off
    return
  }
  var %real2 = $mx.path.resolve(%real)
  if (!%real2) {
    mx.queue.consume.line %ln
    mx.queue.lock.release mx.squeue
    if (%mode != ctcp) mx.out.send notice %cidN %nick %mx.c2 Error: %mx.c1 $+ Folder not found $+ %mx.c3 %mx.cr $+ $mx.logo
    if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) {
      dmx.queue.start
    }
    else {
      .timerMXRARQ off
    }
    return
  }
  if (%mx.smart == 1) var %rarname = $mx.rar.make.name(%real2)
  else var %rarname = $nopath(%real2)
  if (!%rarname) var %rarname = folder_ $+ $ctime
  else var %rarname = $strip(%rarname)
  while ($left(%rarname,1) == $chr(32)) var %rarname = $mid(%rarname,2)
  while ($right(%rarname,1) == $chr(32)) var %rarname = $left(%rarname,-1)
  %rarname = %rarname $+ .rar
  mx.rar.start2 $+(%nick,$chr(29),%net,$chr(29),%mode,$chr(29),%rarname,$chr(29),%real2)
  mx.title.refresh
  if (%mx.busy == 1) {
    mx.queue.consume.line %ln
    mx.queue.lock.release mx.squeue
    return
  }
  mx.queue.consume.line %ln
  mx.queue.lock.release mx.squeue
  mx.dbg %mx.c1 Removed failed queue item after unsuccessful dispatch attempt, line: %mx.c2 %ln %mx.nc
  if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) {
    dmx.queue.start
  }
  else {
    .timerMXRARQ off
  }
}

alias -l mx.queue.listbox.load {
  var %dlg = $1
  var %id = $2
  if ((!%dlg) || (!%id)) return
  if (!$dialog(%dlg)) return
  if (((%dlg == mx.rarserver) && (%id == 301)) || ((%dlg == mx.monitor) && (%id == 1))) {
    mx.main.dcx.call xdid -r %dlg %id
  }
  else {
    did -r %dlg %id
  }
  if (!$isfile(%mx.queue)) return
  var %i = 1
  while ($read(%mx.queue,n,%i)) {
    var %line = $ifmatch
    if (((%dlg == mx.rarserver) && (%id == 301)) || ((%dlg == mx.monitor) && (%id == 1))) {
      var %nick = $mx.queue.nick(%line)
      var %net = $mx.queue.net(%line)
      var %payload = $mx.queue.payload(%line)
      var %type
      var %display
      if ($mx.complete.job.is(%payload)) {
        %type = Complete
        %display = $mx.complete.job.display(%payload)
      }
      else {
        var %islist = $mx.payload.islist(%payload)
        %type = $iif($isdir(%payload),Folder,$iif(%islist,List,File))
        %display = $nopath(%payload)
        if (%type == Folder) {
          if (%mx.smart == 1) {
            var %smartname = $mx.rar.make.name(%payload)
            if (%smartname) %display = %smartname
          }
          %display = %display $+ .rar
        }
      }
      if (%dlg == mx.rarserver) mx.main.lv.add 301 $+(%i,$chr(9),%nick,$chr(9),%net,$chr(9),%type,$chr(9),%display)
      else mx.monitor.lv.add 1 $+(%i,$chr(9),%nick,$chr(9),%net,$chr(9),%type,$chr(9),%display)
    }
    else {
      did -a %dlg %id $mx.queue.ui(%line)
    }
    inc %i
  }
}

alias dmx.queue.refresh {
  if ($dialog(mx.rarserver)) { mx.queue.listbox.load mx.rarserver 301 | mx.main.queue.summary }
  if ($dialog(mx.monitor)) {
    mx.queue.listbox.load mx.monitor 1
    mx.monitor.title
  }
}

alias mx.monitor.open {
  if ($dialog(mx.monitor)) {
    dmx.queue.refresh
    mx.monitor.refresh
    mx.monitor.watch
    return
  }
  dialog -m mx.monitor mx.monitor
}

alias -l mx.monitor.dcx.init {
  if (!$dialog(mx.monitor)) return 0
  if (!$isfile($mx.main.dcx.path)) {
    mx.dlist %mx.c2 Error: %mx.c1 DCX.dll not found: %mx.c2 $mx.main.dcx.path %mx.nc
    return 0
  }
  mx.main.dcx.call Mark mx.monitor return
  mx.main.dcx.call xdialog -c mx.monitor 1 listview $mx.main.pxw(8) $mx.main.pxh(11) $mx.main.pxw(246) $mx.main.pxh(48) report fullrow singlesel grid showsel tooltips noheadersort
  mx.main.dcx.call xdid -f mx.monitor 1 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.monitor 1 +l 0 0 $chr(160) $chr(9) +c 0 $mx.main.pxw(13) P $chr(9) +l 0 $mx.main.pxw(38) Nick $chr(9) +l 0 $mx.main.pxw(32) Network $chr(9) +c 0 $mx.main.pxw(24) Type $chr(9) +l 0 $mx.main.pxw(134) File / Folder / List
  mx.main.dcx.call xdialog -c mx.monitor 11 listview $mx.main.pxw(8) $mx.main.pxh(73) $mx.main.pxw(278) $mx.main.pxh(44) report fullrow singlesel grid showsel tooltips noheadersort subitemimage
  mx.main.dcx.call xdid -f mx.monitor 11 +c default 8 Arial
  mx.main.dcx.call xdid -t mx.monitor 11 +l 0 0 $chr(160) $chr(9) +c 0 $mx.main.pxw(13) P $chr(9) +c 0 $mx.main.pxw(13) $chr(160) $chr(9) +l 0 $mx.main.pxw(38) Nick $chr(9) +l 0 $mx.main.pxw(36) Network $chr(9) +l 0 $mx.main.pxw(68) File $chr(9) +r 0 $mx.main.pxw(29) Size $chr(9) +r 0 $mx.main.pxw(33) Speed $chr(9) +c 0 $mx.main.pxw(17) % $chr(9) +c 0 $mx.main.pxw(28) Time
  var %icons = $scriptdir $+ dll\mxicons.dll
  mx.main.dcx.call xdid -w mx.monitor 11 +n 0 $qt(%icons)
  mx.main.dcx.call xdid -w mx.monitor 11 +n 1 $qt(%icons)
  return 1
}

alias -l mx.monitor.lv.add {
  var %id = $1, %row = $2-
  if ((!$dialog(mx.monitor)) || (!%id) || (!%row)) return
  var %fg = $rgb(32,32,32), %bg = $rgb(255,255,255)
  var %cols = $numtok(%row,9)
  var %args = 0 0 + 0 0 0 0 %fg %bg $chr(160)
  var %i = 1
  while (%i <= %cols) {
    %args = %args $+ $chr(9) $+ + 0 -1 %fg %bg $gettok(%row,%i,9)
    inc %i
  }
  mx.main.dcx.call xdid -a mx.monitor %id %args
}

alias -l mx.monitor.transfer.add {
  if ((!$dialog(mx.monitor)) || (!$1-)) return
  var %row = $1-
  var %direction = $gettok(%row,1,29)
  var %icon = $iif(%direction == up,1,2)
  var %fg = $rgb(32,32,32), %bg = $rgb(255,255,255)
  var %args = 0 0 + 0 0 0 0 %fg %bg $chr(160)
  %args = %args $+ $chr(9) $+ + 0 -1 %fg %bg $gettok(%row,2,29)
  %args = %args $+ $chr(9) $+ +C %icon -1 %fg %bg
  var %i = 3
  while (%i <= 9) {
    %args = %args $+ $chr(9) $+ + 0 -1 %fg %bg $gettok(%row,%i,29)
    inc %i
  }
  mx.main.dcx.call xdid -a mx.monitor 11 %args
}

alias -l mx.monitor.send.active {
  var %i = 1, %count = 0
  while (%i <= $send(0)) {
    var %status = $lower($send(%i).status)
    if (($send(%i).done != $true) && (!$istok(sent failed,%status,32))) inc %count
    inc %i
  }
  return %count
}

alias -l mx.monitor.get.active {
  var %i = 1, %count = 0
  while (%i <= $get(0)) {
    var %status = $lower($get(%i).status)
    if (($get(%i).done != $true) && (!$istok(received failed,%status,32))) inc %count
    inc %i
  }
  return %count
}

alias -l mx.monitor.title {
  if (!$dialog(mx.monitor)) return
  var %q = $iif($mx.main.dcx.get(mx.monitor,1).num isnum,$v1,0)
  var %s = $mx.monitor.send.active
  var %r = $mx.monitor.get.active
  var %speed = $iif(%mx.monitor.totalspeed,%mx.monitor.totalspeed,0 KB/s)
  var %sep = $chr(32) $+ $chr(45) $+ $chr(32)
  var %text = Queue: %q %sep Sends: %s %sep Receives: %r %sep Speed: %speed
  did -ra mx.monitor 7 %text
  dialog -t mx.monitor mx.rarserver - Transfer Monitor
}

alias mx.monitor.watch {
  if (!$dialog(mx.monitor)) return
  if ($calc($mx.monitor.send.active + $mx.monitor.get.active) > 0) {
    if (!$timer(mx_monitor)) .timermx_monitor 0 1 mx.monitor.refresh
  }
  else {
    .timermx_monitor off
    mx.monitor.clear.active
    mx.monitor.clearview
    set %mx.cps 0
    set %mx.monitor.totalspeed 0 KB/s
    set %mx.monitor.msg Sends: 0 - Receives: 0 - Speed: 0 KB/s
    mx.monitor.title
  }
}

alias mx.monitor.guard {
  if (!$dialog(mx.monitor)) {
    .timermx_monitor_guard off
    .timermx_monitor off
    if ($mx.monitor.send.active <= 0) mx.speed.stop
    return
  }
  var %active = $calc($mx.monitor.send.active + $mx.monitor.get.active)
  if ((%active > 0) && (!$timer(mx_monitor))) {
    mx.monitor.watch
    mx.monitor.refresh
    return
  }
  if (%active == 0) {
    .timermx_monitor off
    mx.monitor.clear.active
    mx.monitor.clearview
    mx.speed.stop
    set %mx.monitor.totalspeed 0 KB/s
    set %mx.monitor.msg Sends: 0 - Receives: 0 - Speed: 0 KB/s
    mx.monitor.title
  }
}

alias mx.monitor.clear.active {
  unset %mx.adcc.*
  unset %mx.monitor.msg
  unset %mx.monitor.totalspeed
}

alias mx.monitor.clearview {
  if (!$dialog(mx.monitor)) return
  mx.main.dcx.call xdid -r mx.monitor 11
}

alias mx.monitor.bytes return $mx.bytes($1,1)
alias mx.monitor.speed return $mx.speed($1,1)

alias mx.sendclock.var return $+($chr(37),mx.sendclock.,$1,.start)
alias mx.sendclock.get return $($mx.sendclock.var($1),2)
alias mx.sendclock.set { set $mx.sendclock.var($1) $2 }

alias -l mx.monitor.elapsed {
  var %sid = $1
  var %start = $mx.sendclock.get(%sid)
  if ((!$isnum(%start)) || (%start <= 0) || (%start > $ctime) || ($calc($ctime - %start) > 604800)) {
    mx.sendclock.set %sid $ctime
    %start = $ctime
  }
  var %secs = $calc($ctime - %start)
  if ((!$isnum(%secs)) || (%secs < 0)) %secs = 0
  return $mx.fmt.time(%secs)
}

alias mx.monitor.refresh {
  if (!$dialog(mx.monitor)) { .timermx_monitor off | return }
  var %sendwindows = $send(0), %getwindows = $get(0)
  var %sends = $mx.monitor.send.active, %receives = $mx.monitor.get.active
  var %active = $calc(%sends + %receives)
  var %sendcps = 0, %getcps = 0
  if (%active <= 0) {
    .timermx_monitor off
    mx.monitor.clear.active
    mx.monitor.clearview
    set %mx.cps 0
    unset %mx.sendclock.*
    set %mx.monitor.totalspeed 0 KB/s
    set %mx.monitor.msg Sends: 0 - Receives: 0 - Speed: 0 KB/s
    mx.monitor.title
    return
  }
  mx.monitor.clearview
  var %i = 1, %position = 1
  while (%i <= %sendwindows) {
    var %status = $lower($send(%i).status)
    if (($send(%i).done == $true) || ($istok(sent failed,%status,32))) { inc %i | continue }
    var %nick = $send(%i)
    var %file = $send(%i).file
    var %size = $send(%i).size
    var %sent = $send(%i).sent
    if (%sent == $null) var %sent = $send(%i).pos
    var %cps = $send(%i).cps
    var %cid = $send(%i).cid
    var %net = $iif(%cid,$scid(%cid).network,-)
    var %pct = 0%
    if (%nick == $null) var %nick = -
    if (%file == $null) var %file = -
    if (%size == $null) var %size = 0
    if (%sent == $null) var %sent = 0
    if (%cps == $null) var %cps = 0
    if (%net == $null) var %net = -
    if (%size > 0) var %pct = $int($calc(%sent * 100 / %size)) $+ %
    var %secs = $send(%i).secs
    if (%secs !isnum) %secs = 0
    var %elapsed = $mx.fmt.time(%secs)
    mx.monitor.transfer.add $+(up,$chr(29),%position,$chr(29),%nick,$chr(29),%net,$chr(29),$nopath(%file),$chr(29),$mx.monitor.bytes(%size),$chr(29),$mx.monitor.speed(%cps),$chr(29),%pct,$chr(29),%elapsed)
    inc %sendcps %cps
    inc %position
    inc %i
  }
  %i = 1
  while (%i <= %getwindows) {
    var %status = $lower($get(%i).status)
    if (($get(%i).done == $true) || ($istok(received failed,%status,32))) { inc %i | continue }
    var %nick = $get(%i)
    var %file = $get(%i).file
    var %size = $get(%i).size
    var %got = $get(%i).rcvd
    var %cps = $get(%i).cps
    var %cid = $get(%i).cid
    var %net = $iif(%cid,$scid(%cid).network,-)
    var %pct = 0%
    if (%nick == $null) var %nick = -
    if (%file == $null) var %file = -
    if (%size == $null) var %size = 0
    if (%got == $null) var %got = $iif($isfile(%file),$file(%file).size,0)
    if (%cps == $null) var %cps = 0
    if (%net == $null) var %net = -
    if (%size > 0) var %pct = $int($calc(%got * 100 / %size)) $+ %
    var %sid = $crc($+(R,|,%cid,|,%nick,|,%file,|,%size),0)
    var %elapsed = $mx.monitor.elapsed(%sid)
    mx.monitor.transfer.add $+(down,$chr(29),%position,$chr(29),%nick,$chr(29),%net,$chr(29),$nopath(%file),$chr(29),$mx.monitor.bytes(%size),$chr(29),$mx.monitor.speed(%cps),$chr(29),%pct,$chr(29),%elapsed)
    inc %getcps %cps
    inc %position
    inc %i
  }
  set %mx.cps %sendcps
  set %mx.monitor.totalspeed $mx.monitor.speed($calc(%sendcps + %getcps))
  set %mx.monitor.msg Sends: %sends - Receives: %receives - Speed: %mx.monitor.totalspeed
  mx.monitor.title
  if (!$timer(mx_monitor)) .timermx_monitor 0 1 mx.monitor.refresh
}

on *:dialog:mx.monitor:init:*:{
  if (!$mx.monitor.dcx.init) { dialog -x mx.monitor | return }
  dmx.queue.refresh
  mx.monitor.refresh
  mx.monitor.watch
  .timermx_monitor_guard 0 1 mx.monitor.guard
}

on *:dialog:mx.monitor:close:*:{
  .timermx_monitor off
  .timermx_monitor_guard off
  mx.monitor.clear.active
  if ($mx.monitor.send.active > 0) mx.speed.start
}

on *:dialog:mx.monitor:sclick:5: dmx.queue.clear
on *:dialog:mx.monitor:sclick:6: dialog -x mx.monitor

alias mx.start {
  if ((%mx.start.last isnum) && ($calc($ctime - %mx.start.last) < 2)) return
  set %mx.start.last $ctime
  mx.cfg.vars.defaults
  mx.dcconf
  mx.kill.rar.clean
  mx.kill.builder.clean
  mx.bootstrap
  if (!$isfile(%mx.plexe)) {
    mx.dlist %mx.c1 List builders unavailable: %mx.c2 %mx.plexe %mx.nc
  }
  if (!$isfile(%mx.finder.dll)) {
    mx.dlist %mx.c1 Files lookup, @find and @locator unavailable: %mx.c2 %mx.finder.dll %mx.nc
  }
  if (!$isfile(%mx.dll)) {
    mx.dlist %mx.c1 Folder lookup unavailable: %mx.c2 %mx.dll %mx.nc
  }
  if (!$isfile(%mx.winrar)) {
    mx.dlist %mx.c1 Complete compression unavailable: %mx.c2 %mx.winrar %mx.nc
  }
  if (!$isfile(%mx.winrarui)) {
    mx.dlist %mx.c1 Folder compression unavailable: %mx.c2 %mx.winrarui %mx.nc
  }
  if (!$isfile(%mx.rarworker)) {
    mx.dlist %mx.c1 Folder compression worker unavailable: %mx.c2 %mx.rarworker %mx.nc
  }
  mx.apply.runtime
  if ((%mx.debug == 1) && (%mx.wdebug == 2) && (!$window(@mx.debug.win))) mx.debug.win.open start
  if ((%mx.adcc == 1) && (!$window(@mx.dcc.win))) mx.dcc.win.open start
  .timermx_finder_preload -m 1 500 mx.files.index.preload
  if ((%mx.enabled == 1) && ($isfile(%mx.files.lookup.queue)) && ($read(%mx.files.lookup.queue,n,1))) {
    .timermxfileslookup -m 1 100 mx.files.lookup.process
  }
  if ((%mx.enabled == 1) && ($isfile(%mx.find.request.queue)) && ($read(%mx.find.request.queue,n,1))) {
    .timermxfindrequest -m 1 100 mx.find.request.process
  }
  echo -s $mx.logo $+ %mx.c1 $+ Files & Folders Sharing: $+ %mx.c2 $iif(%mx.enabled == 1,ON,OFF) $+ $chr(3) $+ %mx.c3  / %mx.c1 $+ Trigger: $+ $chr(3) $+ %mx.c2 $iif(%mx.trigger,%mx.trigger,Not defined) %mx.nc
  if (%mx.update.enabled == 1) {
    .timerMXUPDATEFIRST -io 1 10 mx.update.check auto
    .timerMXUPDATEAUTO -io 0 %mx.update.interval mx.update.check auto
  }
}

alias mx.watchdog.tick {
  if (%mx.enabled != 1) return
  var %hasq = $iif(($isfile(%mx.queue)) && ($lines(%mx.queue) > 0),1,0)
  if (%mx.busy != 1) {
    .timerMXRAR off
    if (%mx.queue.lockts != $null) {
      if ($calc($ctime - %mx.queue.lockts) > 180) {
        mx.dbg %mx.c1 Watchdog released stale queue lock after: %mx.c2 $calc($ctime - %mx.queue.lockts) %mx.c1 second(s) %mx.nc
        unset %mx.queue.lock
        unset %mx.queue.lockts
      }
    }
    if (%hasq) {
      if ($timer(MXRARQ).state != on) {
        dmx.queue.start
      }
    }
    else .timerMXRARQ off
    return
  }
  if (%mx.current.start == $null) {
    mx.dbg %mx.c1 Watchdog detected busy state without start time, forcing recovery %mx.nc
    set %mx.current.error watchdog_no_start
    mx.cleanup.fail
    mx.cleanup
    if (%hasq) dmx.queue.start.now
    return
  }
  if ($timer(MXRAR).state != on) {
    .timerMXRAR -o 0 1 mx.rar.poll
  }
  var %run = %mx.current.running
  var %ini = %mx.current.status
  var %rar = %mx.current.rarfile
  if ((%run != $null) && ($isfile(%run))) {
    return
  }
  if ((%ini != $null) && ($isfile(%ini))) return
  if ((%rar != $null) && ($isfile(%rar))) return
  var %age = $calc($ctime - %mx.current.start)
  if (%age < 15) return
  mx.dbg %mx.c1 Watchdog timeout before process artifacts appeared after: %mx.c2 %age %mx.c1 second(s) %mx.nc
  set %mx.current.error watchdog_no_artifact
  mx.cleanup.fail
  mx.cleanup
  if (%hasq) dmx.queue.start.now
}

alias mx.apply.runtime {
  mx.cfg.vars.defaults
  if (%mx.maxsend !isnum) set %mx.maxsend 3
  if (%mx.maxsend < 1) set %mx.maxsend 1
  if (%mx.maxsend > 100) set %mx.maxsend 100
  if (%mx.maxrequest !isnum) set %mx.maxrequest 3
  if (%mx.maxrequest < 1) set %mx.maxrequest 1
  if (%mx.maxrequest > 200) set %mx.maxrequest 200
  if (%mx.maxpernick !isnum) set %mx.maxpernick 1
  if (%mx.maxpernick < 1) set %mx.maxpernick 1
  if (%mx.maxpernick > 5) set %mx.maxpernick 5
  if (%mx.maxfind !isnum) set %mx.maxfind 3
  if (%mx.maxfind < 1) set %mx.maxfind 3
  if (%mx.maxfind > 8) set %mx.maxfind 3
  if (%mx.sendinterval !isnum) set %mx.sendinterval 4
  if (%mx.sendinterval < 3) set %mx.sendinterval 3
  if (%mx.sendinterval > 60) set %mx.sendinterval 60
  if (%mx.adstime !isnum) set %mx.adstime 300
  if (%mx.adstime < 300) set %mx.adstime 300
  if (%mx.adstime > 3600) set %mx.adstime 3600
  if (%mx.out.delay !isnum) set %mx.out.delay 7000
  if (%mx.out.delay < 5000) set %mx.out.delay 5000
  if (%mx.out.delay > 30000) set %mx.out.delay 30000
  if (%mx.find.out.delay !isnum) set %mx.find.out.delay 1000
  if (%mx.find.out.delay < 500) set %mx.find.out.delay 500
  if (%mx.find.out.delay > 5000) set %mx.find.out.delay 5000
  if (%mx.rartimeout !isnum) set %mx.rartimeout 300
  if (%mx.rartimeout < 300) set %mx.rartimeout 300
  if (%mx.rartimeout > 1200) set %mx.rartimeout 1200
  if (%mx.idle.sleep !isnum) set %mx.idle.sleep 5
  if (%mx.idle.sleep < 5) set %mx.idle.sleep 5
  if (%mx.idle.sleep > 30) set %mx.idle.sleep 30
  set %mx.idle $iif(%mx.idle.sleep > 0,1,0)
  if (%mx.wd !isnum) set %mx.wd 30
  if (%mx.wd < 10) set %mx.wd 10
  if (%mx.compress !isnum 0-1) set %mx.compress 1
  if (%mx.enabled != 1) {
    .timerMXRARQ off
    .timermxads off
    .timerMXRAR off
    .timerMXWATCH off
    .timerMXIDLE off
    set %mx.sleeping 0
    mx.compress.close
    if (%mx.busy != 1) { unset %mx.queue.lock | unset %mx.queue.lockts }
    return
  }
  if (%mx.idle == 1) {
    if (%mx.last.activity !isnum) set %mx.last.activity $ctime
    .timerMXIDLE -o 0 5 mx.idle.check
  }
  else {
    .timerMXIDLE off
    set %mx.sleeping 0
    mx.title.refresh
    if (%mx.last.activity !isnum) set %mx.last.activity $ctime
  }
  if (%mx.compress != 1) mx.compress.close
  if ((%mx.ads == 1) && (%mx.chansadv)) mx.start.adx
  else .timermxads off
  if (%mx.sleeping == 1) {
    .timerMXRARQ off
    .timerMXRAR off
    .timerMXWATCH off
    if ((%mx.ads == 1) && (%mx.chansadv) && (!$timer(mxads))) mx.start.adx
    if (!$timer(mxout)) mx.out.start
    return
  }
  mx.out.start
  if ($isfile(%mx.queue) && ($lines(%mx.queue) > 0)) dmx.queue.start
  else .timerMXRARQ off
  if (%mx.busy == 1) {
    if ($timer(MXRAR).state != on) .timerMXRAR -o 0 1 mx.rar.poll
  }
  else .timerMXRAR off
  .timerMXWATCH -o 0 %mx.wd mx.watchdog.tick
}

alias mx.rar.start2 {
  if ((%mx.enabled != 1) || (%mx.busy == 1)) {
    mx.dbg %mx.c1 System unavailable %mx.nc
    return
  }
  mx.idle.touch
  var %params = $1-
  var %nick = $gettok(%params,1,29)
  var %net = $gettok(%params,2,29)
  var %mode = $lower($strip($gettok(%params,3,29)))
  var %rarname
  var %path
  if ($istok(normal silent ctcp,%mode,32)) {
    %rarname = $gettok(%params,4,29)
    %path = $gettok(%params,5-,29)
  }
  else {
    %mode = normal
    %rarname = $gettok(%params,3,29)
    %path = $gettok(%params,4-,29)
  }
  %rarname = $strip(%rarname)
  while ($left(%rarname,1) == $chr(32)) {
    %rarname = $mid(%rarname,2)
  }
  while ($right(%rarname,1) == $chr(32)) {
    %rarname = $left(%rarname,-1)
  }
  if ((!%nick) || (!%net) || (!%rarname)) return
  if (!%path) {
    mx.cleanup
    return
  }
  %path = $mx.path.norm(%path)
  if (!$isdir(%path)) {
    var %cid1 = $mx.net2cid(%net)
    if (%cid1) scid %cid1
    if (%mode != ctcp) {
      mx.out.send notice %cid1 %nick %mx.c2 Error: %mx.c1 $+ Folder not found: $+ %mx.c2 $+ %path %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.cleanup
    return
  }
  if ($right($lower(%rarname),4) != .rar) {
    %rarname = %rarname $+ .rar
  }
  %rarname = $replace(%rarname,\,_,/,_,:,_,*,_,?,_,<,_,>,_,|,_)
  set %mx.busy 1
  set %mx.state Compressing
  mx.title.refresh
  mx.stats.jobstart
  set %mx.current.nick %nick
  set %mx.current.net %net
  set %mx.current.mode %mode
  set %mx.current.rarname %rarname
  set %mx.current.payload %path
  set %mx.current.source %path
  set %mx.current.start $ctime
  set %mx.current.stage Running
  set %mx.current.progress 0
  set %mx.current.sourcesize 0
  var %rar = %mx.workdir $+ %rarname
  var %run = %mx.workdir $+ mxrar.running
  var %ini = %mx.workdir $+ mxrar.ini
  var %wlog = %mx.workdir $+ mxrar.log
  var %cancel = %mx.workdir $+ mxrar.cancel
  var %worker = %mx.rarworker
  if ($isfile(%rar)) {
    var %existingRar = %rar
    var %jobdir = $+(%mx.workdir,mxjob_,$ctime,_,$ticks)
    .mkdir $qt(%jobdir)
    if (!$isdir(%jobdir)) {
      if (%mx.wdebug == 2) {
        mx.dbg %mx.c2 Error: %mx.c1 Unable to create isolated RAR directory: $+ %mx.c2 %jobdir %mx.nc
      }
      var %cidJ = $mx.net2cid(%mx.current.net)
      if (%cidJ) {
        scid %cidJ
        if (%mx.current.mode != ctcp) {
          mx.out.send notice %cidJ %mx.current.nick %mx.c2 Error: %mx.c1 $+ Unable to prepare the temporary RAR directory. Please try again. %mx.c3 $+ %mx.cr $+ $mx.logo
        }
      }
      set %mx.current.error jobdir_failed
      mx.cleanup.fail
      mx.cleanup
      return
    }
    set %mx.current.jobdir %jobdir
    %rar = $+(%jobdir,\,%rarname)
    if (%mx.wdebug == 2) {
      mx.dbg %mx.c1 RAR already pending or sending. An isolated directory was created. Existing: $+ %mx.c2 %existingRar %mx.c1 New: $+ %mx.c2 %rar %mx.nc
    }
  }
  set %mx.current.rarfile %rar
  set %mx.current.dest %rar
  set %mx.current.running %run
  set %mx.current.status %ini
  set %mx.current.mxlog %wlog
  set %mx.current.cancel %cancel
  if ($isfile(%rar)) .remove $qt(%rar)
  if ($isfile(%run)) .remove $qt(%run)
  if ($isfile(%ini)) .remove $qt(%ini)
  if ($isfile(%wlog)) .remove $qt(%wlog)
  if ($isfile(%cancel)) .remove $qt(%cancel)
  if ($isfile(%rar) || $isfile(%run) || $isfile(%cancel)) {
    var %cidL2 = $mx.net2cid(%mx.current.net)
    if (%cidL2) scid %cidL2
    if (%mx.current.mode != ctcp) {
      mx.out.send notice %cidL2 %mx.current.nick %mx.c2 Error: %mx.c1 $+ output file is locked. Try again later %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    set %mx.current.error output_locked
    mx.cleanup.fail
    mx.cleanup
    return
  }
  if (!$isfile(%mx.winrarui)) {
    var %cidWR = $mx.net2cid(%mx.current.net)
    mx.dlist %mx.c2 Error: %mx.c1 WinRAR GUI missing: %mx.c2 %mx.winrarui %mx.nc
    if (%cidWR) {
      scid %cidWR
      if (%mx.current.mode != ctcp) {
        mx.out.send notice %cidWR %mx.current.nick %mx.c2 Error: %mx.c1 Folder compression service is unavailable. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
      }
    }
    set %mx.current.error winrar_missing
    mx.cleanup.fail
    mx.cleanup
    return
  }
  if (!$isfile(%worker)) {
    var %cidW = $mx.net2cid(%mx.current.net)
    mx.dlist %mx.c2 Error: %mx.c1 RAR worker missing: %mx.c2 %worker %mx.nc
    if (%cidW) {
      scid %cidW
      if (%mx.current.mode != ctcp) {
        mx.out.send notice %cidW %mx.current.nick %mx.c2 Error: %mx.c1 Folder compression worker is unavailable. Please try again later. %mx.c3 $+ %mx.cr $+ $mx.logo
      }
    }
    set %mx.current.error worker_missing
    mx.cleanup.fail
    mx.cleanup
    return
  }
  if (!$findfile(%path,*,1,1)) {
    var %cid = $mx.net2cid(%mx.current.net)
    if (%cid) scid %cid
    if (%mx.current.mode != ctcp) {
      mx.out.send notice %cid %mx.current.nick %mx.c2 Error: %mx.c1 $+ Folder is empty. Nothing to compress. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    set %mx.current.error folder_empty
    mx.cleanup.fail
    mx.cleanup
    return
  }
  var %p1 = /source= $+ $qt(%path)
  var %p2 = /dest= $+ $qt(%rar)
  var %p3 = /winrar= $+ $qt(%mx.winrarui)
  var %p4 = /running= $+ $qt(%run)
  var %p5 = /status= $+ $qt(%ini)
  var %p6 = /log= $+ $qt(%wlog)
  var %p7 = /cancel= $+ $qt(%cancel)
  .run -n $qt(%worker) %p1 %p2 %p3 %p4 %p5 %p6 %p7 /timeout= $+ %mx.rartimeout /retries=2
  .timerMXRAR 0 1 mx.rar.poll
  if (%mx.compress == 1) {
    mx.compress.open
  }
}

alias -l mx.rar.status.get {
  var %file = $noqt($1)
  var %key = $2
  if ((!%file) || (!%key) || (!$isfile(%file))) return
  var %line = $read(%file,nw,$+(%key,=*))
  if (!%line) return
  return $gettok(%line,2-,61)
}

alias mx.rar.poll {
  if (%mx.busy != 1) {
    .timerMXRAR off
    return
  }
  var %run = %mx.current.running
  var %ini = %mx.current.status
  var %log = %mx.current.mxlog
  var %rar = %mx.current.rarfile
  var %st = $null
  var %isz = 0
  var %itim = 0
  var %mode = $lower(%mx.current.mode)
  if (!$istok(normal silent ctcp,%mode,32)) var %mode = normal
  if ((%ini != $null) && ($isfile(%ini))) {
    %st = $lower($mx.rar.status.get($qt(%ini),status))
    %isz = $mx.rar.status.get($qt(%ini),size)
    %itim = $mx.rar.status.get($qt(%ini),time)
    var %progress = $mx.rar.status.get($qt(%ini),progress)
    var %totalbytes = $mx.rar.status.get($qt(%ini),totalbytes)
    if (%isz !isnum) %isz = 0
    if (%itim !isnum) %itim = 0
    if ((%progress isnum) && (%progress >= 0) && (%progress <= 100)) {
      set %mx.current.progress $int(%progress)
    }
    if ((%totalbytes isnum) && (%totalbytes >= 0)) {
      set %mx.current.sourcesize %totalbytes
    }
  }
  if (%mx.state == $null) set %mx.state Compressing
  if ($isfile(%run)) {
    if (%mx.current.timeout.requested == 1) {
      set %mx.current.stage Cancelling
    }
    else {
      set %mx.current.stage Running
    }
  }
  elseif (%st == done) set %mx.current.stage Completed
  elseif (%st == timeout) set %mx.current.stage Timeout
  elseif (%st == cancelled) set %mx.current.stage Cancelled
  elseif (%st == error) set %mx.current.stage Error
  if (!$isfile(%run) && !$isfile(%ini) && !$isfile(%log) && !$isfile(%rar)) {
    if ($calc($ctime - %mx.current.start) >= 10) {
      .timerMXRAR off
      var %cidX = $mx.net2cid(%mx.current.net)
      if (%cidX) scid %cidX
      set %mx.state Stop
      set %mx.current.stage Error
      if (%mode != ctcp) mx.out.now notice %cidX %mx.current.nick %mx.c2 Error: %mx.c1 $+ Compression failed. Please try again. %mx.c3 $+ %mx.cr $+ $mx.logo
      set %mx.current.error mxrar_no_start
      mx.cleanup.fail
      mx.cleanup
      return
    }
    return
  }
  if ($isfile(%run)) {
    if ($calc($ctime - %mx.current.start) >= %mx.rartimeout) {
      if (%mx.current.timeout.requested != 1) {
        set %mx.current.timeout.requested 1
        set %mx.current.error timeout_hard
        set %mx.state Stop
        set %mx.current.stage Cancelling

        if ((%mx.current.cancel != $null) && (!$isfile(%mx.current.cancel))) {
          .write -c $qt(%mx.current.cancel) cancel
        }
        if (!$isfile(%mx.current.cancel)) {
          mx.dbg %mx.c2 Error: %mx.c1 Unable to create the worker cancellation marker. %mx.nc
        }
        else {
          mx.dbg %mx.c1 Compression timeout reached. Waiting for mxrar.exe to stop. %mx.nc
        }
      }
      return
    }
    return
  }
  if ((%st == done) && ($isfile(%rar))) {
    .timerMXRAR off
    set %mx.current.progress 100
    var %cid = $mx.net2cid(%mx.current.net)
    if (!%cid) {
      set %mx.current.error net_not_connected
      set %mx.state Stop
      set %mx.current.stage Error
      mx.cleanup
      return
    }
    scid %cid
    if (%isz <= 0) %isz = $file(%rar).size
    if (%itim <= 0) %itim = $calc($ctime - %mx.current.start)
    if (%mode != ctcp) mx.out.send notice %cid %mx.current.nick %mx.c1 Compression completed: $+ %mx.c2 %mx.current.rarname %mx.c3 $+ %mx.cr $+ %mx.c1 Size: $+ %mx.c2 $mx.bytes(%isz) %mx.c3 $+ %mx.cr $+ %mx.c1 Processing time: $+ %mx.c2 $mx.fmt.time(%itim) %mx.c3 $+ %mx.cr $+ $mx.logo
    mx.stats.compdone
    mx.del.add %rar
    mx.sent.add %mx.current.nick %mx.current.net %rar
    set %mx.state Stop
    set %mx.current.stage Completed
    mx.dbg %mx.c1 Sending folder: $+ %mx.c2 %rar %mx.nc
    dcc send %mx.current.nick %rar
    mx.stats.folder.sent
    mx.speed.start
    mx.cleanup
    if ((%mx.enabled == 1) && (%mx.sleeping != 1) && ($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) dmx.queue.start
    else .timerMXRARQ off
    return
  }
  if (%st == timeout) {
    .timerMXRAR off
    var %cid2 = $mx.net2cid(%mx.current.net)
    if (%cid2) scid %cid2
    set %mx.state Stop
    set %mx.current.stage Timeout
    if (%mode != ctcp) mx.out.send notice %cid2 %mx.current.nick %mx.c2 Error: %mx.c1 $+ Compression timeout exceeded $+ %mx.c2 %mx.rartimeout $+ %mx.c1 seconds. Try again later. $+ %mx.c3 %mx.cr $+ $mx.logo
    set %mx.current.error timeout
    mx.cleanup.fail
    mx.cleanup
    return
  }
  if (%st == cancelled) {
    .timerMXRAR off
    var %cid3 = $mx.net2cid(%mx.current.net)
    if (%cid3) scid %cid3
    set %mx.state Stop
    if (%mx.current.timeout.requested == 1) {
      set %mx.current.stage Timeout
      set %mx.current.error timeout_hard
      if (%mode != ctcp) mx.out.send notice %cid3 %mx.current.nick %mx.c2 Error: %mx.c1 $+ Compression timeout exceeded $+ %mx.c2 %mx.rartimeout $+ %mx.c1 seconds. Try again later. $+ %mx.c3 %mx.cr $+ $mx.logo
    }
    else {
      set %mx.current.stage Cancelled
      set %mx.current.error cancelled
      if (%mode != ctcp) mx.out.send notice %cid3 %mx.current.nick %mx.c2 Error: %mx.c1 $+ Compression cancelled. Please try again. %mx.c3 $+ %mx.cr $+ $mx.logo
    }
    mx.cleanup.fail
    mx.cleanup
    return
  }
  if ((%st == error) || ((%st != done) && (%st != $null) && !$isfile(%rar))) {
    .timerMXRAR off
    var %cid4 = $mx.net2cid(%mx.current.net)
    if (%cid4) scid %cid4
    set %mx.state Stop
    set %mx.current.stage Error
    if (%mode != ctcp) mx.out.now notice %cid4 %mx.current.nick %mx.c2 Error: %mx.c1 $+ Compression failed. Please try again. %mx.c3 $+ %mx.cr $+ $mx.logo
    set %mx.current.error worker_error
    mx.cleanup.fail
    mx.cleanup
    return
  }
}

alias -l mx.cleanup.fail {
  if (%mx.current.error != $null) {
    var %error = $lower(%mx.current.error)
    if ((%error == admin_cancel) || (%error == admin_restart) || (%error == manual_kill) || (%error == cancelled)) {
      mx.stats.folder.cancel
    }
    else {
      mx.stats.folder.fail
    }
  }
  if (%mx.current.rarfile != $null) {
    var %rar = $mx.path.norm(%mx.current.rarfile)
    if (%rar != $null) {
      var %id = $hash(%rar,32)
      var %delayTimer = $+(MXDELWAIT.,%id)
      unset %mx.del.size. [ $+ [ %id ] ]
      unset %mx.del.stable. [ $+ [ %id ] ]
      mx.del.add $qt(%rar)
      if (!$timer(%delayTimer)) {
        mx.dbg %mx.c1 RAR cleanup scheduled in 5 seconds: $+ %mx.c2 %rar %mx.nc
        .timer $+ %delayTimer 1 5 mx.del.try $qt(%rar)
      }
    }
  }
  if (%mx.current.running != $null) {
    if ($isfile(%mx.current.running)) {
      .remove $qt(%mx.current.running)
    }
  }
  if (%mx.current.status != $null) {
    if ($isfile(%mx.current.status)) {
      .remove $qt(%mx.current.status)
    }
  }
  if (%mx.current.mxlog != $null) {
    if ($isfile(%mx.current.mxlog)) {
      .remove $qt(%mx.current.mxlog)
    }
  }
  if (%mx.current.cancel != $null) {
    if ($isfile(%mx.current.cancel)) {
      .remove $qt(%mx.current.cancel)
    }
  }
}

alias mx.cleanup {
  var %run = %mx.current.running
  var %cancel = %mx.current.cancel
  .timerMXRAR off
  .timerMXWATCH off
  set %mx.busy 0
  if (%mx.compress == 1) mx.compress.stop
  else mx.compress.close
  unset %mx.compress.lock
  unset %mx.current.*
  unset %mx.state
  if (%run) {
    if ($isfile(%run)) .remove $qt(%run)
  }
  if (%cancel) {
    if ($isfile(%cancel)) .remove $qt(%cancel)
  }
  if (%mx.queue.lock == mx.squeue) {
    unset %mx.queue.lock
    unset %mx.queue.lockts
  }
  if (%mx.enabled == 1) mx.apply.runtime
  mx.title.refresh
}

dialog mx.compress {
  title "mx.rarserver - Compression Status"
  size -1 -1 290 81
  option dbu
  box "Current Job",    123, 4 2 282 63
  text "State:",        101, 8 9 32 8
  text "-",             102, 44 9 70 8
  text "Nick:",         103, 118 9 24 8
  text "-",             104, 144 9 60 8
  text "Network:",      105, 214 9 30 8
  text "-",             106, 245 9 38 8
  text "Elapsed:",      107, 8 18 32 8
  text "-",             108, 44 18 50 8
  text "RAR size:",     109, 118 18 28 8
  text "-",             110, 144 18 60 8
  text "Stage:",        111, 214 18 22 8
  text "-",             112, 245 18 38 8
  text "Source:",       113, 8 40 28 8
  edit "",              114, 44 38 238 10, read autohs
  text "Dest:",         115, 8 53 28 8
  edit "",              116, 44 51 238 10, read autohs
  button "Cancel compression", 121, 9 67 60 11
  button "Close",              122, 250 67 29 11, ok
}

alias -l mx.compress.dcx.init {
  if (!$dialog(mx.compress)) return
  if (!$isfile($mx.main.dcx.path)) {
    mx.dlist %mx.c2 Error: %mx.c1 DCX.dll not found: %mx.c2 $mx.main.dcx.path %mx.nc
    return
  }
  unset %mx.compress.lastprogress
  mx.main.dcx.call Mark mx.compress return
  mx.main.dcx.call xdialog -c mx.compress 900 pbar $mx.main.pxw(8) $mx.main.pxh(28) $mx.main.pxw(274) $mx.main.pxh(8) smooth notheme
  mx.main.dcx.call xdid -f mx.compress 900 +c default 8 Arial
  mx.main.dcx.call xdid -r mx.compress 900 0 100
  mx.main.dcx.call xdid -c mx.compress 900 $rgb(0,120,215)
  mx.main.dcx.call xdid -k mx.compress 900 $rgb(230,230,230)
  mx.main.dcx.call xdid -q mx.compress 900 $rgb(0,0,0)
  mx.main.dcx.call xdid -j mx.compress 900 p
  var %format = $+($chr(37),d,$chr(37),$chr(37))
  mx.main.dcx.call xdid -i mx.compress 900 %format
  mx.main.dcx.call xdid -v mx.compress 900 0
}

alias -l mx.compress.progress.update {
  if (!$dialog(mx.compress)) return
  if (!$isfile($mx.main.dcx.path)) return
  var %progress = $1
  if (%progress !isnum) %progress = 0
  if (%progress < 0) %progress = 0
  if (%progress > 100) %progress = 100
  %progress = $int(%progress)
  if (%mx.compress.lastprogress == %progress) return
  set %mx.compress.lastprogress %progress
  mx.main.dcx.call xdid -q mx.compress 900 $rgb(0,0,0)
  mx.main.dcx.call xdid -v mx.compress 900 %progress
}

on *:DIALOG:mx.compress:sclick:121: {
  if (%mx.busy != 1) return
  mx.dbg %mx.c1 Manual action from compression monitor: cancel compression, terminate mxrar.exe, and resume queue. %mx.nc
  mx.kill.rar.clean resume
}

alias -l mx.compress.size.text {
  var %dst = $1-
  var %rarbytes = 0
  var %sourcebytes = $iif(%mx.current.sourcesize isnum,%mx.current.sourcesize,0)
  if ((%dst) && (%dst != -) && ($isfile(%dst))) {
    %rarbytes = $file(%dst).size
  }
  return $+($mx.bytes(%rarbytes,1),/,$mx.bytes(%sourcebytes,1))
}

alias -l mx.compress.render {
  if (!$dialog(mx.compress)) return
  did -ra mx.compress 102 $iif($1,$1,-)
  did -ra mx.compress 104 $iif($2,$2,-)
  did -ra mx.compress 106 $iif($3,$3,-)
  did -ra mx.compress 108 $iif($4,$4,-)
  did -ra mx.compress 110 $iif($5,$5,0 B)
  did -ra mx.compress 112 $iif($6,$6,-)
  did -ra mx.compress 114 $iif(%mx.current.source,%mx.current.source,-)
  did -ra mx.compress 116 $iif(%mx.current.dest,%mx.current.dest,-)
  mx.compress.progress.update $7
  if (%mx.busy == 1) {
    did -e mx.compress 121
    did -b mx.compress 122
  }
  else {
    did -b mx.compress 121
    did -e mx.compress 122
  }
}

alias mx.compress.dialog {
  if ($dialog(mx.compress)) return
  dialog -m mx.compress mx.compress
}

alias mx.compress.open {
  if (%mx.compress != 1) return
  unset %mx.compress.lock
  if (!$dialog(mx.compress)) mx.compress.dialog
  mx.compress.update
  .timerMXCOMPRESS 0 1 mx.compress.update
}

alias mx.compress.close {
  .timerMXCOMPRESS off
  unset %mx.compress.lock
  if ($dialog(mx.compress)) dialog -x mx.compress
}

alias mx.compress.stop {
  .timerMXCOMPRESS off
  unset %mx.compress.lock
  if (%mx.compress != 1) {
    mx.compress.close
    return
  }
  if (!$dialog(mx.compress)) return
  var %nick = $iif(%mx.current.nick,%mx.current.nick,-)
  var %net = $iif(%mx.current.net,%mx.current.net,-)
  var %dst = $iif(%mx.current.dest,%mx.current.dest,-)
  var %stage = $iif(%mx.current.stage,%mx.current.stage,Stopped)
  var %elapsed = -
  var %progress = $iif(%mx.current.progress isnum,%mx.current.progress,0)
  var %size = $mx.compress.size.text(%dst)
  if (%mx.current.start isnum) {
    %elapsed = $mx.fmt.time($calc($ctime - %mx.current.start))
  }
  if ($lower(%stage) == completed) {
    %progress = 100
    if ((%mx.current.sourcesize isnum) && (%mx.current.sourcesize > 0)) {
      var %totalsize = $mx.bytes(%mx.current.sourcesize,1)
      %size = $+(%totalsize,/,%totalsize)
    }
  }
  mx.compress.render Stop %nick %net %elapsed %size %stage %progress
  .timerMXCOMPRESS 1 2 mx.compress.update
}

alias mx.compress.update {
  if (%mx.compress != 1) return
  if (!$dialog(mx.compress)) return
  var %state = $iif(%mx.state,%mx.state,Idle)
  var %nick = $iif(%mx.current.nick,%mx.current.nick,-)
  var %net = $iif(%mx.current.net,%mx.current.net,-)
  var %dst = $iif(%mx.current.dest,%mx.current.dest,-)
  var %stage = $iif(%mx.current.stage,%mx.current.stage,-)
  var %elapsed = -
  var %size = $mx.compress.size.text(%dst)
  var %progress = $iif(%mx.current.progress isnum,%mx.current.progress,0)
  if (%mx.current.start isnum) {
    %elapsed = $mx.fmt.time($calc($ctime - %mx.current.start))
  }
  if ($lower(%stage) == completed) {
    %progress = 100
    if ((%mx.current.sourcesize isnum) && (%mx.current.sourcesize > 0)) {
      var %totalsize = $mx.bytes(%mx.current.sourcesize,1)
      %size = $+(%totalsize,/,%totalsize)
    }
  }
  mx.compress.render %state %nick %net %elapsed %size %stage %progress
}

on *:dialog:mx.compress:sclick:122: mx.compress.close 

on *:dialog:mx.compress:init:0: {
  mx.compress.dcx.init
  mx.compress.update
}

alias mx.idle.touch {
  if (%mx.enabled != 1) return
  set %mx.last.activity $ctime
}

alias -l mx.idle.can.sleep {
  if (%mx.enabled != 1) return 0
  if (%mx.idle != 1) return 0
  if (%mx.idle.sleep !isnum) return 0
  if (%mx.idle.sleep <= 0) return 0
  if (%mx.busy == 1) return 0
  if ($mx.build.isrunning) return 0
  if ($send(0) > 0) return 0
  if (%mx.sent.list != $null) return 0
  if (($isfile(%mx.queue)) && ($lines(%mx.queue) > 0)) return 0
  if (($isfile(%mx.inqueue)) && ($lines(%mx.inqueue) > 0)) return 0
  if (($isfile(%mx.files.lookup.queue)) && ($lines(%mx.files.lookup.queue) > 0)) return 0
  return 1
}

alias mx.idle.sleep.now {
  if (%mx.sleeping == 1) return
  if (!$mx.idle.can.sleep) return
  set %mx.sleeping 1
  .timerMXRARQ off
  .timerMXRAR off
  .timerMXWATCH off
  if ((%mx.ads == 1) && (%mx.chansadv) && (!$timer(mxads))) mx.start.adx
  if (!$timer(mxout)) mx.out.start
  mx.title.refresh
  mx.compress.close
  if (%mx.debug == 1) mx.dbg %mx.c1 Idle state active, heavy operations paused, ads remain active %mx.nc
  mx.title.refresh
}

alias mx.idle.wake {
  if (%mx.enabled != 1) return
  if (%mx.sleeping != 1) {
    mx.idle.touch
    return
  }
  set %mx.sleeping 0
  mx.idle.touch
  if (%mx.debug == 1) mx.dbg %mx.c1 Idle cleared, operations resumed %mx.nc
  mx.apply.runtime
}

alias mx.idle.check {
  if (%mx.enabled != 1) return
  if (%mx.idle != 1) return
  if (%mx.idle.sleep !isnum) return
  if (%mx.idle.sleep <= 0) return
  if (%mx.last.activity !isnum) set %mx.last.activity $ctime
  if (%mx.sleeping == 1) {
    if ($mx.build.isrunning) return
    if (!$mx.idle.can.sleep) mx.idle.wake
    return
  }
  if (!$mx.idle.can.sleep) return
  if ($calc($ctime - %mx.last.activity) >= $calc(%mx.idle.sleep * 60)) {
    mx.idle.sleep.now
  }
}

alias mx.windows.open {
  if (!$dialog(mx.windows)) dialog -m mx.windows mx.windows
  else dialog -v mx.windows mx.windows
}

alias mx.wview {
  var %mx.m = $1, %mx.seq = t,c,i,m,p, %mx.a
  if (%mx.vidx !isnum 1-5) set %mx.vidx 0
  if (%mx.vshare !isnum 1-99) set %mx.vshare 70
  if (!%mx.m) { inc %mx.vidx | if (%mx.vidx > 5) set %mx.vidx 1 | var %mx.m = $+(-,$gettok(%mx.seq,%mx.vidx,44)) }
  if (%mx.m == -t) { scon -a mx.wtile | set %mx.vidx 1 | return }
  if (%mx.m == -c) { scon -a mx.wcascade | set %mx.vidx 2 | return }
  if (%mx.m == -i) { scon -a mx.winflate | set %mx.vidx 3 | return }
  if (%mx.m == -m) { %mx.a = $active | if (%mx.a) window -x $iif(%mx.a == status window,$qt(status window),$qt(%mx.a)) | set %mx.vidx 4 | return }
  if (%mx.m == -p) { scon -a mx.wratio %mx.vshare | set %mx.vidx 5 | return }
}

alias mx.wtile {
  var %mx.i = 1, %mx.w, %mx.hide
  while ($window(*,%mx.i)) {
    %mx.w = $ifmatch
    if ($window(%mx.w).visible) {
      if ($left($lower(%mx.w),3) == @os) {
        window -h $qt(%mx.w)
        %mx.hide = $addtok(%mx.hide,%mx.w,9)
      }
    }
    inc %mx.i
  }
  mdi -t
  var %mx.i = 1
  while ($gettok(%mx.hide,%mx.i,9)) {
    window -w $qt($v1)
    inc %mx.i
  }
}

alias mx.wcascade {
  var %mx.i = 1, %mx.w, %mx.hide
  while ($window(*,%mx.i)) {
    %mx.w = $ifmatch
    if ($window(%mx.w).visible) {
      if ($left($lower(%mx.w),3) == @os) {
        window -h $qt(%mx.w)
        %mx.hide = $addtok(%mx.hide,%mx.w,9)
      }
    }
    inc %mx.i
  }
  mdi -c
  var %mx.i = 1
  while ($gettok(%mx.hide,%mx.i,9)) {
    window -w $qt($v1)
    inc %mx.i
  }
}

alias mx.winflate {
  var %mx.x = 1, %mx.w
  while ($window(*,%mx.x)) {
    %mx.w = $ifmatch
    if ($window(%mx.w).type == status) var %mx.w = $qt(%mx.w)
    if (($gettok(%mx.w,1,32) != Get) && ($gettok(%mx.w,1,32) != Send) && ($left($lower(%mx.w),3) != @os)) window -r %mx.w 0 0 $window(-3).dw $window(-3).dh
    inc %mx.x
  }
}

alias mx.wratio {
  var %mx.top = $1, %mx.dw = $window(-3).dw, %mx.dh = $window(-3).dh
  var %mx.w, %mx.i = 1, %mx.n = 0
  var %mx.w1 = @mx.debug.win, %mx.w2 = @mx.dcc.win
  var %mx.c1 = $iif($dialog(mx.windows),$did(mx.windows,123).state,1)
  var %mx.c2 = $iif($dialog(mx.windows),$did(mx.windows,124).state,0)
  if (%mx.top !isnum 1-99) var %mx.top = 70
  if (%mx.top < 10) var %mx.top = 10
  if (%mx.top > 90) var %mx.top = 90
  set %mx.vshare %mx.top
  if ((!%mx.dw) || (!%mx.dh)) return
  if ((!%mx.c1) && (!%mx.c2)) { var %mx.c1 = 1 | if ($dialog(mx.windows)) did -c mx.windows 123 }
  var %mx.botp = $calc(100 - %mx.top)
  var %mx.both = $int($calc(%mx.dh * %mx.botp / 100))
  var %mx.toph = $calc(%mx.dh - %mx.both)
  var %mx.sel = $calc(%mx.c1 + %mx.c2)
  if (%mx.sel < 1) var %mx.sel = 1
  var %mx.part = $int($calc(%mx.both / %mx.sel))
  var %mx.rem = $calc(%mx.both - (%mx.part * %mx.sel))
  var %mx.y = %mx.toph
  if (%mx.c1) {
    var %mx.h1 = %mx.part
    if (%mx.c2) inc %mx.h1 %mx.rem
    else var %mx.h1 = $calc(%mx.part + %mx.rem)
    if ($window(%mx.w1)) window -r %mx.w1 0 %mx.y %mx.dw %mx.h1
    inc %mx.y %mx.h1
  }
  if (%mx.c2) {
    var %mx.h2 = $calc(%mx.dh - %mx.y)
    if ($window(%mx.w2)) window -r %mx.w2 0 %mx.y %mx.dw %mx.h2
  }
  while ($window(*,%mx.i)) {
    %mx.w = $ifmatch
    if ($mx.wratio.ok(%mx.w,%mx.w1,%mx.w2)) window -r $qt(%mx.w) 0 0 %mx.dw %mx.toph
    inc %mx.i
  }
}

alias mx.wratio.ok {
  var %mx.w = $1, %mx.w1 = $2, %mx.w2 = $3
  if (!%mx.w) return $false
  if (!$window(%mx.w)) return $false
  if (%mx.w == %mx.w1) return $false
  if (%mx.w == %mx.w2) return $false
  if ($left(%mx.w,4) == Get ) return $false
  if ($left(%mx.w,5) == Send ) return $false
  if ($left($lower(%mx.w),3) == @os) return $false
  return $true
}

alias mx.wapply {
  if (!$dialog(mx.windows)) return
  mx.title.refresh
  var %mx.p = $did(mx.windows,121).text
  if (%mx.p !isnum 1-99) var %mx.p = 70
  if (%mx.p < 10) var %mx.p = 10
  if (%mx.p > 90) var %mx.p = 90
  if ((!$did(mx.windows,123).state) && (!$did(mx.windows,124).state)) did -c mx.windows 123
  did -ra mx.windows 121 %mx.p
  did -ra mx.windows 122 $calc(100 - %mx.p)
  set %mx.vshare %mx.p
  if ($did(mx.windows,101).state == 1) { mx.wview -t | return }
  if ($did(mx.windows,102).state == 1) { mx.wview -c | return }
  if ($did(mx.windows,103).state == 1) { scon -a mx.winflate | return }
  if ($did(mx.windows,104).state == 1) { mx.wview -m | return }
  if ($did(mx.windows,108).state == 1) { scon -a mx.wratio %mx.p | return }
}

dialog mx.windows {
  title "Win/View"
  size -1 -1 58 129
  option dbu
  box "View modes", 1, 4 2 50 48
  box "Window(s)", 3, 4 50 50 61
  radio "Tile", 101, 8 11 35 10, group
  radio "Cascade", 102, 8 20 35 10
  radio "Inflate", 103, 8 29 35 10
  radio "Maximize", 104, 8 38 35 10
  radio "Ratio layout", 108, 8 58 40 10, group
  text "Normal", 4, 9 69 18 8
  edit "", 121, 28 68 12 9, center
  text "%", 131, 41 69 7 9
  text "Debug", 5, 9 79 18 8
  edit "", 122, 28 78 12 9, read center
  text "%", 132, 41 79 7 9
  check "Script events", 123, 8 89 40 9
  check "DCC events", 124, 8 98 40 9
  button "Apply", 201, 30 114 22 11
  button "Close", 202, 6 114 22 11, cancel
}

on *:dialog:mx.windows:init:0:{
  if (%mx.vshare !isnum 1-99) set %mx.vshare 70
  if (%mx.vshare < 10) set %mx.vshare 10
  if (%mx.vshare > 90) set %mx.vshare 90
  did -u mx.windows 101,102,103,104,108
  did -c mx.windows 101
  did -ra mx.windows 121 %mx.vshare
  did -ra mx.windows 122 $calc(100 - %mx.vshare)
  did -c mx.windows 123
  did -u mx.windows 124
}

on *:dialog:mx.windows:edit:121:did -ra mx.windows 122 $iif($did(mx.windows,121).text isnum 0-100,$calc(100 - $did(mx.windows,121).text),)

on *:dialog:mx.windows:sclick:101,102,103,104,108:{
  did -u mx.windows 101,102,103,104,108
  did -c mx.windows $did
  if ($did == 108) {
    var %mx.p = $did(mx.windows,121).text
    if (%mx.p !isnum 1-99) var %mx.p = 70
    if (%mx.p < 10) var %mx.p = 10
    if (%mx.p > 90) var %mx.p = 90
    did -ra mx.windows 121 %mx.p
    did -ra mx.windows 122 $calc(100 - %mx.p)
  }
}

on *:dialog:mx.windows:sclick:123,124:if ((!$did(mx.windows,123).state) && (!$did(mx.windows,124).state)) did -c mx.windows $did
on *:dialog:mx.windows:sclick:201:mx.wapply

;==============================================================================
; MX REMOTE UPDATE
;==============================================================================

alias mx.update.button {
  if (%mx.update.running == 1) return
  if (%mx.update.available == 1) {
    if ($input(Download and install mx.rarserver v $+ %mx.update.remote.version $+ ?,yn,MX Update) != $true) return
    mx.update.download
    return
  }
  mx.update.check force
}

alias mx.update.check {
  mx.cfg.vars.defaults
  if (%mx.update.enabled != 1) return
  if (%mx.update.running == 1) return
  if (($1 == auto) && (%mx.update.lastcheck isnum) && ($calc($ctime - %mx.update.lastcheck) < %mx.update.interval)) return
  if ($sock(MX.UPDATE.VERSION)) sockclose MX.UPDATE.VERSION
  unset %mx.update.remote.*
  unset %mx.update.available
  set %mx.update.running 1
  mx.update.ui
  mx.update.status Checking for updates...
  mx.update.socket.open version %mx.update.manifest
}

alias -l mx.update.version.valid {
  if ($numtok($1,46) < 2) return 0
  var %i = 1
  while (%i <= $numtok($1,46)) {
    if ($gettok($1,%i,46) !isnum 0-) return 0
    inc %i
  }
  return 1
}

; Returns 1 when the first version is newer, -1 when older, and 0 when equal.
alias -l mx.update.version.compare {
  if ((!$mx.update.version.valid($1)) || (!$mx.update.version.valid($2))) return 0
  var %n = $max($numtok($1,46),$numtok($2,46)), %i = 1
  while (%i <= %n) {
    var %a = $gettok($1,%i,46), %b = $gettok($2,%i,46)
    if (%a !isnum) var %a = 0
    if (%b !isnum) var %b = 0
    if (%a > %b) return 1
    if (%a < %b) return -1
    inc %i
  }
  return 0
}

alias -l mx.update.socket.open {
  var %kind = $lower($1), %url = $2-
  if (!$istok(version download,%kind,32)) {
    mx.update.fail Invalid update socket type.
    return
  }
  if (https://raw.githubusercontent.com/mxbiteck/mxrarserver/* !iswmcs %url) {
    mx.update.fail Update URL is outside the allowed repository.
    return
  }
  var %path = $remove(%url,https://raw.githubusercontent.com)
  if ($left(%path,1) != /) {
    mx.update.fail Invalid update URL.
    return
  }
  if (%kind == version) {
    set %mx.update.version.path %path
    sockopen -46e MX.UPDATE.VERSION raw.githubusercontent.com 443
    set %mx.update.timeout.socket MX.UPDATE.VERSION
    .timerMXUPDATETIMEOUT 1 30 mx.update.timeout MX.UPDATE.VERSION
  }
  else {
    set %mx.update.download.path %path
    sockopen -46e MX.UPDATE.DOWNLOAD raw.githubusercontent.com 443
    set %mx.update.timeout.socket MX.UPDATE.DOWNLOAD
    .timerMXUPDATETIMEOUT 1 60 mx.update.timeout MX.UPDATE.DOWNLOAD
  }
}

on *:sockopen:MX.UPDATE.VERSION: mx.update.socket.connected

on *:sockopen:MX.UPDATE.DOWNLOAD: mx.update.socket.connected

alias -l mx.update.socket.connected {
  if ($sockerr) {
    mx.update.fail Unable to connect to GitHub: $sock($sockname).wsmsg
    return
  }
  var %path = $iif($sockname == MX.UPDATE.VERSION,%mx.update.version.path,%mx.update.download.path)
  sockmark $sockname requested
  sockwrite -tn $sockname GET %path HTTP/1.1
  sockwrite -tn $sockname Host: raw.githubusercontent.com
  sockwrite -tn $sockname User-Agent: mxrarserver/ $+ %mx.version
  sockwrite -tn $sockname Accept: */*
  sockwrite -tn $sockname Accept-Encoding: identity
  sockwrite -tn $sockname Connection: close
  sockwrite -tn $sockname $crlf
}

alias -l mx.update.socket.headers {
  if ($sockerr) {
    mx.update.fail Socket read error: $sock($sockname).wsmsg
    return 0
  }
  var %state = $sock($sockname).mark, %line
  if (%state == body) return 1
  if (%state == requested) {
    sockread %line
    if ($sockbr == 0) return 0
    var %code = $gettok(%line,2,32)
    if (2?? !iswm %code) {
      mx.update.fail GitHub returned HTTP status %code $+ .
      return 0
    }
    sockmark $sockname headers
    %state = headers
  }
  while (%state == headers) {
    sockread %line
    if ($sockbr == 0) return 0
    if ($len(%line) == 0) {
      sockmark $sockname body
      return 1
    }
  }
  return 0
}

on *:sockread:MX.UPDATE.VERSION:{
  if (!$mx.update.socket.headers) return
  var %line
  while ($true) {
    sockread %line
    if ($sockerr) { mx.update.fail Unable to read update manifest. | return }
    if ($sockbr == 0) break
    mx.update.manifest.line %line
  }
}

alias -l mx.update.manifest.line {
  var %line = $remove($1-,$cr,$lf)
  if ($lower($gettok(%line,1,124)) != mxrarserver) return
  set %mx.update.remote.found 1
  set %mx.update.remote.version $gettok(%line,2,124)
  set %mx.update.remote.mirc $gettok(%line,3,124)
  set %mx.update.remote.size $gettok(%line,4,124)
  set %mx.update.remote.sha256 $lower($gettok(%line,5,124))
  set %mx.update.remote.url $gettok(%line,6,124)
  set %mx.update.remote.notes $gettok(%line,7-,124)
}

on *:sockclose:MX.UPDATE.VERSION:{
  .timerMXUPDATETIMEOUT off
  if ($sock($sockname).mark == error) return
  var %line
  sockread -f %line
  if ($sockbr > 0) mx.update.manifest.line %line
  mx.update.manifest.finish
}

alias -l mx.update.manifest.finish {
  set %mx.update.running 0
  if (%mx.update.remote.found != 1) { mx.update.fail Update manifest is missing or invalid. | return }
  if (!$mx.update.version.valid(%mx.update.remote.version)) { mx.update.fail Invalid remote version. | return }
  if (%mx.update.remote.mirc !isnum 7-) { mx.update.fail Invalid minimum mIRC version. | return }
  if (%mx.update.remote.size !isnum 1-) { mx.update.fail Invalid update file size. | return }
  if (($len(%mx.update.remote.sha256) != 64) || (!$regex(%mx.update.remote.sha256,/^[0-9a-f]{64}$/i))) { mx.update.fail Invalid SHA-256 value. | return }
  if (https://raw.githubusercontent.com/mxbiteck/mxrarserver/*/mxrarserver.mrc !iswmcs %mx.update.remote.url) { mx.update.fail Invalid update file URL. | return }
  set %mx.update.lastcheck $ctime
  var %cmp = $mx.update.version.compare(%mx.update.remote.version,%mx.version)
  if (%cmp == 1) {
    if ($version < %mx.update.remote.mirc) {
      unset %mx.update.available
      mx.update.status mx.rarserver v $+ %mx.update.remote.version requires mIRC %mx.update.remote.mirc or newer.
    }
    else {
      set %mx.update.available 1
      mx.update.status New version available: mx.rarserver v $+ %mx.update.remote.version $+ .
    }
  }
  elseif (%cmp == 0) {
    unset %mx.update.available
    mx.update.status You are running the current version: mx.rarserver v $+ %mx.version $+ .
  }
  else {
    unset %mx.update.available
    mx.update.status Local version v $+ %mx.version is newer than the published version.
  }
  mx.update.ui
}

alias mx.update.download {
  if (%mx.update.running == 1) return
  if (%mx.update.available != 1) { mx.update.check force | return }
  if ($mx.update.busy) {
    mx.update.status Update blocked while compression or list building is active.
    return
  }
  set %mx.update.script $script
  set %mx.update.new $+($script,.new)
  if ($isfile(%mx.update.new)) .remove $qt(%mx.update.new)
  if ($exists(%mx.update.new)) {
    mx.update.fail Unable to remove the previous temporary update.
    return
  }
  set %mx.update.running 1
  mx.update.ui
  mx.update.status Downloading mx.rarserver v $+ %mx.update.remote.version $+ ...
  mx.update.socket.open download %mx.update.remote.url
}

on *:sockread:MX.UPDATE.DOWNLOAD:{
  if (!$mx.update.socket.headers) return
  mx.update.download.read
}

alias -l mx.update.download.read {
  while ($true) {
    sockread -f &mx.update.block
    if ($sockerr) { mx.update.fail Unable to read downloaded update. | return }
    if ($sockbr == 0) return
    bwrite $qt(%mx.update.new) -1 -1 &mx.update.block
  }
}

on *:sockclose:MX.UPDATE.DOWNLOAD:{
  .timerMXUPDATETIMEOUT off
  if ($sock($sockname).mark == error) return
  mx.update.download.read
  mx.update.download.finish
}

alias -l mx.update.download.finish {
  set %mx.update.running 0
  if (!$isfile(%mx.update.new)) { mx.update.fail Downloaded update file was not created. | return }
  if ($file(%mx.update.new).size != %mx.update.remote.size) {
    var %got = $file(%mx.update.new).size
    .remove $qt(%mx.update.new)
    mx.update.fail Update size mismatch. Expected %mx.update.remote.size bytes, received %got $+ .
    return
  }
  var %hash = $lower($sha256(%mx.update.new,2))
  if (%hash != %mx.update.remote.sha256) {
    .remove $qt(%mx.update.new)
    mx.update.fail Update SHA-256 verification failed.
    return
  }
  if (!$read(%mx.update.new,nw,*alias mx.start*)) {
    .remove $qt(%mx.update.new)
    mx.update.fail Downloaded file is not a valid mx.rarserver script.
    return
  }
  mx.update.apply
}

alias -l mx.update.busy {
  if (%mx.busy == 1) return 1
  if (%mx.complete.active == 1) return 1
  if (%mx.build.run) return 1
  if ($timer(MXRAR).state == on) return 1
  if ($timer(PLB2).state == on) return 1
  if ($timer(MXFILESBUILD).state == on) return 1
  if ($timer(MXCOMPLETE).state == on) return 1
  return 0
}

alias -l mx.update.apply {
  if ($mx.update.busy) {
    mx.update.status Update installation deferred while compression or list building is active.
    return
  }
  var %script = %mx.update.script
  var %new = %mx.update.new
  var %backup = $+(%script,.v,$replace(%mx.version,.,),.bak)
  if ((!$isfile(%script)) || (!$isfile(%new))) {
    mx.update.fail Update installation files are missing.
    return
  }
  if ($isfile(%backup)) .remove $qt(%backup)
  if ($exists(%backup)) {
    mx.update.fail Unable to replace the previous update backup.
    return
  }
  .rename $qt(%script) $qt(%backup)
  if ($isfile(%script)) {
    mx.update.fail Unable to create the update backup.
    return
  }
  .rename $qt(%new) $qt(%script)
  if ((!$isfile(%script)) || ($isfile(%new))) {
    if ($isfile(%script)) .remove $qt(%script)
    if ($isfile(%backup)) .rename $qt(%backup) $qt(%script)
    mx.update.fail Unable to activate the downloaded update. Previous version restored.
    return
  }
  if ($lower($sha256(%script,2)) != %mx.update.remote.sha256) {
    .remove $qt(%script)
    if ($isfile(%backup)) .rename $qt(%backup) $qt(%script)
    mx.update.fail Installed file verification failed. Previous version restored.
    return
  }
  set %mx.update.from %mx.version
  set %mx.update.to %mx.update.remote.version
  set %mx.version %mx.update.remote.version
  set %mx.update.reload 1
  set %mx.update.running 1
  unset %mx.update.available
  .timerMXUPDATELOADED -m 1 2500 mx.update.loaded
  .reload -rs $qt(%script)
  halt
}

alias mx.update.loaded {
  ; Only finalize a confirmed installed update
  if (%mx.update.reload != 1) return
  if (!%mx.update.from) return
  if (!%mx.update.to) return
  if (%mx.version != %mx.update.to) return
  var %from = %mx.update.from, %to = %mx.update.to
  .timerMXUPDATELOADED off
  unset %mx.update.reload
  unset %mx.update.running
  unset %mx.update.from
  unset %mx.update.to
  unset %mx.update.new
  unset %mx.update.script
  unset %mx.update.version.path
  unset %mx.update.download.path
  unset %mx.update.timeout.socket
  if (%to) set %mx.version %to
  if ($dialog(mx.rarserver)) did -ra mx.rarserver 707 mx.rarserver v $+ %mx.version $+  - Stage 2
  mx.update.ui
  mx.update.status mx.rarserver updated successfully: v $+ %from -> v $+ %to $+ .
}

alias mx.update.timeout {
  if (!$sock($1)) return
  sockmark $1 error
  sockclose $1
  mx.update.fail Update connection timed out.
}

alias -l mx.update.fail {
  .timerMXUPDATETIMEOUT off
  if ($sock(MX.UPDATE.VERSION)) {
    sockmark MX.UPDATE.VERSION error
    sockclose MX.UPDATE.VERSION
  }
  if ($sock(MX.UPDATE.DOWNLOAD)) {
    sockmark MX.UPDATE.DOWNLOAD error
    sockclose MX.UPDATE.DOWNLOAD
  }
  set %mx.update.running 0
  unset %mx.update.available
  unset %mx.update.remote.*
  unset %mx.update.version.path
  unset %mx.update.download.path
  unset %mx.update.timeout.socket
  mx.update.ui
  mx.update.status Error: $1-
}

alias -l mx.update.ui {
  if (!$dialog(mx.rarserver)) return
  if (%mx.update.running == 1) {
    did -ra mx.rarserver 178 Wait
    did -b mx.rarserver 178
    return
  }
  did -e mx.rarserver 178
  did -ra mx.rarserver 178 $iif(%mx.update.available == 1,Install,Update)
}

alias -l mx.update.status {
  echo -s $+(%mx.c3,$chr(32),$chr(91),%mx.c2,$chr(32),Update,$chr(32),%mx.c3,$chr(93),$chr(32),%mx.c1,$1-,$chr(32),%mx.nc)
  ;  echo -s $+($time(HH:nn:ss),$chr(32),$chr(62),$chr(32),[MX.UPDATE],$chr(32),$1-)
  if ($dialog(mx.rarserver)) did -ra mx.rarserver 709 $1-
  mx.dbg %mx.c2 [MX.UPDATE] %mx.c1 $+ $1- %mx.nc
}

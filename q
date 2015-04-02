MONGOD(1)                       mongodb-manual                       MONGOD(1)



NNAAMMEE
       mongod - MongoDB Server

SSYYNNOOPPSSIISS
       _m_o_n_g_o_d is the primary daemon process for the MongoDB system. It handles
       data requests, manages data format, and performs background  management
       operations.

       This  document provides a complete overview of all command line options
       for _m_o_n_g_o_d. These options are primarily useful for testing purposes. In
       common  operation,  use  the  ccoonnffiigguurraattiioonn ffiillee ooppttiioonnss to control the
       behavior of your database, which is fully  capable  of  all  operations
       described below.

OOPPTTIIOONNSS
       mmoonnggoodd

       ----hheellpp,, --hh
              Returns a basic help and usage text.

       ----vveerrssiioonn
              Returns the version of the _m_o_n_g_o_d daemon.

       ----ccoonnffiigg <<ffiilleennaammee>>,, --ff <<ffiilleennaammee>>
              Specifies a configuration file, that you can use to specify run‐
              time-configurations. While the options are equivalent and acces‐
              sible  via  the  other command line arguments, the configuration
              file is the preferred method for runtime configuration  of  mon‐
              god.  See  the  "//rreeffeerreennccee//ccoonnffiigguurraattiioonn--ooppttiioonnss"  document for
              more information about these options.

       ----vveerrbboossee,, --vv
              Increases the amount of internal reporting returned on  standard
              output  or  in  the  log file specified by _-_-_l_o_g_p_a_t_h. Use the --vv
              form to control the level of verbosity by including  the  option
              multiple times, (e.g. --vvvvvvvvvv.)

       ----qquuiieett
              Runs  the _m_o_n_g_o_d instance in a quiet mode that attempts to limit
              the amount of output. This option suppresses:

              · output from _d_a_t_a_b_a_s_e _c_o_m_m_a_n_d_s,  including  ddrroopp,  ddrrooppIInnddeexxeess,
                ddiiaaggLLooggggiinngg, vvaalliiddaattee, and cclleeaann.

              · replication activity.

              · connection accepted events.

              · connection closed events.

       ----ppoorrtt <<ppoorrtt>>
              Specifies a TCP port for the _m_o_n_g_o_d to listen for client connec‐
              tions. By default _m_o_n_g_o_d listens for connections on port 27017.

              UNIX-like systems require root privileges to use ports with num‐
              bers lower than 1024.

       ----bbiinndd__iipp <<iipp aaddddrreessss>>
              The  IP  address that the _m_o_n_g_o_d process will bind to and listen
              for connections. By default _m_o_n_g_o_d listens  for  connections  on
              the localhost (i.e. 112277..00..00..11 address.) You may attach _m_o_n_g_o_d to
              any interface; however, if  you  attach  _m_o_n_g_o_d  to  a  publicly
              accessible  interface  ensure  that  you have implemented proper
              authentication  and/or  firewall  restrictions  to  protect  the
              integrity of your database.

       ----mmaaxxCCoonnnnss <<nnuummbbeerr>>
              Specifies  the  maximum  number of simultaneous connections that
              _m_o_n_g_o_d will accept. This setting will have no effect  if  it  is
              higher  than  your operating system's configured maximum connec‐
              tion tracking threshold.

       Note   You cannot set mmaaxxCCoonnnnss to a value higher than _2_0_0_0_0.

       ----oobbjjcchheecckk
              Forces the _m_o_n_g_o_d to validate all  requests  from  clients  upon
              receipt  to  ensure  that clients never insert invalid documents
              into the database. For objects with a high degree  of  sub-docu‐
              ment nesting, _-_-_o_b_j_c_h_e_c_k can have a small impact on performance.
              You can set _-_-_n_o_o_b_j_c_h_e_c_k to disable object checking at run-time.

              Changed in version 2.4: MongoDB enables _-_-_o_b_j_c_h_e_c_k  by  default,
              to  prevent  any client from inserting malformed or invalid BSON
              into a MongoDB database.

       ----nnoooobbjjcchheecckk
              New in version 2.4.

              Disables the default document validation that  MongoDB  performs
              on all incoming BSON documents.

       ----llooggppaatthh <<ppaatthh>>
              Specify  a  path  for the log file that will hold all diagnostic
              logging information.

              Unless specified, _m_o_n_g_o_d will output all log information to  the
              standard   output.   Additionally,   unless   you  also  specify
              _-_-_l_o_g_a_p_p_e_n_d, the logfile will be overwritten  when  the  process
              restarts.

       Note   The behavior of the logging system may change in the near future
              in response to the _S_E_R_V_E_R_-_4_4_9_9 case.

       ----llooggaappppeenndd
              When specified, this option  ensures  that  _m_o_n_g_o_d  appends  new
              entries  to  the  end of the logfile rather than overwriting the
              content of the log when the process restarts.

       ----ssyysslloogg
              New in version 2.1.0.

              Sends all logging output to the host's _s_y_s_l_o_g system rather than
              to standard output or a log file as with _-_-_l_o_g_p_a_t_h.

       Warning
              You cannot use _-_-_s_y_s_l_o_g with _-_-_l_o_g_p_a_t_h.

       ----ppiiddffiilleeppaatthh <<ppaatthh>>
              Specify  a  file location to hold the "_P_I_D" or process ID of the
              _m_o_n_g_o_d process. Useful for tracking the _m_o_n_g_o_d process in combi‐
              nation with the _m_o_n_g_o_d _-_-_f_o_r_k option.

              Without  a specified _-_-_p_i_d_f_i_l_e_p_a_t_h option, mmoonnggooss creates no PID
              file.

       ----kkeeyyFFiillee <<ffiillee>>
              Specify the path to a key file to store authentication  informa‐
              tion.  This  option  is  only  useful for the connection between
              replica set members.

       See also

              "_R_e_p_l_i_c_a _S_e_t _S_e_c_u_r_i_t_y" and "//aaddmmiinniissttrraattiioonn//rreepplliiccaa--sseettss."

       ----nnoouunniixxssoocckkeett
              Disables listening on the UNIX  socket.  Unless  set  to  false,
              _m_o_n_g_o_d and mmoonnggooss provide a UNIX-socket.

       ----uunniixxSSoocckkeettPPrreeffiixx <<ppaatthh>>
              Specifies  a  path for the UNIX socket. Unless this option has a
              value, _m_o_n_g_o_d and mmoonnggooss, create a socket with  the  //ttmmpp  as  a
              prefix.

       ----ffoorrkk Enables  a  _d_a_e_m_o_n  mode for _m_o_n_g_o_d that runs the process to the
              background. This is the normal mode of operation, in  production
              and  production-like  environments, but may _n_o_t be desirable for
              testing.

       ----aauutthh Enables database authentication for users connecting from remote
              hosts.  configure  users  via the mmoonnggoo sshheellll sshheellll. If no users
              exist, the localhost interface will continue to have  access  to
              the database until the you create the first user.

              See  the  SSeeccuurriittyy  aanndd AAuutthheennttiiccaattiioonn page for more information
              regarding this functionality.

       ----ccppuu  Forces _m_o_n_g_o_d to report the percentage  of  CPU  time  in  write
              lock. _m_o_n_g_o_d generates output every four seconds. MongoDB writes
              this data to standard output or the logfile if using the llooggppaatthh
              option.

       ----ddbbppaatthh <<ppaatthh>>
              Specify  a  directory for the _m_o_n_g_o_d instance to store its data.
              Typical locations  include:  //ssrrvv//mmoonnggooddbb,  //vvaarr//lliibb//mmoonnggooddbb  or
              //oopptt//mmoonnggooddbb

              Unless specified, _m_o_n_g_o_d will look for data files in the default
              //ddaattaa//ddbb directory. (Windows systems  use  the  \\ddaattaa\\ddbb  direc‐
              tory.) If you installed using a package management system. Check
              the //eettcc//mmoonnggooddbb..ccoonnff file provided by your packages to see  the
              configuration of the ddbbppaatthh.

       ----ddiiaagglloogg <<vvaalluuee>>
              Creates  a  very verbose, _d_i_a_g_n_o_s_t_i_c _l_o_g for troubleshooting and
              recording various errors. MongoDB writes these log files in  the
              ddbbppaatthh directory in a series of files that begin with the string
              ddiiaagglloogg and end with the initiation time of the logging as a hex
              string.

              The  specified value configures the level of verbosity. Possible
              values, and their impact are as follows.

                            ┌──────┬────────────────────────────┐
                            │VVaalluuee │ SSeettttiinngg                    │
                            ├──────┼────────────────────────────┤
                            │0     │ off. No logging.           │
                            ├──────┼────────────────────────────┤
                            │1     │ Log write operations.      │
                            ├──────┼────────────────────────────┤
                            │2     │ Log read operations.       │
                            └──────┴────────────────────────────┘



                            │3     │ Log both  read  and  write │
                            │      │ operations.                │
                            ├──────┼────────────────────────────┤
                            │7     │ Log  write  and  some read │
                            │      │ operations.                │
                            └──────┴────────────────────────────┘

              You can use the mmoonnggoossnniiffff tool to replay this output for inves‐
              tigation. Given a typical diaglog file, located at //ddaattaa//ddbb//ddiiaa‐‐
              gglloogg..44ff7766aa5588cc, you might use a command in the following form  to
              read these files:

              mongosniff --source DIAGLOG /data/db/diaglog.4f76a58c

              _-_-_d_i_a_g_l_o_g is for internal use and not intended for most users.

       Warning
              Setting  the  diagnostic  level  to  00 will cause _m_o_n_g_o_d to stop
              writing data to the _d_i_a_g_n_o_s_t_i_c _l_o_g  file.  However,  the  _m_o_n_g_o_d
              instance  will  continue to keep the file open, even if it is no
              longer writing data to the file.  If you want to  rename,  move,
              or  delete  the  diagnostic  log  you must cleanly shut down the
              _m_o_n_g_o_d instance before doing so.

       ----ddiirreeccttoorryyppeerrddbb
              Alters the storage pattern of the data directory to  store  each
              database's  files  in a distinct folder. This option will create
              directories within the _-_-_d_b_p_a_t_h named for each directory.

              Use this option in conjunction with your file system and  device
              configuration  so  that  MongoDB  will store data on a number of
              distinct disk devices  to  increase  write  throughput  or  disk
              capacity.

       ----jjoouurrnnaall
              Enables operation journaling to ensure write durability and data
              consistency. _m_o_n_g_o_d enables  journaling  by  default  on  64-bit
              builds of versions after 2.0.

       ----jjoouurrnnaallOOppttiioonnss <<aarrgguummeennttss>>
              Provides functionality for testing. Not for general use, and may
              affect database integrity.

       ----jjoouurrnnaallCCoommmmiittIInntteerrvvaall <<vvaalluuee>>
              Specifies the maximum amount of time for _m_o_n_g_o_d to allow between
              journal operations. The default value is 100 milliseconds, while
              possible values range from 2 to 300 milliseconds.  Lower  values
              increase  the  durability of the journal, at the expense of disk
              performance.

              To force _m_o_n_g_o_d to commit to the journal  more  frequently,  you
              can  specify jj::ttrruuee. When a write operation with jj::ttrruuee pending,
              _m_o_n_g_o_d will reduce jjoouurrnnaallCCoommmmiittIInntteerrvvaall to a third of  the  set
              value.

       ----iippvv66 Specify  this  option  to  enable  IPv6 support. This will allow
              clients to connect to _m_o_n_g_o_d using IPv6  networks.  _m_o_n_g_o_d  dis‐
              ables IPv6 support by default in _m_o_n_g_o_d and all utilities.

       ----jjssoonnpp
              Permits  _J_S_O_N_P  access via an HTTP interface. Consider the secu‐
              rity implications of allowing this activity before enabling this
              option.

       ----nnooaauutthh
              Disable authentication. Currently the default. Exists for future
              compatibility and clarity.

       ----nnoohhttttppiinntteerrffaaccee
              Disables the HTTP interface.

       ----nnoojjoouurrnnaall
              Disables the durability journaling. By default,  _m_o_n_g_o_d  enables
              journaling in 64-bit versions after v2.0.

       ----nnoopprreeaalllloocc
              Disables  the preallocation of data files. This will shorten the
              start up time in some cases, but can cause  significant  perfor‐
              mance penalties during normal operations.

       ----nnoossccrriippttiinngg
              Disables the scripting engine.

       ----nnoottaabblleessccaann
              Forbids operations that require a table scan.

       ----nnssssiizzee <<vvaalluuee>>
              Specifies  the  default size for namespace files (i.e ..nnss). This
              option has no impact on the size of  existing  namespace  files.
              The maximum size is 2047 megabytes.

              The  default  value  is 16 megabytes; this provides for approxi‐
              mately 24,000 namespaces.  Each  collection,  as  well  as  each
              index, counts as a namespace.

       ----pprrooffiillee <<lleevveell>>
              Changes  the level of database profiling, which inserts informa‐
              tion about operation performance into output of  _m_o_n_g_o_d  or  the
              log file. The following levels are available:

                            ┌──────┬────────────────────────────┐
                            │LLeevveell │ SSeettttiinngg                    │
                            ├──────┼────────────────────────────┤
                            │0     │ Off. No profiling.         │
                            ├──────┼────────────────────────────┤
                            │1     │ On.   Only  includes  slow │
                            │      │ operations.                │
                            ├──────┼────────────────────────────┤
                            │2     │ On.  Includes  all  opera‐ │
                            │      │ tions.                     │
                            └──────┴────────────────────────────┘

              Profiling is off by default. Database profiling can impact data‐
              base performance. Enable this option only after careful  consid‐
              eration.

       ----qquuoottaa
              Enables  a maximum limit for the number data files each database
              can have. When running with _-_-_q_u_o_t_a, there are a  maximum  of  8
              data  files per database. Adjust the quota with the _-_-_q_u_o_t_a_F_i_l_e_s
              option.

       ----qquuoottaaFFiilleess <<nnuummbbeerr>>
              Modify limit on the number of  data  files  per  database.  This
              option  requires  the  _-_-_q_u_o_t_a  setting.  The  default value for
              _-_-_q_u_o_t_a_F_i_l_e_s is 8.

       ----rreesstt Enables the simple _R_E_S_T API.

       ----rreeppaaiirr
              Runs a repair routine on all databases. This  is  equivalent  to
              shutting down and running the rreeppaaiirrDDaattaabbaassee database command on
              all databases.

       Warning
              In general, if you have an intact copy of  your  data,  such  as
              would  exist  on  a  very recent backup or an intact member of a
              _r_e_p_l_i_c_a _s_e_t, ddoo nnoott use rreeppaaiirrDDaattaabbaassee or related  options  like
              ddbb..rreeppaaiirrDDaattaabbaassee(())  in  the  mmoonnggoo  shell  or  _m_o_n_g_o_d _-_-_r_e_p_a_i_r.
              Restore from an intact copy of your data.

       Note   When using _j_o_u_r_n_a_l_i_n_g, there is almost never  any  need  to  run
              rreeppaaiirrDDaattaabbaassee.  In the event of an unclean shutdown, the server
              will be able restore the data files to a pristine state automat‐
              ically.

       Changed in version 2.1.2.

       If  you  run  the repair option _a_n_d have data in a journal file, _m_o_n_g_o_d
       will refuse to start. In these cases you should  start  _m_o_n_g_o_d  without
       the  _-_-_r_e_p_a_i_r  option to allow _m_o_n_g_o_d to recover data from the journal.
       This will complete more quickly and will result in  a  more  consistent
       and complete data set.

       To  continue  the repair operation despite the journal files, shut down
       _m_o_n_g_o_d cleanly and restart with the _-_-_r_e_p_a_i_r option.

       Note   _-_-_r_e_p_a_i_r copies data from the source data files  into  new  data
              files  in  the  rreeppaaiirrppaatthh,  and then replaces the original data
              files with the repaired data files. _I_f rreeppaaiirrppaatthh is on the same
              device  as  ddbbppaatthh,  you _m_a_y interrupt a _m_o_n_g_o_d running _-_-_r_e_p_a_i_r
              without affecting the integrity of the data set.

       ----rreeppaaiirrppaatthh <<ppaatthh>>
              Specifies the root directory containing MongoDB data  files,  to
              use  for  the  _-_-_r_e_p_a_i_r  operation. Defaults to a __ttmmpp directory
              within the ddbbppaatthh.

       ----sseettPPaarraammeetteerr <<ooppttiioonnss>>
              New in version 2.4.

              Specifies an option to configure on startup.   Specify  multiple
              options  with  multiple  _-_-_s_e_t_P_a_r_a_m_e_t_e_r  options.   See  //rreeffeerr‐‐
              eennccee//ppaarraammeetteerrss for full documentation of these parameters.  The
              sseettPPaarraammeetteerr  database  command provides access to many of these
              parameters. _-_-_s_e_t_P_a_r_a_m_e_t_e_r supports the following options:

              · eennaabblleeLLooccaallhhoossttAAuutthhBByyppaassss

              · eennaabblleeTTeessttCCoommmmaannddss

              · jjoouurrnnaallCCoommmmiittIInntteerrvvaall

              · llooggLLeevveell

              · llooggUUsseerrIIddss

              · nnoottaabblleessccaann

              · qquuiieett

              · rreeppllAAppppllyyBBaattcchhSSiizzee

              · rreeppllIInnddeexxPPrreeffeettcchh

              · ssuuppppoorrttCCoommppaattiibbiilliittyyFFoorrmmPPrriivviilleeggeeDDooccuummeennttss

              · ssyynnccddeellaayy

              · ttrraacceeEExxcceeppttiioonnss

       ----sslloowwmmss <<vvaalluuee>>
              Defines the value of "slow," for the _-_-_p_r_o_f_i_l_e option. The data‐
              base logs all slow queries to the log, even when the profiler is
              not turned on. When the database profiler is on, _m_o_n_g_o_d the pro‐
              filer  writes  to the ssyysstteemm..pprrooffiillee collection. See the pprrooffiillee
              command for more information on the database profiler.

       ----ssmmaallllffiilleess
              Enables a mode where MongoDB uses a smaller default  file  size.
              Specifically,  _-_-_s_m_a_l_l_f_i_l_e_s  reduces  the  initial size for data
              files and  limits  them  to  512  megabytes.  _-_-_s_m_a_l_l_f_i_l_e_s  also
              reduces  the  size  of each _j_o_u_r_n_a_l files from 1 gigabyte to 128
              megabytes.

              Use _-_-_s_m_a_l_l_f_i_l_e_s if you have a large number  of  databases  that
              each  holds a small quantity of data. _-_-_s_m_a_l_l_f_i_l_e_s can lead your
              _m_o_n_g_o_d to create a large number of files, which may affect  per‐
              formance for larger databases.

       ----sshhuuttddoowwnn
              Used  in _c_o_n_t_r_o_l _s_c_r_i_p_t_s, the _-_-_s_h_u_t_d_o_w_n will cleanly and safely
              terminate the _m_o_n_g_o_d process. When  invoking  _m_o_n_g_o_d  with  this
              option  you  must  set the _-_-_d_b_p_a_t_h option either directly or by
              way of the ccoonnffiigguurraattiioonn ffiillee and the _-_-_c_o_n_f_i_g option.

              _-_-_s_h_u_t_d_o_w_n is only available on Linux systems.

       ----ssyynnccddeellaayy <<vvaalluuee>>
              _m_o_n_g_o_d writes data very quickly to the journal,  and  lazily  to
              the  data  files.  _-_-_s_y_n_c_d_e_l_a_y  controls  how much time can pass
              before MongoDB flushes data to the _d_a_t_a_b_a_s_e _f_i_l_e_s via  an  _f_s_y_n_c
              operation.  The  default setting is 60 seconds.  In almost every
              situation you should not set this value and use the default set‐
              ting.

              The  sseerrvveerrSSttaattuuss  command reports the background flush thread's
              status via the bbaacckkggrroouunnddFFlluusshhiinngg field.

              ssyynnccddeellaayy has no effect on the jjoouurrnnaall files or jjoouurrnnaalliinngg.

       Warning
              If you set _-_-_s_y_n_c_d_e_l_a_y to 00, MongoDB will not  sync  the  memory
              mapped  files  to disk. Do not set this value on production sys‐
              tems.

       ----ssyyssiinnffoo
              Returns diagnostic system information and then exits. The infor‐
              mation provides the page size, the number of physical pages, and
              the number of available physical pages.

       ----uuppggrraaddee
              Upgrades the on-disk data format of the files specified  by  the
              _-_-_d_b_p_a_t_h to the latest version, if needed.

              This  option  only  affects  the operation of _m_o_n_g_o_d if the data
              files are in an old format.

       Note   In most cases you should nnoott set this value, so you can exercise
              the  most  control  over  your  upgrade process. See the MongoDB
              _r_e_l_e_a_s_e _n_o_t_e_s (on the download page) for more information  about
              the upgrade process.

       ----ttrraacceeEExxcceeppttiioonnss
              For internal diagnostic use only.

   RReepplliiccaattiioonn OOppttiioonnss
       ----rreeppllSSeett <<sseettnnaammee>>
              Use  this  option  to  configure  replication with replica sets.
              Specify a setname as an argument to this  set.  All  hosts  must
              have the same set name.

       See also

              "//rreepplliiccaattiioonn,"   "//aaddmmiinniissttrraattiioonn//rreepplliiccaa--sseettss,"  and  "//rreeffeerr‐‐
              eennccee//rreepplliiccaa--ccoonnffiigguurraattiioonn"

       ----ooppllooggSSiizzee <<vvaalluuee>>
              Specifies a maximum size in megabytes for the replication opera‐
              tion  log  (e.g. _o_p_l_o_g.) By _m_o_n_g_o_d creates an _o_p_l_o_g based on the
              maximum amount of space available. For 64-bit  systems,  the  op
              log is typically 5% of available disk space.

              Once the _m_o_n_g_o_d has created the oplog for the first time, chang‐
              ing _-_-_o_p_l_o_g_S_i_z_e will not affect the size of the oplog.

       ----ffaassttssyynncc
              In the context of _r_e_p_l_i_c_a _s_e_t replication, set  this  option  if
              you  have  seeded  this  member with a snapshot of the _d_b_p_a_t_h of
              another member of the set. Otherwise the _m_o_n_g_o_d will attempt  to
              perform an initial sync, as though the member were a new member.

       Warning
              If the data is not perfectly synchronized _a_n_d _m_o_n_g_o_d starts with
              ffaassttssyynncc, then the secondary or slave will be permanently out of
              sync  with  the primary, which may cause significant consistency
              problems.

       ----rreeppllIInnddeexxPPrreeffeettcchh
              New in version 2.2.

              You must use _-_-_r_e_p_l_I_n_d_e_x_P_r_e_f_e_t_c_h in  conjunction  with  rreeppllSSeett.
              The default value is aallll and available options are:

              · nnoonnee

              · aallll

              · __iidd__oonnllyy

              By  default  _s_e_c_o_n_d_a_r_y  members  of  a _r_e_p_l_i_c_a _s_e_t will load all
              indexes related to an  operation  into  memory  before  applying
              operations  from the oplog. You can modify this behavior so that
              the secondaries will only load the __iidd index.  Specify  __iidd__oonnllyy
              or  nnoonnee  to prevent the _m_o_n_g_o_d from loading _a_n_y index into mem‐
              ory.

   MMaasstteerr--SSllaavvee RReepplliiccaattiioonn
       These options provide  access  to  conventional  master-slave  database
       replication.  While  this  functionality remains accessible in MongoDB,
       replica sets are the preferred configuration for database replication.

       ----mmaasstteerr
              Configures _m_o_n_g_o_d to run as a replication _m_a_s_t_e_r.

       ----ssllaavvee
              Configures _m_o_n_g_o_d to run as a replication _s_l_a_v_e.

       ----ssoouurrccee <<hhoosstt>><<::ppoorrtt>>
              For use with the _-_-_s_l_a_v_e option, the ----ssoouurrccee option  designates
              the server that this instance will replicate.

       ----oonnllyy <<aarrgg>>
              For  use  with  the  _-_-_s_l_a_v_e option, the ----oonnllyy option specifies
              only a single _d_a_t_a_b_a_s_e to replicate.

       ----ssllaavveeddeellaayy <<vvaalluuee>>
              For use with the _-_-_s_l_a_v_e option, the ----ssllaavveeddeellaayy option config‐
              ures a "delay" in seconds, for this slave to wait to apply oper‐
              ations from the _m_a_s_t_e_r node.

       ----aauuttoorreessyynncc
              For use with the _-_-_s_l_a_v_e option, the _-_-_a_u_t_o_r_e_s_y_n_c option  allows
              this  slave  to  automatically  resync if the local data is more
              than 10 seconds behind the master. This option may  be  problem‐
              atic  if  the  _o_p_l_o_g is too small (controlled by the _-_-_o_p_l_o_g_S_i_z_e
              option.) If the _o_p_l_o_g not large enough to store  the  difference
              in  changes  between the master's current state and the state of
              the slave, this node will forcibly resync itself  unnecessarily.
              When  you  set the If the _-_-_a_u_t_o_r_e_s_y_n_c option the slave will not
              attempt an automatic resync more  than  once  in  a  ten  minute
              period.

   SShhaarrddiinngg CClluusstteerr OOppttiioonnss
       ----ccoonnffiiggssvvrr
              Declares that this _m_o_n_g_o_d instance serves as the _c_o_n_f_i_g _d_a_t_a_b_a_s_e
              of a sharded cluster. When running  with  this  option,  clients
              will not be able to write data to any database other than ccoonnffiigg
              and aaddmmiinn. The default port for _m_o_n_g_o_d with this option is 2277001199
              and  _m_o_n_g_o_d writes all data files to the //ccoonnffiiggddbb sub-directory
              of the _-_-_d_b_p_a_t_h directory.

       ----sshhaarrddssvvrr
              Configures this _m_o_n_g_o_d instance as  a  shard  in  a  partitioned
              cluster.  The  default  port  for these instances is 2277001188.  The
              only effect of _-_-_s_h_a_r_d_s_v_r is to change the port number.

       ----nnooMMoovveePPaarraannooiiaa
              Disables a "paranoid mode" for data writes for  chunk  migration
              operation.  See  the _c_h_u_n_k _m_i_g_r_a_t_i_o_n and mmoovveeCChhuunnkk command docu‐
              mentation for more information.

              By default _m_o_n_g_o_d will save copies of  migrated  chunks  on  the
              "from" server during migrations as "paranoid mode." Setting this
              option disables this paranoia.

   SSSSLL OOppttiioonnss
       See

              //aaddmmiinniissttrraattiioonn//ssssll for full documentation of MongoDB's support.

       ----ssssllOOnnNNoorrmmaallPPoorrttss
              New in version 2.2.

       Note   The _d_e_f_a_u_l_t _d_i_s_t_r_i_b_u_t_i_o_n _o_f _M_o_n_g_o_D_B does nnoott contain support for
              SSL.  To use SSL you can either compile MongoDB with SSL support
              or use the MongoDB Subscriber Edition.  See  //aaddmmiinniissttrraattiioonn//ssssll
              for more information about SSL and MongoDB.

       Enables  SSL for _m_o_n_g_o_d. With _-_-_s_s_l_O_n_N_o_r_m_a_l_P_o_r_t_s, a _m_o_n_g_o_d requires SSL
       encryption for all connections on the default MongoDB port, or the port
       specified by _-_-_p_o_r_t. By default, _-_-_s_s_l_O_n_N_o_r_m_a_l_P_o_r_t_s is disabled.

       ----ssssllPPEEMMKKeeyyFFiillee <<ffiilleennaammee>>
              New in version 2.2.

       Note   The _d_e_f_a_u_l_t _d_i_s_t_r_i_b_u_t_i_o_n _o_f _M_o_n_g_o_D_B does nnoott contain support for
              SSL. To use SSL you can either compile MongoDB with SSL  support
              or  use  the MongoDB Subscriber Edition. See //aaddmmiinniissttrraattiioonn//ssssll
              for more information about SSL and MongoDB.

       Specifies the ..ppeemm file that contains both the SSL certificate and key.
       Specify the file name of the ..ppeemm file using relative or absolute paths

       When using _-_-_s_s_l_O_n_N_o_r_m_a_l_P_o_r_t_s, you must specify _-_-_s_s_l_P_E_M_K_e_y_F_i_l_e.

       ----ssssllPPEEMMKKeeyyPPaasssswwoorrdd <<vvaalluuee>>
              New in version 2.2.

       Note   The _d_e_f_a_u_l_t _d_i_s_t_r_i_b_u_t_i_o_n _o_f _M_o_n_g_o_D_B does nnoott contain support for
              SSL. To use SSL you can either compile MongoDB with SSL  support
              or  use  the MongoDB Subscriber Edition. See //aaddmmiinniissttrraattiioonn//ssssll
              for more information about SSL and MongoDB.

       Specifies the password  to  de-crypt  the  certificate-key  file  (i.e.
       _-_-_s_s_l_P_E_M_K_e_y_F_i_l_e).  Only  use _-_-_s_s_l_P_E_M_K_e_y_P_a_s_s_w_o_r_d if the certificate-key
       file is encrypted. In all cases, _m_o_n_g_o_d will redact the  password  from
       all logging and reporting output.

       Changed  in  version  2.4:  _-_-_s_s_l_P_E_M_K_e_y_P_a_s_s_w_o_r_d is only needed when the
       private key is encrypted. In  earlier  versions  _m_o_n_g_o_d  would  require
       _-_-_s_s_l_P_E_M_K_e_y_P_a_s_s_w_o_r_d  whenever  using  _-_-_s_s_l_O_n_N_o_r_m_a_l_P_o_r_t_s, even when the
       private key was not encrypted.

       ----ssssllCCAAFFiillee <<ffiilleennaammee>>
              New in version 2.4.

       Note   The _d_e_f_a_u_l_t _d_i_s_t_r_i_b_u_t_i_o_n _o_f _M_o_n_g_o_D_B does nnoott contain support for
              SSL.  To use SSL you can either compile MongoDB with SSL support
              or use the MongoDB Subscriber Edition.  See  //aaddmmiinniissttrraattiioonn//ssssll
              for more information about SSL and MongoDB.

       Specifies  the  ..ppeemm file that contains the root certificate chain from
       the Certificate Authority. Specify the file name of the ..ppeemm file using
       relative or absolute paths

       ----ssssllCCRRLLFFiillee <<ffiilleennaammee>>
              New in version 2.4.

       Note   The _d_e_f_a_u_l_t _d_i_s_t_r_i_b_u_t_i_o_n _o_f _M_o_n_g_o_D_B does nnoott contain support for
              SSL. To use SSL you can either compile MongoDB with SSL  support
              or  use  the MongoDB Subscriber Edition. See //aaddmmiinniissttrraattiioonn//ssssll
              for more information about SSL and MongoDB.

       Specifies the ..ppeemm file that contains the Certificate Revocation  List.
       Specify the file name of the ..ppeemm file using relative or absolute paths

       ----ssssllWWeeaakkCCeerrttiiffiiccaatteeVVaalliiddaattiioonn
              New in version 2.4.

       Note   The _d_e_f_a_u_l_t _d_i_s_t_r_i_b_u_t_i_o_n _o_f _M_o_n_g_o_D_B does nnoott contain support for
              SSL. To use SSL you can either compile MongoDB with SSL  support
              or  use  the MongoDB Subscriber Edition. See //aaddmmiinniissttrraattiioonn//ssssll
              for more information about SSL and MongoDB.

       Disables  the  requirement  for  SSL   certificate   validation,   that
       _-_-_s_s_l_C_A_F_i_l_e  enables.  With _-_-_s_s_l_W_e_a_k_C_e_r_t_i_f_i_c_a_t_e_V_a_l_i_d_a_t_i_o_n, _m_o_n_g_o_d will
       accept connections if the client does not present  a  certificate  when
       establishing the connection.

       If    the    client    presents    a   certificate   and   _m_o_n_g_o_d   has
       _-_-_s_s_l_W_e_a_k_C_e_r_t_i_f_i_c_a_t_e_V_a_l_i_d_a_t_i_o_n enabled, _m_o_n_g_o_d will validate  the  cer‐
       tificate using the root certificate chain specified by _-_-_s_s_l_C_A_F_i_l_e, and
       reject clients with invalid certificates.

       Use _-_-_s_s_l_W_e_a_k_C_e_r_t_i_f_i_c_a_t_e_V_a_l_i_d_a_t_i_o_n if you have a mixed deployment  that
       includes clients that do not or cannot present certificates to _m_o_n_g_o_d.

       ----ssssllFFIIPPSSMMooddee
              New in version 2.4.

       Note   The _d_e_f_a_u_l_t _d_i_s_t_r_i_b_u_t_i_o_n _o_f _M_o_n_g_o_D_B does nnoott contain support for
              SSL. To use SSL you can either compile MongoDB with SSL  support
              or  use  the MongoDB Subscriber Edition. See //aaddmmiinniissttrraattiioonn//ssssll
              for more information about SSL and MongoDB.

       When specified, _m_o_n_g_o_d will use the FIPS mode of the installed  OpenSSL
       library.  Your system must have a FIPS compliant OpenSSL library to use
       _-_-_s_s_l_F_I_P_S_M_o_d_e.

UUSSAAGGEE
       In common usage, the invocation of _m_o_n_g_o_d will resemble  the  following
       in the context of an initialization or control script:

       mongod --config /etc/mongodb.conf

       See  the "//rreeffeerreennccee//ccoonnffiigguurraattiioonn--ooppttiioonnss" for more information on how
       to configure _m_o_n_g_o_d using the configuration file.

AAUUTTHHOORR
       MongoDB Documentation Project

CCOOPPYYRRIIGGHHTT
       2011-2013, 10gen, Inc.




2.2.3                           March 14, 2013                       MONGOD(1)

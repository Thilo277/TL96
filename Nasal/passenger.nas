print("");
print("");
print("###################### Welome to ######################");
print("#  _______  _      ___     __                         #");
print("# |__   __|| |    / _ \   / /                         #");
print("#    | |   | |   | (_) | / /_                         #");
print("#    | |   | |    \__, || '_ \         __             #");
print("#    | |   | |____  / / | (_) |   ___ / /_ ___ _ ____ #");
print("#    |_|   |______|/_/   \___/   (_-</ __// _ `// __/ #");
print("#                               /___/\__/ \_,_//_/    #");
print("#                                                     #");
print("#######################################################");
print("");
print("                           .: :7                                                                                  ");  
print("                        :. .J! J7                                                                                 ");  
print("                        ~J^ ^J~^Y^                                                                                ");  
print("                         ^?!.~?!??.                                                                               ");  
print("                        : :7!^!!?~7.                                                                              ");  
print("                        !?^^!!77. :!.                                                                             ");  
print("                        ^!7!!?^:   .!^                 ______ __           __ __              __ _        __   __ ");  
print("                        ^77?!^:      ^7:              /_  __// /    __ __ / // /_ ____ ___ _ / /(_)___ _ / /  / /_");  
print("                        ^77!^         :!7:             / /  / /__  / // // // __// __// _ `// // // _ `// _ \/ __/");  
print("                         ~?J!           ^J            /_/  /____/  \_,_//_/ \__//_/   \_,_//_//_/ \_, //_//_/\__/ ");  
print("                        ^7JY~            !^                                                      /___/            ");  
print("                        ::~JJ.            ~7:                                                                     ");  
print("                           .~~!.           .^^~~^^^~!!:                                                           ");  
print("                              ^!                    :!7~^^^^^^^^^:::..                                            ");  
print("                               ~!.                   .^!:         ::^~~^:.                                        ");  
print("                                ^7~~:                   .             .:^^~^:..                                   ");  
print("                              .:^~!!^       ::                             .:^^^^:.                               ");  
print("                            .77^..          ~Y~~:                               .:~!!~~^::..                      ");  
print("                            ~7!!...          :7~7!!!~^^^^^^^^^^^^~!~:^:^:.:^:~~^~!?JYY55YJJ??7!~:                 ");  
print("                            ..:?J7:        ..!~.                 .::^??!J?!?7~!7JJ7?J7!7?7~~!^.:.                 ");  
print("                               ~??~^..!:.::7~~                                                                    ");  
print("                                !~^77!~7?77^                                                                      ");  
print("                                                                                                                  ");
print("");
print("##################################################################################################################");
print("########################## Having problems? Contact me via mail on: thilo2707@gmail.com ##########################");
print("##################################################################################################################");
print("##################################################### Enjoy! #####################################################");
print("##################################################################################################################");
print("####################################### Passenger/Instructor config loaded #######################################");
print("##################################################################################################################");
print("");



var callsign = "";
#var num = getprop(prop);



var main = func {
    #print("main");
    var mpnumber = getprop("ai/models/callsigns/"~callsign);
    var prop = "ai/models/multiplayer["~mpnumber~"]/";


    setprop(prop~"instrumentation/altimeter/indicated-altitude-ft", getprop(prop~"sim/multiplay/generic/float[0]"));
    setprop(prop~"instrumentation/airspeed-indicator/indicated-speed-kt", getprop(prop~"sim/multiplay/generic/float[1]"));
    setprop(prop~"instrumentation/vertical-speed-indicator/indicated-speed-fpm", getprop(prop~"sim/multiplay/generic/float[2]"));
    setprop(prop~"instrumentation/slip-skid-ball/indicated-slip-skid", getprop(prop~"sim/multiplay/generic/float[3]"));
    setprop(prop~"consumables/fuel/tank/level-gal_us", getprop(prop~"sim/multiplay/generic/float[4]"));
    setprop(prop~"aircraft/magnetos/Lmag", getprop(prop~"sim/multiplay/generic/int[0]"));
    setprop(prop~"aircraft/magnetos/Rmag", getprop(prop~"sim/multiplay/generic/int[1]"));
    setprop(prop~"aircraft/battery/switch", getprop(prop~"sim/multiplay/generic/int[2]"));
    setprop(prop~"aircraft/flydat/ison", getprop(prop~"sim/multiplay/generic/int[3]"));
    setprop(prop~"aircraft/ipad/ison", getprop(prop~"sim/multiplay/generic/int[4]"));
    setprop(prop~"aircraft/ipad/screen", getprop(prop~"sim/multiplay/generic/int[5]"));
    setprop(prop~"controls/gear/brake-parking", getprop(prop~"sim/multiplay/generic/int[6]"));
    setprop(prop~"aircraft/ipad/error", getprop(prop~"sim/multiplay/generic/int[7]"));
    setprop(prop~"controls/engines/engine/mixture", getprop(prop~"sim/multiplay/generic/float[5]"));
    setprop(prop~"controls/engines/engine/throttle", getprop(prop~"sim/multiplay/generic/float[6]"));
    setprop(prop~"controls/flight/elevator-trim", getprop(prop~"sim/multiplay/generic/float[7]"));
    setprop(prop~"controls/flight/rudder-trim", getprop(prop~"sim/multiplay/generic/float[8]"));
    setprop(prop~"engines/engine/egt-degc", getprop(prop~"sim/multiplay/generic/float[9]"));
    setprop(prop~"engines/engine/cht-degc", getprop(prop~"sim/multiplay/generic/float[10]"));
    setprop(prop~"engines/engine/oil-temperature-degc", getprop(prop~"sim/multiplay/generic/float[11]"));
    setprop(prop~"engines/engine/oil-pressure-bar01", getprop(prop~"sim/multiplay/generic/float[12]"));
    setprop(prop~"autopilot/locks/heading", getprop(prop~"sim/multiplay/generic/int[8]"));
    setprop(prop~"autopilot/locks/altitude", getprop(prop~"sim/multiplay/generic/int[9]"));





}

var start = func {

    #print("start");
    callsign = getprop('passenger/callsign');
    mainloop.start();
    view.model_view_handler.select(callsign, 1);
    setprop('sim/view[0]/config/x-offset-m', getprop('sim/view[0]/config/x-offset-m')-0.5);
}


var mainloop = maketimer(0.1, main);





    #print(getprop(prop));
    #print(prop);
    #print(getprop(propnum));
    #print(propnum);
    #print(getprop(propnum~"sim/multiplay/generic/float"));

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
print("                        ::~JJ.            ~7: ....::                                                              ");  
print("                           .~~!.           .^^~~^^^~!!:                                                           ");  
print("                              ^!                    :!7~^^^^^^^^^:::..                                            ");  
print("                               ~!.                   .^!:         ::^~~^:.                                        ");  
print("                                ^7~~:                   .             .:^^~^:..                                   ");  
print("                              .:^~!!^       ::                             .:^^^^:.                               ");  
print("                            .77^..          ~Y~~: ......        .               .:~!!~~^::..                      ");  
print("                            ~7!!...          :7~7!!!~^^^^^^^^^^^^~!~:^:^:.:^:~~^~!?JYY55YJJ??7!~:                 ");  
print("                            ..:?J7:        ..!~. ...             .::^??!J?!?7~!7JJ7?J7!7?7~~!^.:.                 ");  
print("                               ~??~^..!:.::7~~                           .      ..  ..   .                        ");  
print("                                !~^77!~7?77^                                                                      ");  
print("                                   ..  ...                                                                        ");
print("");
print("##################################################################################################################");
print("########################## Having problems? Contact me via mail on: thilo2707@gmail.com ##########################");
print("##################################################################################################################");
print("##################################################### Enjoy! #####################################################");
print("##################################################################################################################");
print("Pulling Aircraft from: ", getprop("/sim/aircraft-dir"));
print("Callsign set to: ", getprop("/sim/multiplay/callsign"));
print("##################################################################################################################");
print("");


var throttle = func {
    setprop("controls/engines/engine/throttle",0);
}

var autostart = func {
    if (getprop("consumables/fuel/tank/level-lbs") < 70){
        setprop("consumables/fuel/tank/level-lbs",70);
    }
    setprop("controls/gear/brake-parking",1);
    setprop("controls/engines/engine/throttle",1);
    setprop("controls/electric/battery-switch",1);
    setprop("aircraft/battery/switch",0);
    setprop("systems/electrical/outputs/comm[0]",10);
    setprop("aircraft/flydat/ison",1);
    setprop("controls/engines/engine/mixture",1);
    setprop("controls/engines/engine/magnetos",3);
    setprop("aircraft/magnetos/Lmag",1);
    setprop("aircraft/magnetos/Rmag",1);
    setprop("aircraft/ipad/ison",1);
    setprop("aircraft/ipad/screen",1);
    setprop("aircraft/ipad/error",0);
    setprop("controls/flight/flaps",0.33333333333);
    setprop("controls/engines/engine/starter",1);
    if (getprop("engines/engine/rpm") > 800){
        setprop("controls/engines/engine/starter",0);
    }



    if (getprop("engines/engine/rpm") < 800) settimer(autostart,0);
    settimer(throttle, 2);
}


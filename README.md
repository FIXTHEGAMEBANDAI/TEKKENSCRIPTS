For analysis purposes and exposure, downloading this will cause your Anti Virus to go off.

.exe file not included, it is not hard to find online. A virustotal scan can be found at the below link
https://www.virustotal.com/gui/file/eff86357078b33cbc3496e3e38574c4c129a9ddb65f2eda929f582d5036f2d3a/behavior

Summary of .exe functions: When run, connects to https://tekkenscript.com/api/index/getLatestVersion and downloads a 7z file
{"data":{"ver":"1.1.6.1","file_list":[{"name":"Release.7z","url":"file\/1c\/c74aadbd8de02349a58df6d2e0213b.7z"}]}}

This file contains all the scripts that can be found in the scripts folder and any missing files to make the cheats work
Does not currently appear to communicate to this link after the download is complete however I have not used it with Tekken 8 open.
Once downloaded the .exe injects the engine.dll file into T8

A virus total scan for the engine.dll can be found at the below link
https://www.virustotal.com/gui/file/98ede844f0e3e78ad9216378223b62041ce4d22c39496922d32830d567a94b9d/behavior

Many red flags in here but that is expected due to how you are trusting a random Chinese man on discord with full administrator access
to execute a random DLL file so you can lose in Tekken 8 ranked because you are shit at the game

Basic binary analysis does not indicate any obvious signs of malware.
Performing a complete reverse engineering of this would take a lot of effort on my part and I am lazy, it is all written in c++ if anyone wants to take a shot.

To be honest props to the dev the actual scripting part in .lua is very intuitive and easy to do. You should find something better in your life to do.

As of writing Feb 28 I will be running the script in a VM with a real copy of T8 to test over the weekend, may update any findings below



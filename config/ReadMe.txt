Melody's Low Latency Software (version 2.7).
Designed for Windows 10 1803, Windows 10 1809, Windows 10 1903, Windows 10 1909 and Windows 10 2004.
Only for 64-bit systems.

• What this program does is setting a temporary power plan and set the timer resolution to the lower value supported.
• The mouse button on the right allows to decrease mouse buffers and increase the accuracy of the RTC tick (required for 0.5 ms resolution to work properly)

• This program requires the Power Service to be running. The program might ask the user to enable it.
• It is not adviced to run this program in stripped / modified systems. Do it at your own risk.
• For debug information hold SHIFT, CTRL or ALT in the main window.
• Use the mouse icon in my program to set queue sizes and platform tick.
• When using my program, it is adviced to use platform tick because of the way it works.
• It is not adviced to run the program on unsupported Windows versions and I don't plan to support them anytime soon in this program.

When having problems, please post a full screen of the debug screen.
http://discord.gg/6TMHU63

Source code is in Source_x64.vb

Changes in V2.7:
• Added an option to set just Timer Resolution. You can either have Low Timer Resolution only or Low Latency Mode without Low Timer Resolution. This is useful especially for troubleshooting.
• Core Unpark removed from the program - makes trouble on Ryzen.
• Interrupt Steering rules removed from the program - makes trouble in general.
The project uses a standard USB keyboard connected to the USB input port on
the Arduino shield to control 4-voice polyphonic FM audio synthesizer, with
the audio output routed to the headphone jack on the shield board.
The USB keyboard is outfitted with a musical keyboard spanning approximately
1.5 octaves, from C to the F of the octave above, for any given octave (the
octave can be shifted up or down using the '+' and '-' keys of the keyboard).
The notes and the USB keyboard keys to which they correspond are:
Note    Key
C1   :  'A'
C#1  :  'W'
D1   :  'S'
D#1  :  'E'
E1   :  'D'
F1   :  'F'
F#1  :  'T'
G1   :  'G'
G#1  :  'Y'
A1   :  'H'
A#1  :  'U'
B1   :  'J'
C2   :  'K'
C#2  :  'O'
D2   :  'L'
D#2  :  'P'
E2   :  ';'
F2   :  '"' (the apostrophe/quote key)

The layout was chosen to mimic a standard keyboard rather than any convenient
note-to-keyboard-letter correspondence, but a decent reference point is that
the F and G keys correspond to the notes F and G, respectively, and with the
octave numbers obviously serving as a way to differentiate between, e.g.,
the C and the C an octave higher rather than actually designating the register
(the octave can be changed, after all). In addition, the bottom row of letters
above the space bar serves as a rudimentary discretized volume control,
with 'Z' corresponding to silence, the '<' corresponding to full volume, and
all keys in-between increasing the volume as you go from left to right.

Component files necessary to the functionality of the current incarnation of
the project are 'finalProject/synthesis/fiinalProject.qip', 'lab62.sv',
'onChipFIFO.qip', 'sineMemory8192.mem', 'phasor.sv', 'unsigned_mult.sv',
'unsigned_mult16.sv', 'shiftreg_N.sv', 'HexDriver.sv' and 'Lab6(3).sdc'.
It is built in the standard way; compile, program the board and open the
NIOS II tool; generate the BSP for usb_kb_bsp, build all or clean the workspace
to prepare usb_kb and run via run configurations.

Currently, because there's no interface for selecting FM inputs into the
oscillators (one of many works in progress), it sounds like a somewhat noisy
keyboard where the last few notes you played just hang around indefinitely
until you press 'Z' to shut them up, but I've demarcated a location where
you can uncomment some FM inputs (if you're actually willing to wait the 5+
minutes for the project to compile again); the TA's also heard the FM effect
during the demo, as I had hardcoded the average of the output of all oscillators
to be the FM-input for the first oscillator, resulting in weird tones and such.

Critically and disappointingly unfinished are the ADSR (the envelope that allows
the note to rise and decay and eventually shut up without having to press the
'Z' key), the user interface through which parameters can be modified without
having to recompile the entire thing (augh) and the low-pass filter at the
output; aside from that everything is pretty much as intended.

F**k this got really long

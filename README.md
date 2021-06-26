# DE10-Lite_synthesizer
## FM Synthesizer in SystemVerilog and C using fixed-point arithmetic

Source code for an FM synthesizer with hardware written in SystemVerilog and software running
on the NIOS-II embedded processor. The synthesizer uses a traditional alphanumeric USB-keyboard
arranged according to the Wicki-Hayden isomorphic keyboard layout (which seemed to lend itself
well to the use of an alphanumeric keyboard):  
https://en.wikipedia.org/wiki/Wicki%E2%80%93Hayden_note_layout  
This is a work in progress and as such certain features one might reasonably expect from a synthesizer
(e.g. an intuitive user interface, amplitude envelopes, one or more low-pass filter(s)...) are
in the process of being implemented. However, existing features include:  
<ul>
  <li> 8 playable octaves </li>
  <li> 3 waveforms: sine, sawtooth and square (triangle forthcoming imminently) </li>
  <li> 4 simultaneously playable oscillators </li>
  <li> Frequency modulation inputs for each oscillator with :
  <ul>
      <li> The ability to frequency modulate any of the 4 active voices with a linear combination\n
           of any of the active voices (including the original voice itself) </li>
      <li> Configurable weights where the strengths of the FM signals can be set </li>
  
The project also uses an Arduino Shield featuring a USB port, headphone and line-in jacks and an
SGTL5000 audio codec, and as such the project cannot (in all likelihood) be reproduced by the
average home-DE10-Lite-owner. However, it can perhaps be of use to you for academic purposes.  
  
The top-level structural coding has been done in fpgaSynth.sv. External modules which I have written
will also be .sv files, while .v and .qip files represent quartus intellectual property modules which
I have configured for use with the project. The files running on the NIOS-II embedded processor are
located in the software folder, while the bus through which the hardware and software communicate has
been implemented in Platform Designer, which can be accessed in the usual way
('Tools > Platform Designer') from within Quartus.  
  
To compile or view the Platform Designer bus, clone the repository to your local machine, open Quartus
(if you want it to compile functionally, avoid the use of Quartus 18.1, as the 2-port ROM which I've
used quite liberally to store wavetables has a glitch and seems to be unusable in this version),
navigate to 'Files > Open Project' and select 'finalProject.qpf'.  
  

    
    

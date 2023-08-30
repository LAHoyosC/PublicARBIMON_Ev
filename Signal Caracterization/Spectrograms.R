###Spectrograms. 
#Nyctidromus and Pulsatris - compare bandwidths.
#22/03/2023

library(tuneR)
library(signal)
library(oce)
library(RColorBrewer)
#deatach("package:RColorBrewer")

#Read the wavs
Nyctidromus_wav = readWave("../../Signal_description/Recordings/Nyctidromus_template_crop.wav")
Pulsatrix_wav = readWave("../../Signal_description/Recordings/Pulsatrix_template_crop.wav")

# extract signal
snd_N = Nyctidromus_wav@left
snd_P = Pulsatrix_wav@left

# determine duration
dur_N = length(snd_N)/Nyctidromus_wav@samp.rate
dur_P = length(snd_P)/Pulsatrix_wav@samp.rate


# determine sample rate
fs_N = Nyctidromus_wav@samp.rate
fs_P = Pulsatrix_wav@samp.rate


#Compute spectrograms
spec_N = specgram(x = snd_N,
                  Fs = fs_N,
                  n = 1024,
                  window = 256,
                  overlap = 128)

spec_P = specgram(x = snd_P,
                  Fs = fs_P,
                  n = 1024,
                  window = 256,
                  overlap = 128)

# discard phase information
P_N = abs(spec_N$S)
P_P = abs(spec_P$S)

# normalize
#P_N = P_N/max(P_N)
#P_P = P_P/max(P_P)

# convert to dB
P_N = 10*log10(P_N)
P_P = 10*log10(P_P)

# config time axis
t_N = spec_N$t
t_P = spec_P$t

# plot spectrogram
imagep(x = t_N,
       y = spec_N$f,
       z = t(P_N),
       col = oce.colorsViridis,
       ylab = 'Frequency [Hz]',
       xlab = 'Time [s]',
       drawPalette = T,
       decimate = F)

imagep(x = t_P,
       y = spec_P$f,
       z = t(P_P),
       col = oce.colorsViridis,
       ylab = 'Frequency [Hz]',
       xlab = 'Time [s]',
       drawPalette = T,
       decimate = F)


#Spectrograms:

png("Spectrograms.png",  
    width = 2500, height = 1080, units = "px", res = 300)

par(mfrow=c(1,2))
seewave::spectro(wave = Nyctidromus_wav, flim = c (0.2,3), 
                 scale = FALSE, 
                 norm = FALSE,
                 ovlp = 10,
                 wl = 500,
                 flab = "Frequency (kHz)",
                 cexlab = 1.5,
                 cexaxis = 1.2,
                 palette = reverse.gray.colors.1,
                 main = expression(italic("Nyctidromus albicollis")))

seewave::spectro(wave = Pulsatrix_wav, flim = c (0.2,2.5), 
                 scale = FALSE, 
                 norm = TRUE,
                 ovlp = 10,
                 wl = 500,
                 flab = "",
                 cexlab = 1.5,
                 cexaxis = 1.2,
                 palette = reverse.gray.colors.1,
                 main = expression(italic("Pulsatrix perspicillata")))


dev.off()


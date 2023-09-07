# ARBIMON_Evaluation

This is the repository created for the evaluation of the template matching algorithm that ARBIMON provides.


### Data explanaition ###

*EXPERTO_Itgo4_T2*: This document has the manual annotations done by the team. 
This was the data used to compare to the matches obtained by thepattern-matching algorithm. 
It has 3 columns:

	*filename: 		Name of each audio file.
	*Experto_Pulsatrix:	This column has the manual annotations for P. perspicillata.
			  	1 when the species was registered at least once on that recording.
				0 when the species was not registered.
	*Experto_Nyctidromus:	This column has the manual annotations for N. nyctidromus.
			  	1 when the species was registered at least once on that recording.
				0 when the species was not registered.

*T2_Itgo4_th0.2_Bujio_EV*: This document contains the matches found by Arbimon after conducting
a pattern-matching algorithm for Nyctidromus albicollis (also known as Bujio in spanish)
over the recordings from Itgo4, season 2.
It has 2 columns:

	*recording:		Name of each audio file.
	*score: 		similarity score calculated by Arbimon.


*T2_Itgo4_tho0.2_Pulsatrix_Ev*: This document contains the matches found by Arbimon after conducting
a pattern-matching algorithm for Pulsatrix perspicillata over the recordings from Itgo4, season 2.
It has 2 columns:

	*recording:		Name of each audio file.
	*score: 		similarity score calculated by Arbimon.

*measurements_V2_26.04.2023_PPnNA*: Measures of different signals of both species.
This measurements are already cleaned and were extracted through the use of Raven Pro 1.6.
It has 3 columns:

	*Specie: 		Genus name to wich the following measurements correspond to.
	*Freq_(Hz):		Frequency values of the measured features in Hz
	*Type_Freq_(Hz):	Measured feature (Low, High or Peak frequencies).


*muestra.csv*: Measures arranged for the levene test.
It has 3 columns:

	*Especie:		Genus name to which the following measurements correspond to
	*Low:			Low freqencies in Hz
	*High:			High frequencies in Hz
	*Peack:			Peak frequencies in Hz
	*Sitio:			Sampling units from which the data was obtained


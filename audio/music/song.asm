; Approximate Game Boy reduction of the provided 2026-04-24 WAV clip.
; Focused on the strongest opening phrase with a shorter loop and
; a more present bass line for title screen testing.

Music_Song::
	channel_count 3
	channel 1, Music_Song_Ch1
	channel 2, Music_Song_Ch2
	channel 3, Music_Song_Ch3

Music_Song_Ch1::
	tempo 140
	volume 7, 7
	duty_cycle 3
	vibrato 6, 2, 3
	note_type 12, 11, 4
.mainloop:
	octave 4
	note C_, 2
	note C_, 2
	rest 2
	note C_, 2
	note D#, 2
	note C_, 2
	note G_, 2
	note F#, 2
	note C_, 2
	note C_, 2
	rest 2
	note C_, 2
	note D#, 2
	note C_, 2
	note G_, 2
	note F#, 2

	note C_, 2
	note C_, 2
	rest 2
	note C_, 2
	note D#, 2
	note C_, 2
	note G_, 2
	note F#, 2
	note C_, 2
	note C_, 2
	note G#, 2
	note A#, 2
	note_type 12, 10, 5
	note G#, 3
	note_type 12, 11, 4
	note A#, 1
	note G_, 2
	note F#, 2
	rest 2

	note_type 12, 11, 5
	note G#, 2
	note G#, 2
	octave 5
	note C_, 2
	note D#, 2
	note C_, 2
	octave 4
	note G#, 2
	note F#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note F#, 2
	note G_, 2
	rest 2

	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 5
	note_type 12, 10, 5
	note C_, 1
	note D#, 1
	note F_, 2
	note_type 12, 11, 4
	note D#, 2
	note C_, 2
	octave 4
	note G#, 2
	note G_, 2
	note F#, 2
	rest 2
	sound_loop 0, .mainloop

Music_Song_Ch2::
	duty_cycle 2
	vibrato 8, 1, 3
	note_type 12, 10, 2
.mainloop:
	octave 4
	note C_, 2
	rest 6
	octave 3
	note A#, 2
	rest 6

	note C_, 2
	rest 6
	octave 3
	note A_, 2
	rest 6

	note C_, 2
	rest 6
	octave 3
	note G#, 2
	rest 6

	note D_, 2
	rest 6
	octave 3
	note G#, 2
	rest 6

	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2

	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2

	octave 3
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2

	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	rest 4
	rest 2
	sound_loop 0, .mainloop

Music_Song_Ch3::
	note_type 12, 1, 2
.mainloop:
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	sound_loop 0, .mainloop

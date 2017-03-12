# FVocoder

[![Join the chat at https://gitter.im/FVocoder/Lobby](https://badges.gitter.im/FVocoder/Lobby.svg)](https://gitter.im/FVocoder/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](https://travis-ci.org/nicb/FVocoder.svg?branch=master)](https://travis-ci.org/nicb/FVocoder)

Freiburg Vocoder simulation

## Description

* 48-bank 1-tone elliptic filter
* mono output
* matrix between analysis (envelope following) and resynthesis
* usage of the two filter banks separately (switching on and off selected filters)
* OSC control for filter switching

## Output snapshots

* Filter bank frequency response
  ![filter bank frequency response](./doc/filter_bank_freq_response.png)
* Filter bank output with a real signal
  ![filter bank output](./doc/filter_bank_mesh.png)
* Envelope follower bank output with a real signal
  ![envelope follower bank output](./doc/envelope_follower_bank_surf.png)

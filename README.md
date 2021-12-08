## Glow-TTS Official Repository  

Glow-TTS: A Generative Flow for Text-to-Speech via Monotonic Alignment Search  

- Github [https://github.com/jaywalnut310/glow-tts](https://github.com/jaywalnut310/glow-tts)  

- Paper [https://arxiv.org/abs/2005.11129](https://arxiv.org/abs/2005.11129)   

- Demo [https://jaywalnut310.github.io/glow-tts-demo/index.html](https://jaywalnut310.github.io/glow-tts-demo/index.html)  

## Multispeaker enabled Glow-tts

Glow-tts with korean cleaner, enabled multispeaker training (reffering to some of issues).  

This repo **recommended to be used as a reference** for multispeaker training.  

`_custom` : executed with korean cleaners.  

`_custom_multi` : executed with korean cleaners, for multispeaker training.  

Single korean speaker demo with [KSS](https://www.kaggle.com/bryanpark/korean-single-speaker-speech-dataset) is available. [link](https://eirene-aisa.notion.site/Glow-TTS-Demo-Korean-6ec78816350e495fa468792bf958d241)


### Korean cleaner  

- from Pitchtron [https://github.com/hash2430/pitchtron](https://github.com/hash2430/pitchtron)  

### Solved issues  

- Due to [apex](https://github.com/NVIDIA/apex)(commit: 37cdaf4) dependency, I used pytorch 1.3.0 (instead of 1.2.0)  

- For multispeaker setting

  - filelist should be in followed format.  
  
    `audio_path(*.wav)|speaker_id|transcript` [related issue](https://github.com/jaywalnut310/glow-tts/issues/13)  

  - Add n_speakers, gin_channels to config is recommended. [related issue](https://github.com/jaywalnut310/glow-tts/issues/4)  

  - (`TextMelLoader`, `TextMelCollate`) should be replaced with (`TextMelSpeakerLoader`, `TextMelSpeakerCollate`) in `init.py`, `train.py`  
  
    Also, edit `(x, x_lengths, y, y_lengths)` to `(x, x_lengths, y, y_lengths, g)`.  

  - Usage of speaker information(g) should be delievered explicitly to FlowGenerator. [related issue](https://github.com/jaywalnut310/glow-tts/issues/56)   
  
    `generator(x=x, x_lengths=x_lengths, y=y, y_lengths=y_lengths, g=g, gen=False)` (I do not know why)

- 'Gradient overflow' might be caused due to data problem. [related issue](https://github.com/jaywalnut310/glow-tts/issues/36)  

## 1. Environments (edited)

* Python==3.6.9
* pytorch==1.3.0
* cython==0.29.12
* librosa==0.7.1
* numpy==1.16.4
* scipy==1.5.4
* nltk==3.6.5

## 2. Pre-requisites

Please check official repository. 

## 3. Training Example

```sh
sh train_custom_multi_ddi.sh configs/base.json base
```

## 4. Inference Example

See [inference.ipynb](./inference.ipynb)
